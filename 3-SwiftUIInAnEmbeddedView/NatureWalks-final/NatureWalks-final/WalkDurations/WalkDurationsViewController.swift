//
//  WalkDurationsViewController.swift
//  NatureWalks-final
//
//  Created by Natalia Panferova on 22/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import UIKit
import SwiftUI

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
        
        if #available(iOS 16, *) {
            addDurationsChart()
        } else {
            addDurationsStack()
        }
    }
    
    @available(iOS 16, *)
    private func addDurationsChart() {
        let chart = WalkDurationsChart(walkDurations: walkDurations)
        let chartController = UIHostingController(rootView: chart)
        
        self.addChild(chartController)
        self.scrollView.addSubview(chartController.view)
        chartController.didMove(toParent: self)
                
        chartController.view.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            chartController.view.topAnchor.constraint(
                equalTo: sortDurationsSwitchStack.bottomAnchor,
                constant: 20
            ),
            chartController.view.leadingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.leadingAnchor,
                constant: 14
            ),
            chartController.view.trailingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.trailingAnchor,
                constant: -14
            ),
            chartController.view.bottomAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.bottomAnchor,
                constant: -14
            ),
            chartController.view.heightAnchor.constraint(
                greaterThanOrEqualToConstant: 300
            )
        ])
    }
    
    private func updateDurationsStack() {
        // only present on iOS versions below iOS 16
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
