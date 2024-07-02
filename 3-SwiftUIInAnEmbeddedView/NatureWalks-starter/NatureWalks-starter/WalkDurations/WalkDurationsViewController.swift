//
//  WalkDurationsViewController.swift
//  NatureWalks-starter
//
//  Created by Natalia Panferova on 22/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import UIKit

class WalkDurationsViewController: UIViewController {
    var walks: [Walk] = [] {
        didSet {
            walkDurations.original = walks.map {
                WalkDuration(title: $0.title, duration: $0.duration)
            }
        }
    }
    
    let walkDurations = WalkDurations()
    
    var scrollView: UIScrollView!
    var shortestWalkHeaderLabel: UILabel!
    var shortestWalkLabel: UILabel!
    var longestWalkHeaderLabel: UILabel!
    var longestWalkLabel: UILabel!
    var sortDurationsSwitch: UISwitch!
    var sortDurationsSwitchStack: UIStackView!
    
    var durationsStack: UIStackView?
    
    override func viewDidLoad() {
        setupScrollView()
        
        addShortestWalkLabels()
        addLongestWalkLabels()
        addSortDurationsSwitch()
        
        addDurationsStack()
    }
    
    private func updateDurationsStack() {
        guard let durationsStack = durationsStack else { return }
        
        let walksToShow = walkDurations.sortingIsOn
            ? walkDurations.sorted : walkDurations.original
    
        for (subview, walk) in zip(
            durationsStack.arrangedSubviews, walksToShow
        ) {
            if let label = subview as? UILabel {
                label.text = "\(walk.title): \(walk.duration)"
            }
        }
    }
    
    func sortingChanged(_ action: UIAction) {
        walkDurations.sortingIsOn = sortDurationsSwitch.isOn
        updateDurationsStack()
    }
    
    @IBAction func dismissDurations(_ sender: Any) {
        dismiss(animated: true)
    }
}
