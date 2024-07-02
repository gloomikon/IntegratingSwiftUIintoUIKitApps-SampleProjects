//
//  RecipeController.swift
//  DinnerPlan-final
//
//  Created by Natalia Panferova on 29/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import Foundation

class RecipeController {
    
    // This function could be fetching the recipe
    // from a server using URLSession async API
    static func getRecipeOfTheDay(
        for dinnerTime: DateComponents
    ) async -> Recipe {
        let dinnerDate = DinnerTimeController.nextDinnerDate(matching: dinnerTime)
        let day = Calendar.current.dateComponents(
            [.day], from: dinnerDate
        )
        let recipeIndex = day.day! % recipes.count
        return recipes[recipeIndex]
    }
    
    static let recipeUrl =  URL(string: "dinnerplan-final://recipe")!
    
    static private let recipes = [
        Recipe(
            name: "Tomato and basil pasta",
            description: """
            Fry onions and add tomato paste.
            Cook pasta.
            Add pasta to the frying pan over low heat and stir together.
            Combine pasta with plenty of basil leaves and serve.
            """,
            image: "pasta",
            imageDescription: """
            Tomato pasta served on a round plate with fresh basil leaves on top.
            """
        ),
        Recipe(
            name: "Creamy mushroom soup",
            description: """
            Sautée mushrooms and onions in a saucepan.
            Pour in vegetable stock, bring to a boil, turn down the heat and let simmer.
            Remove the soup from heat and blend it.
            Whisk in heavy cream and season to taste.
            """,
            image: "soup",
            imageDescription: """
            Mushroom soup in a small pot with a slice of mushroom on top.
            """
        ),
        Recipe(
            name: "Mixed salad",
            description: """
            Cut vegetables into bite-sized pieces.
            Combine everything in a large bowl.
            Pour dressing over the salad and serve.
            """,
            image: "salad",
            imageDescription: """
            Green salad leaves with sliced radishes and cherry tomatoes in a shallow round bowl.
            """
        ),
        Recipe(
            name: "Vegetable stew",
            description: """
            Chop vegetables, place them into a pot and fry over medium heat.
            Add stock and bring to a boil.
            Reduce the heat to medium-low and simmer for 30 minutes.
            """,
            image: "stew",
            imageDescription: """
            Multiple small bowls of vegetable stew with vegetable garnish on top.
            """
        ),
        Recipe(
            name: "Roast potatoes",
            description: """
            Cut potatoes into even-sized pieces.
            Coat the potatoes with oil and spread them on a tray.
            Roast the potatoes for 20 minutes, then take them out of the oven and turn them over.
            Put the potatoes back in the oven for another 15 minutes.
            """,
            image: "potatoes",
            imageDescription: """
            Oven roasted potato chunks on a round plate with herbs sprinkled over the top.
            """
        )
    ]
}
