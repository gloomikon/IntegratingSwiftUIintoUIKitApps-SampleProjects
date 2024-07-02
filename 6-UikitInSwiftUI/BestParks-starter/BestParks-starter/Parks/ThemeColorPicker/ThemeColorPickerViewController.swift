//
//  ThemeColorPickerViewController.swift
//  BestParks-starter
//
//  Created by Natalia Panferova on 2/09/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import UIKit

class ThemeColorPickerViewController: UIViewController {
    var park: Park!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        
        let pickerView = ThemeColorPickerView()
        pickerView.delegate = self
        
        view.addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickerView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 20
            ),
            pickerView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 14
            ),
            pickerView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -14
            ),
            pickerView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -14
            ),
        ])
    }
}

extension ThemeColorPickerViewController: ThemeColorPickerDelegate {
    func themeColorPickerView(didSelectColor color: UIColor) {
        park.themeColor = color.cgColor
        NotificationCenter.default.post(
            name: .parksDidChange,
            object: self,
            userInfo: [
                ParksController.parkIDsUserInfoKey: [park.id]
            ]
        )
        dismiss(animated: true)
    }
}

class ThemeColorPickerNavigationController: UINavigationController {
    var park: Park!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let themePickerController = ThemeColorPickerViewController()
        themePickerController.park = park
        
        themePickerController.navigationItem.title = "Pick park theme color"
        let button = UIBarButtonItem(systemItem: .cancel)
        button.primaryAction = UIAction { [weak self] _ in
            self?.dismiss(animated: true)
        }
        themePickerController.navigationItem.leftBarButtonItem = button
        
        viewControllers = [themePickerController]
    }
}
