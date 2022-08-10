//
//  MainViewController.swift
//  PhotoGallery
//
//  Created by Мария Ганеева on 05.08.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let horisontalInset: CGFloat = 16
        static let spaceBetweenElements: CGFloat = 7
        static let spaceBetweenRows: CGFloat = 8
        static let contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 16)
    }
    
    // MARK: - Views
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Private Properties
    private let model: MainModel = .init()
    private let searchButton = UIBarButtonItem(systemItem: .search)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRightBarButton()
        configureApperance()
        configureModel()
        model.getPosts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MainItemCollectionViewCell.self)", for: indexPath)
        if let cell = cell as? MainItemCollectionViewCell {
            let item = model.items[indexPath.row]
            cell.title = item.title
            cell.image = item.image
            cell.isFavorite = item.isFavorite
            cell.didFavoriteTapped = { [weak self] in
                self?.model.items[indexPath.row].isFavorite.toggle()
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (view.frame.width - Constants.horisontalInset * 2 - Constants.spaceBetweenElements) / 2
        return CGSize(width: itemWidth, height: 1.46 * itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Constants.spaceBetweenRows
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Constants.spaceBetweenElements
    }
}

// MARK: - Private Methods
private extension MainViewController {
    
    func configureApperance() {
        collectionView.register(UINib(nibName: "\(MainItemCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(MainItemCollectionViewCell.self)")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = Constants.contentInset
    }
    
    func configureModel() {
        model.didItemsUpdate = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    func configureNavigationBar() {
        navigationItem.title = TabBarModel.main.title
        navigationItem.rightBarButtonItem = searchButton
    }
    
    func setupRightBarButton() {
        searchButton.tintColor = .black
        searchButton.target = self
        searchButton.action = #selector(searchButtonDidTap)
        navigationItem.rightBarButtonItem = searchButton
    }
}

private extension MainViewController {
    // MARK: - Actions
    @objc func searchButtonDidTap() {
        navigationController?.pushViewController(SearchViewController(), animated: true)
    }
}
