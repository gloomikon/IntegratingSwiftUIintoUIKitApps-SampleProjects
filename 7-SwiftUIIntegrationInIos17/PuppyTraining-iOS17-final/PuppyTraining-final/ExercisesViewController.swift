//
//  ExercisesViewController.swift
//  PuppyTraining-final
//
//  Created by Natalia Panferova on 14/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import UIKit
import SwiftUI


class ExercisesViewController: UIViewController, UICollectionViewDelegate {
    enum Section: CaseIterable {
        case main
    }
    
    private let exercisesController = ExercisesController()
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Exercise>!
    private let filterState = ExerciseFilterState()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Training Exercises"
        let config = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: config)

        collectionView = UICollectionView(
            frame: view.bounds, collectionViewLayout: layout
        )
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
        collectionView.delegate = self
        
        configureDataSource()
        updateUI(animated: false)
        
        self.registerForTraitChanges(
            [CustomThemeTrait.self]
        ) { (self: Self, previousTraitCollection: UITraitCollection) in
            self.updateLayoutForTheme()
        }
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        self.updateLayoutForTheme()
    }
    
    private func updateLayoutForTheme() {
        if self.traitCollection.customThemeEnabled {
            let listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
            let listLayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
            self.collectionView.setCollectionViewLayout(listLayout, animated: true)
        } else {
            let listConfiguration = UICollectionLayoutListConfiguration(appearance: .plain)
            let listLayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
            self.collectionView.setCollectionViewLayout(listLayout, animated: true)
        }
    }
        
    private func configureDataSource() {
        let cellRegistration = UICollectionView
            .CellRegistration<UICollectionViewListCell, Exercise>
        { (cell, indexPath, exercise) in
            var content = cell.defaultContentConfiguration()
            content.text = exercise.title
            content.textProperties.color = UIColor { traits in
                if traits.customThemeEnabled {
                    return .systemPurple
                } else {
                    return .label
                }
            }
            
            content.secondaryText = exercise.description
            cell.contentConfiguration = content
            cell.accessibilityTraits = [.button]
            cell.accessibilityHint = "Navigate to the exercise detail view"
            
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Exercise>(
            collectionView: collectionView
        ) { (collectionView, indexPath, exercise) in
            let exerciseCell = collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration, for: indexPath, item: exercise
            )
            
            return exerciseCell
        }
    }
    
    private func updateUI(
        animated: Bool
    ) {
        
        let filterSelection = withObservationTracking {
            filterState.selection
        } onChange: { [weak self] in
            DispatchQueue.main.async { [weak self] in
                self?.updateUI(animated: true)
            }
        }
        
        let exercises = exercisesController.exercises
            .filter { exercise in
                filterSelection
                    .map { $0 == exercise.difficulty } ?? true
            }
        
        var snapshot = NSDiffableDataSourceSnapshot<
            Section, Exercise
        >()

        snapshot.appendSections([.main])
        snapshot.appendItems(exercises, toSection: .main)
        
        dataSource.apply(snapshot, animatingDifferences: animated)
    }
    
    @IBSegueAction func showFilter(_ coder: NSCoder) -> UIViewController? {
        let filterView = ExerciseFilterView(
            filterState: filterState
        )
        let controller = UIHostingController(
            coder: coder, rootView: filterView
        )
        controller?.sheetPresentationController?.detents = [
            .medium()
        ]
        return controller
    }
    func collectionView(
            _ collectionView: UICollectionView,
            didSelectItemAt indexPath: IndexPath
        ) {
            guard
                let exercise = dataSource.itemIdentifier(
                    for: indexPath
                )
            else { return }
            
            collectionView.deselectItem(at: indexPath, animated: true)
            
            let detailView = ExerciseDetail(exercise: exercise)
            let detailController = UIHostingController(
                rootView: detailView
            )
            detailController.navigationItem.title = exercise.title
            navigationController?.pushViewController(
                detailController, animated: true
            )
        }
    
    @IBAction func toggleTheme(_ sender: Any) {
        guard let window = self.view.window else {
            return
        }
        
        if window.traitCollection.customThemeEnabled  {
            window.traitOverrides.customThemeEnabled = false
            themeToggleButton.image = UIImage(systemName: "swatchpalette")

        } else {
            window.traitOverrides.customThemeEnabled = true
            themeToggleButton.image = UIImage(systemName: "swatchpalette.fill")
        }
    }
    @IBOutlet weak var themeToggleButton: UIBarButtonItem!
}
