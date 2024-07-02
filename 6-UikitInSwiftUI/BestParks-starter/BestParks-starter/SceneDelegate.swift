//
//  SceneDelegate.swift
//  BestParks-starter
//
//  Created by Natalia Panferova on 1/09/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func sceneDidEnterBackground(_ scene: UIScene) {
        if let navigationVC = window?.rootViewController as? UINavigationController,
           let parkVC = navigationVC.viewControllers.first as? ParksViewController {
            Task {
                await parkVC.parksController.saveParks()
            }
        }
    }
}
