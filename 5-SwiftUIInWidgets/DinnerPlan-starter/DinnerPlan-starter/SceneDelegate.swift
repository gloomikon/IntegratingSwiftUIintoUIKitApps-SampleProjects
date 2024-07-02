//
//  SceneDelegate.swift
//  DinnerPlan-starter
//
//  Created by Natalia Panferova on 29/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene, willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        openRecipe(from: connectionOptions.urlContexts)
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        openRecipe(from: URLContexts)
    }
    
    private func openRecipe(from URLContexts: Set<UIOpenURLContext>) {
        guard
            let firstUrl = URLContexts.first?.url,
            firstUrl == RecipeController.recipeUrl,
            let rootVC = window?.rootViewController as? UINavigationController,
            let recipeVC = UIStoryboard(name: "Main", bundle: .main)
                .instantiateViewController(withIdentifier: "RecipeController")
                as? RecipeViewController
        else {
            return
        }
        
        rootVC.pushViewController(recipeVC, animated: false)
    }
}
