//
//  TabBarConfigurator.swift
//  PhotoGallery
//
//  Created by Мария Ганеева on 05.08.2022.
//

import Foundation
import UIKit

final class TabBarConfigurator {

    // MARK: - Private Properties

    private var allTab: [TabBarModel] = [.main, .favorite, .profile]
    private var rightBarButton = UIBarButtonItem()

    // MARK: - Internal func
    func configure() -> UITabBarController {
        rightBarButton.title = "Готово"
        rightBarButton.target = self
        rightBarButton.action = #selector(didRightBarButtonTapped(_:))
//        navigationItem.rightBarButtonItem = rightBarButton
        return getTabBarController()
    }

    @objc private func didRightBarButtonTapped(_ sender: Any) {
        rightBarButton.title = "Готово"
    }
}

private extension TabBarConfigurator {

    func getTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .black
        tabBarController.tabBar.unselectedItemTintColor = .lightGray
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.viewControllers = getControllers()
        return tabBarController
    }

    func getControllers() -> [UIViewController] {
        var viewControllers = [UIViewController]()

        allTab.forEach{ tab in
            let currentController = getCurrentViewController(tab: tab)
            let navBar = UINavigationController(rootViewController: currentController)
            let tabBarItem = UITabBarItem(title: tab.title, image: tab.image, selectedImage: tab.selectedImage)
            currentController.tabBarItem = tabBarItem
            viewControllers.append(navBar)
        }
        return viewControllers
    }

    func getCurrentViewController(tab: TabBarModel) -> UIViewController {
        switch tab {
        case .main:
           return MainViewController()
        case .favorite:
            return FavoriteViewController()
        case .profile:
            return ProfileViewController()
        }
    }
}
