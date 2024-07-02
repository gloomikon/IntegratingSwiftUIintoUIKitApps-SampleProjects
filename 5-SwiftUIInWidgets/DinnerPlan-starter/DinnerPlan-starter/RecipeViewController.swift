//
//  RecipeViewController.swift
//  DinnerPlan-starter
//
//  Created by Natalia Panferova on 29/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {
    var recipe: Recipe?
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeDescriptionLabel: UILabel!
    
    private var loadingTask: Task<Void, Never>?
    
    override func viewDidLoad() {
        if let recipe = recipe {
            setRecipe(recipe)
            UIAccessibility.post(
                notification: UIAccessibility.Notification.screenChanged,
                argument: self.recipeImageView
            )
        } else {
            loadingTask?.cancel()
            recipeNameLabel.text = "Recipe of the day is loading..."
            recipeDescriptionLabel.isHidden = true
            
            let dinnerTime = DinnerTimeController.getDinnerTime()
            loadingTask = Task {
                let recipe = await RecipeController.getRecipeOfTheDay(
                    for: dinnerTime
                )
                setRecipe(recipe)
            }
        }
    }
    
    func setRecipe(_ recipe: Recipe) {
        recipeImageView.image = UIImage(named: recipe.image)
        recipeImageView.isAccessibilityElement = true
        recipeImageView.accessibilityTraits = .none
        recipeImageView.accessibilityLabel = recipe.imageDescription
        
        recipeNameLabel.text = recipe.name
        recipeDescriptionLabel.text = recipe.description
        recipeDescriptionLabel.isHidden = false
        
        UIAccessibility.post(
            notification: UIAccessibility.Notification.layoutChanged,
            argument: self.recipeImageView
        )
    }
}
