//
//  ViewController.swift
//  DinnerPlan-starter
//
//  Created by Natalia Panferova on 29/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import UIKit

class DinnerViewController: UITableViewController {
    private var recipe: Recipe?
    
    @IBOutlet weak var dinnerTimePicker: UIDatePicker!
    
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var recipeCell: UITableViewCell!
    
    private var loadingTask: Task<Void, Never>?
    
    private var dinnerTime: DateComponents {
        Calendar.current.dateComponents(
            [.hour, .minute], from: dinnerTimePicker.date
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDinnerTime()
        fetchRecipe()
    }
    
    func setDinnerTime() {
        let dinnerTime = DinnerTimeController.getDinnerTime()
        if let dinnerDate = Calendar.current.date(from: dinnerTime) {
            dinnerTimePicker.setDate(dinnerDate, animated: false)
        }
    }
    
    func fetchRecipe() {
        loadingTask?.cancel()
        recipeNameLabel.text = "Recipe of the day is loading..."
        
        loadingTask = Task {
            let recipe = await RecipeController.getRecipeOfTheDay(
                for: dinnerTime
            )
            recipeDidLoad(recipe)
        }
    }
    
    func recipeDidLoad(_ recipe: Recipe) {
        self.recipe = recipe
        recipeNameLabel.text = recipe.name
        recipeImageView.image = UIImage(named: recipe.image)
        
        recipeCell.selectionStyle = .default
        recipeCell.isUserInteractionEnabled = true
        recipeCell.isAccessibilityElement = true
        recipeCell.accessibilityTraits = [.button]
    }
    
    
    @IBAction func dinnerTimeChanged(_ sender: UIDatePicker) {
        DinnerTimeController.saveDinnerTime(dinnerTime)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? RecipeViewController {
            controller.recipe = recipe
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        loadingTask?.cancel()
        loadingTask = nil
    }
}
