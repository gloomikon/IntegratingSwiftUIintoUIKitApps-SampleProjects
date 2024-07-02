//
//  ExercisesViewController.swift
//  PuppyTraining-starter
//
//  Created by Natalia Panferova on 14/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import UIKit

class ExercisesViewController: UIViewController, UICollectionViewDelegate {
    enum Section: CaseIterable {
        case main
    }
    
    private let exercisesController = ExercisesController()
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Exercise>!

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
    }
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView
            .CellRegistration<UICollectionViewListCell, Exercise>
        { (cell, indexPath, exercise) in
            var content = cell.defaultContentConfiguration()
            content.text = exercise.title
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
    
    private func updateUI(animated: Bool) {
        let exercises = exercisesController.exercises
        var snapshot = NSDiffableDataSourceSnapshot<Section, Exercise>()
        snapshot.appendSections([.main])
        snapshot.appendItems(exercises, toSection: .main)
        
        dataSource.apply(snapshot, animatingDifferences: animated)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        guard let exercise = dataSource.itemIdentifier(for: indexPath) else {
            return
        }
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print("did select exercise: \(exercise.title)")
    }
}
