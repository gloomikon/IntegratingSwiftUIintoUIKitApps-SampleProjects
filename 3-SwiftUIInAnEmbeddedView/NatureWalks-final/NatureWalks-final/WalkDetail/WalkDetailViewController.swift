//
//  WalkDetailViewController.swift
//  NatureWalks-final
//
//  Created by Natalia Panferova on 22/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import UIKit

class WalkDetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    var walk: Walk!
    
    override func viewDidLoad() {
        imageView.image = UIImage(named: walk.image)
        imageView.isAccessibilityElement = true
        imageView.accessibilityTraits = .none
        imageView.accessibilityLabel = walk.imageDescription
        descriptionLabel.text = walk.description
        UIAccessibility.post(
            notification: UIAccessibility.Notification.screenChanged,
            argument: self.imageView
        )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let view = WalkInfoWrapperView(walk: walk)
        if let controller = segue.destination as? WalkInfoViewController {
            controller.rootView = view
            controller.view
                .translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
