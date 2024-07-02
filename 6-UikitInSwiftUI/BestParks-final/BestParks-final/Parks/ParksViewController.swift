//
//  ParksViewController.swift
//  BestParks-final
//
//  Created by Natalia Panferova on 2/09/22.
//  Copyright © 2022 NIL COALESCING LIMITED. All rights reserved.
//

import UIKit

class ParksViewController: UIViewController {
    enum Section: CaseIterable {
        case main
    }
    
    let parksController = ParksController()
    
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Park.ID>!
    
    @IBOutlet weak var addParkButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Parks"
        
        configureCollectionView()
        configureDataSource()
        loadData()
        
        NotificationCenter.default.addObserver(
            self, selector: #selector(parksDidChange(_:)),
            name: .parksDidChange, object: nil)
    }

    private func configureCollectionView() {
        var config = UICollectionLayoutListConfiguration(
            appearance: .insetGrouped
        )
        config.trailingSwipeActionsConfigurationProvider = { indexPath in
            let delete = UIContextualAction(
                style: .destructive, title: "Delete"
            ) { [weak self] _, _, completion in
                self?.deletePark(at: indexPath)
                completion(true)
            }
            delete.image = UIImage(systemName: "trash.fill")
            
            let changeTheme = UIContextualAction(
                style: .normal, title: "Change theme color"
            ) { [weak self] _, _, completion in
                self?.presentThemePicker(for: indexPath)
                completion(true)
            }
            changeTheme.image = UIImage(
                systemName: "paintbrush.pointed.fill"
            )
            
            return UISwipeActionsConfiguration(
                actions: [delete, changeTheme]
            )
        }
        
        let layout = UICollectionViewCompositionalLayout
            .list(using: config)
        collectionView = UICollectionView(
            frame: view.bounds, collectionViewLayout: layout
        )
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView
            .CellRegistration<UICollectionViewListCell, Park>
        { (cell, indexPath, park) in
            var content = cell.defaultContentConfiguration()
            
            content.text = park.name
            if let color = park.themeColor {
                content.textProperties.color = UIColor(cgColor: color)
            }
            let date = park.visitingDate.formatted(
                .dateTime.day().month().year()
            )
            content.secondaryText = "Visiting date: \(date)"
            cell.contentConfiguration = content
            cell.accessories = [.disclosureIndicator()]
            cell.accessibilityTraits = [.button]
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Park.ID>(
            collectionView: collectionView
        ) { [unowned self] (collectionView, indexPath, parkID) in
            let park = parksController.park(for: parkID)!
            let parkCell = collectionView
                .dequeueConfiguredReusableCell(
                    using: cellRegistration, for: indexPath, item: park
                )
            return parkCell
        }
    }
    
    private func updateCollectionView() {
        let parkIDs = parksController.parks
            .map { $0.id }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Park.ID>()
        snapshot.appendSections([.main])
        snapshot.appendItems(parkIDs, toSection: .main)
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func loadData() {
        Task { [ weak self] in
            guard let self else { return }
            await self.parksController.loadParks()
            self.updateCollectionView()
            self.addParkButton.isEnabled = self.parksController.canAddParks
        }
    }
    
    private func deletePark(at indexPath: IndexPath) {
        guard let parkID = dataSource
            .itemIdentifier(for: indexPath)
        else { return }
        
        parksController.deletePark(id: parkID)
        updateCollectionView()
        addParkButton.isEnabled = parksController.canAddParks
    }
    
    @IBAction func addPark(_ sender: Any) {
        parksController.addPark()
        updateCollectionView()
        addParkButton.isEnabled = parksController.canAddParks
    }
    
    @objc
    private func parksDidChange(_ notification: NSNotification) {
        guard
            let info = notification.userInfo,
            let parkIDs = info[
                ParksController.parkIDsUserInfoKey
            ] as? [Park.ID]
        else { return }
        
        var snapshot = self.dataSource.snapshot()
        snapshot.reconfigureItems(parkIDs)
        self.dataSource.apply(snapshot)
    }
    
    private func presentThemePicker(for indexPath: IndexPath) {
        guard
            let parkID = dataSource.itemIdentifier(for: indexPath),
            let park = parksController.park(for: parkID)
        else { return }
        
        let controller = ThemeColorPickerNavigationController()
        controller.park = park
        controller.sheetPresentationController?.detents = [.medium()]
        
        present(controller, animated: true)
    }
}

extension ParksViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        guard
            let parkID = dataSource.itemIdentifier(for: indexPath),
            let park = parksController.park(for: parkID),
            let detailController = UIStoryboard(name: "Main", bundle: .main)
                .instantiateViewController(withIdentifier: "ParkDetail")
                    as? ParkDetailViewController
        else { return }
        
        detailController.park = park
        navigationController?.pushViewController(
            detailController, animated: true
        )
        
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
