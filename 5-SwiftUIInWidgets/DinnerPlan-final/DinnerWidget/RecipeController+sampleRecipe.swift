//
//  RecipeController+sampleRecipe.swift
//  DinnerWidgetExtension
//
//  Created by Natalia Panferova on 17/10/23.
//  Copyright © 2023 NIL COALESCING LIMITED. All rights reserved.
//

import Foundation

extension RecipeController {
    static let sampleRecipe = Recipe(
        name: "Tomato and basil pasta",
        description: """
        Fry onions and add tomato paste.
        Cook pasta.
        Add pasta to the frying pan over low heat and stir together.
        Combine pasta with plenty of basil leaves and serve.
        """,
        image: "pasta",
        imageDescription: """
        Tomato pasta served on a round plate \
        with fresh basil leaves on top.
        """
    )
}
