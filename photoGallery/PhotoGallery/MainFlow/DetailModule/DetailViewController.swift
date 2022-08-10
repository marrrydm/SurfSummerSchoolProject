//
//  DetailViewController.swift
//  PhotoGallery
//
//  Created by Мария Ганеева on 06.08.2022.
//

import UIKit

final class DetailViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Views
    private let tableView = UITableView()

    // MARK: - Private Properties

    private let searchButton = UIBarButtonItem(systemItem: .search)
    private var backButton = UIBarButtonItem(image: UIImage(named: "back-arrow"))

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
        tableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }

    // MARK: - Calculate

    var model: DetailItemModel?
}

// MARK: - Private Methods

private extension DetailViewController {
    func configureApperance() {
        configureTableView()
    }

    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        tableView.register(UINib(nibName: "\(DetailImageTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(DetailImageTableViewCell.self)")
        tableView.register(UINib(nibName: "\(DetailTitleTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(DetailTitleTableViewCell.self)")
        tableView.register(UINib(nibName: "\(DetailTextTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(DetailTextTableViewCell.self)")
        tableView.separatorStyle = .none
        tableView.dataSource = self
    }

    func configureNavigationBar() {
        setupLeftBarButton()
        setupRightBarButton()
        navigationItem.title = model?.title
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

    func setupLeftBarButton() {
        backButton.tintColor = .black
        backButton.target = navigationController
        backButton.action = #selector(UINavigationController.popViewController(animated:))
        navigationItem.leftBarButtonItem = backButton
    }

    func setupRightBarButton() {
        searchButton.tintColor = .black
        searchButton.target = self
        searchButton.action = #selector(searchButtonDidTap)
        navigationItem.rightBarButtonItem = searchButton
    }
}

// MARK: - UITableView
extension DetailViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let detailImageCell = tableView.dequeueReusableCell(withIdentifier: "\(DetailImageTableViewCell.self)")
            if let detailImageCell = detailImageCell as? DetailImageTableViewCell {
                detailImageCell.image = model?.image
            }
            return detailImageCell ?? UITableViewCell()
        case 1:
            let detailTitleCell = tableView.dequeueReusableCell(withIdentifier: "\(DetailTitleTableViewCell.self)")
            if let detailTitleCell = detailTitleCell as? DetailTitleTableViewCell {
                detailTitleCell.title = model?.title ?? ""
                detailTitleCell.date = model?.dateCreation ?? ""
            }
            return detailTitleCell ?? UITableViewCell()
        case 2:
            let detailTextCell = tableView.dequeueReusableCell(withIdentifier: "\(DetailTextTableViewCell.self)")
            if let detailTextCell = detailTextCell as? DetailTextTableViewCell {
                detailTextCell.text = model?.content
            }
            return detailTextCell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - Actions
private extension DetailViewController {
    @objc func searchButtonDidTap() {
        navigationController?.pushViewController(SearchViewController(), animated: true)
    }
}
