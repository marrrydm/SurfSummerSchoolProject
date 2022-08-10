//
//  FavoriteViewController.swift
//  PhotoGallery
//
//  Created by Мария Ганеева on 05.08.2022.
//

import UIKit

class FavoriteViewController: UIViewController {

    // MARK: - Private Properties
    private var rightBarButton = UIBarButtonItem(systemItem: .search)

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
        navigationItem.rightBarButtonItem = rightBarButton
    }

    func setupRightBarButton() {
        rightBarButton.target = self
        rightBarButton.action = #selector(searchButtonDidTap)
        navigationItem.rightBarButtonItem = rightBarButton
    }

    @objc func searchButtonDidTap() {
//        navigationController?.pushViewController(FavoriteViewController(), animated: true)
    }
}
