//
//  ActivitiesViewController.swift
//  FunActivities-starter
//
//  Created by Natalia Panferova on 26/08/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {
    enum Section: CaseIterable {
        case main
    }
    
    private let activitiesController = ActivitiesController()
    
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Activity.ID>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Activities"
        
        let config = UICollectionLayoutListConfiguration(
            appearance: .insetGrouped
        )
        let layout = UICollectionViewCompositionalLayout
            .list(using: config)
        collectionView = UICollectionView(
            frame: view.bounds, collectionViewLayout: layout
        )
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.allowsSelection = false
        view.addSubview(collectionView)
        
        configureDataSource()
        activitiesController.addDefaultActivities()
        updateUI()
    }

    private func configureDataSource() {
        let cellRegistration = UICollectionView
            .CellRegistration<UICollectionViewListCell, Activity>
        { [unowned self] (cell, indexPath, activity) in
            configureActivityCell(cell, for: activity)
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Activity.ID>(
            collectionView: collectionView
        ) { [unowned self] (collectionView, indexPath, activityID) in
            let activity = activitiesController.activity(for: activityID)!
            
            let activityCell = collectionView
                .dequeueConfiguredReusableCell(
                    using: cellRegistration, for: indexPath, item: activity
                )
            
            return activityCell
        }
    }
    
    private func configureActivityCell(
        _ cell: UICollectionViewListCell, for activity: Activity
    ) {
        // configure the cell
    }
    
    private func updateUI() {
        let activityIDs = activitiesController.activities
            .map { $0.id }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Activity.ID>()
        snapshot.appendSections([.main])
        snapshot.appendItems(activityIDs, toSection: .main)
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    @IBAction func addNewActivity(_ sender: Any) {
        activitiesController.addActivity()
        updateUI()
    }
}

