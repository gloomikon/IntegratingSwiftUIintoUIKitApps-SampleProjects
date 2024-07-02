//
//  ExercisesController.swift
//  PuppyTraining-starter
//
//  Created by Natalia Panferova on 14/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import Foundation

class ExercisesController {
    let exercises = [
        Exercise(
            title: "Twist",
            description: "Your dog turns in a tight circle on the spot.",
            difficulty: .easy,
            steps: [
                "Move your arm in a wide circle around the dog while holding a treat",
                "Encourage the dog to follow the food in your hand",
                "Reward the dog after they do a full circle",
                "Repeat a few times and introduce a verbal command"
            ]
        ),
        Exercise(
            title: "Shake paws",
            description: "Your dog lifts up a paw for you to shake gently.",
            difficulty: .easy,
            steps: [
                "Ask your dog to sit in front of you",
                "Hold some treats in our hand",
                "When the dog lifts up a paw to ask for a treat, reward them",
                "Repeat and introduce a verbal cue"
            ]
        ),
        Exercise(
            title: "Fetch leash",
            description: "Your dog brings you the leash when asked.",
            difficulty: .medium,
            steps: [
                "Ask the dog to sit in front of you",
                "Place the leash next to the dog",
                "Reward every time the dog touches the leash",
                "Place the leash farther away",
                "Begin to introduce a verbal cue"
            ]
        ),
        Exercise(
            title: "Close door",
            description: "Your dog closes the door by pushing it.",
            difficulty: .medium,
            steps: [
                "Show a sticky note to the dog and reward them when they show interest",
                "Stick the note to the door",
                "Praise and reward the dog when they touch the note and push the door",
                "Introduce a command",
                "Remove the sticky note",
                "Try a different door"
            ]
        ),
        Exercise(
            title: "Tidy toys",
            description: "Your dog collects all their toys into a box.",
            difficulty: .hard,
            steps: [
                "Position the box in front of the dog",
                "Practice dropping a toy into the box",
                "Start adding some distance from the box",
                "Reinforce that the idea is to put the toys in the box if they miss the box"
            ]
        )
    ]
}
