//
//  ParkDetailViewController.swift
//  BestParks-final
//
//  Created by Natalia Panferova on 2/09/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import UIKit

class ParkDetailViewController: UIViewController {
    var park: Park!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var visitingDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureImage()
        configureLabels()
        configureDatePicker()
        
        UIAccessibility.post(
            notification: UIAccessibility.Notification.layoutChanged,
            argument: self.imageView
        )
    }
    
    private func configureImage() {
        imageView.image = UIImage(named: park.image)
        imageView.isAccessibilityElement = true
        imageView.accessibilityTraits = .none
        imageView.accessibilityLabel = park.imageDescription
    }
    
    private func configureLabels() {
        nameLabel.text = park.name
        if let themeColor = park.themeColor {
            nameLabel.textColor = UIColor(cgColor: themeColor)
        }
        descriptionLabel.text = park.description
    }
    
    private func configureDatePicker() {
        visitingDatePicker.minimumDate = Calendar.current.date(
            byAdding: .day, value: 1, to: Date()
        )
        visitingDatePicker.setDate(
            park.visitingDate, animated: false
        )
    }
    
    @IBAction func visitingDateChanged(_ sender: UIDatePicker) {
        park.visitingDate = sender.date
        NotificationCenter.default.post(
            name: .parksDidChange,
            object: self,
            userInfo: [
                ParksController.parkIDsUserInfoKey: [park.id]
            ]
        )
    }
}
