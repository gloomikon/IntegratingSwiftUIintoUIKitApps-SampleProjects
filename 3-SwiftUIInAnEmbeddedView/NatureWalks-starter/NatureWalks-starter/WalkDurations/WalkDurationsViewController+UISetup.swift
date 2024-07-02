//
//  WalkDurationsViewController+UISetup.swift
//  NatureWalks-starter
//
//  Created by Natalia Panferova on 22/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import UIKit

extension WalkDurationsViewController {
    func setupScrollView() {
        scrollView = UIScrollView()
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 0
            ),
            scrollView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 0
            ),
            scrollView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: 0),
            scrollView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: 0
            ),
            scrollView.contentLayoutGuide.widthAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.widthAnchor
            )
        ])
    }
    
    func addShortestWalkLabels() {
        shortestWalkHeaderLabel = UILabel()
        shortestWalkHeaderLabel.text = "Shortest walk:"
        shortestWalkHeaderLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        shortestWalkHeaderLabel.numberOfLines = 0
        
        shortestWalkLabel = UILabel()
        shortestWalkLabel.text = walkDurations.sorted.first?.title
        shortestWalkLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        shortestWalkLabel.numberOfLines = 0
        
        scrollView.addSubview(shortestWalkHeaderLabel)
        scrollView.addSubview(shortestWalkLabel)
        
        shortestWalkHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        shortestWalkLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            shortestWalkHeaderLabel.topAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.topAnchor,
                constant: 8
            ),
            shortestWalkHeaderLabel.leadingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.leadingAnchor,
                constant: 14
            ),
            shortestWalkHeaderLabel.trailingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.trailingAnchor,
                constant: -14
            ),
            
            shortestWalkLabel.topAnchor.constraint(
                equalTo: shortestWalkHeaderLabel.bottomAnchor,
                constant: 8
            ),
            shortestWalkLabel.leadingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.leadingAnchor,
                constant: 14
            ),
            shortestWalkLabel.trailingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.trailingAnchor,
                constant: -14
            )
        ])
    }
    
    func addLongestWalkLabels() {
        longestWalkHeaderLabel = UILabel()
        longestWalkHeaderLabel.text = "Longest walk:"
        longestWalkHeaderLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        longestWalkHeaderLabel.numberOfLines = 0
        
        longestWalkLabel = UILabel()
        longestWalkLabel.text = walkDurations.sorted.last?.title
        longestWalkLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        longestWalkLabel.numberOfLines = 0
        
        scrollView.addSubview(longestWalkHeaderLabel)
        scrollView.addSubview(longestWalkLabel)
        
        longestWalkHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        longestWalkLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            longestWalkHeaderLabel.topAnchor.constraint(
                equalTo: shortestWalkLabel.bottomAnchor,
                constant: 14
            ),
            longestWalkHeaderLabel.leadingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.leadingAnchor,
                constant: 14
            ),
            longestWalkHeaderLabel.trailingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.trailingAnchor,
                constant: -14
            ),
            
            longestWalkLabel.topAnchor.constraint(
                equalTo: longestWalkHeaderLabel.bottomAnchor,
                constant: 8
            ),
            longestWalkLabel.leadingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.leadingAnchor,
                constant: 14
            ),
            longestWalkLabel.trailingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.trailingAnchor,
                constant: -14
            )
        ])
    }
    
    func addSortDurationsSwitch() {
        let sortLabel = UILabel()
        sortLabel.text = "Sort walks by duration"
        sortLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        sortLabel.numberOfLines = 0
        
        sortDurationsSwitch = UISwitch(
            frame: .zero,
            primaryAction: UIAction(handler: sortingChanged))
        sortDurationsSwitch.isOn = false
        sortDurationsSwitch.onTintColor = .systemIndigo
        
        sortDurationsSwitchStack = UIStackView(
            arrangedSubviews: [sortLabel, sortDurationsSwitch]
        )
        sortDurationsSwitchStack.axis = .horizontal
        sortDurationsSwitchStack.distribution = .fill
        sortDurationsSwitchStack.alignment = .center
        sortDurationsSwitchStack.spacing = 8
        
        scrollView.addSubview(sortDurationsSwitchStack)
        
        sortDurationsSwitchStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sortDurationsSwitchStack.topAnchor.constraint(
                equalTo: longestWalkLabel.bottomAnchor,
                constant: 20
            ),
            sortDurationsSwitchStack.leadingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.leadingAnchor,
                constant: 14
            ),
            sortDurationsSwitchStack.trailingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.trailingAnchor,
                constant: -14
            )
        ])
    }
    
    func addDurationsStack() {
        let walksToShow = walkDurations.sortingIsOn
            ? walkDurations.sorted : walkDurations.original
        let labels = walksToShow.map { walk in
            let label = UILabel()
            label.text = "\(walk.title): \(walk.duration)"
            label.font = UIFont.preferredFont(forTextStyle: .body)
            label.numberOfLines = 0
            return label
        }
        let stack = UIStackView(arrangedSubviews: labels)
        
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 10
        
        scrollView.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(
                equalTo: sortDurationsSwitchStack.bottomAnchor,
                constant: 20
            ),
            stack.leadingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.leadingAnchor,
                constant: 14
            ),
            stack.trailingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.trailingAnchor,
                constant: -14
            ),
            stack.bottomAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.bottomAnchor,
                constant: -14
            )
        ])
        
        durationsStack = stack
    }
}
