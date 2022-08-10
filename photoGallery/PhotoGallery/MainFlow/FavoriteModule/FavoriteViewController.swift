//
//  FavoriteViewController.swift
//  PhotoGallery
//
//  Created by Мария Ганеева on 05.08.2022.
//

import UIKit

final class FavoriteViewController: UIViewController {

    // MARK: - Private Properties
    private let searchButton = UIBarButtonItem(systemItem: .search)

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRightBarButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
}

    // MARK: - Private Methods
private extension FavoriteViewController {

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

private extension FavoriteViewController {
    // MARK: - Actions
    @objc func searchButtonDidTap() {
        navigationController?.pushViewController(SearchViewController(), animated: true)
    }
}
