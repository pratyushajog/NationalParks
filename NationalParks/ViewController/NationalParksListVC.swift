//
//  ViewController.swift
//  NationalParks
//
//  Created by Pratyusha Joginipally on 4/18/24.
//

import UIKit

class NationalParksListVC: UIViewController {

  enum Section {
    case main
  }

  var collectionView: UICollectionView!
  var dataSource: UICollectionViewDiffableDataSource<Section, Park>!
  var parks: [Park] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    configureCollectionView()
    configureViewController()
    getParks()
    configureDataSource()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: true)
  }

  func configureViewController() {
    view.backgroundColor = .blue
  }

  func configureCollectionView() {
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCustomCollectionViewFlowLayout())
    view.addSubview(collectionView)

    collectionView.backgroundColor = .systemBackground
    collectionView.register(ParkCollectionViewCell.self, forCellWithReuseIdentifier: ParkCollectionViewCell.reuseId)
  }

  func createCustomCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
    let width = view.bounds.width
    let padding: CGFloat = 8
    let minimumItemSpacing: CGFloat = 10
    let availableWidth = width - (minimumItemSpacing * 2)

    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    flowLayout.itemSize = CGSize(width: availableWidth, height: 200)

    return flowLayout
  }

  func configureDataSource() {
    dataSource = UICollectionViewDiffableDataSource<Section, Park>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, park) -> UICollectionViewCell? in
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ParkCollectionViewCell.reuseId, for: indexPath) as! ParkCollectionViewCell
      cell.set(park: park)
      return cell
    })
  }

  func updateData(on parks: [Park]) {
    var snapshot = NSDiffableDataSourceSnapshot<Section, Park>()
    snapshot.appendSections([.main])
    snapshot.appendItems(parks)
    DispatchQueue.main.async {
      self.dataSource.apply(snapshot, animatingDifferences: true)
    }
  }

  func getParks() {
    NetworkManager.shared.getParks(start: 0) { (parks, error) in
      self.parks = parks ?? []
      self.updateData(on: self.parks)
    }
  }
}

