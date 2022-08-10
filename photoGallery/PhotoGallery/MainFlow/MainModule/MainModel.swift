//
//  MainModel.swift
//  PhotoGallery
//
//  Created by Мария Ганеева on 05.08.2022.
//

import Foundation
import UIKit

final class MainModel {

    // MARK: - Events
    var didItemsUpdate: (() -> Void)?
    
    // MARK: - Properties
    var items: [ItemModel] = [] {
        didSet {
            didItemsUpdate?()
        }
    }

    // MARK: - Methods
    func getPosts() {
        items = Array(repeating: ItemModel.createDefault(), count: 100)
    }
}

struct ItemModel {
    let image: UIImage?
    let title: String
    var isFavorite: Bool
    let dateCreation: String
    let content: String

    static func createDefault() -> ItemModel {
        .init(image: UIImage(named: "photo-default"), title: "Самый милый корги", isFavorite: false, dateCreation: "12.05.2022", content: "Для бариста и посетителей кофеен специальные кружки для кофе — это ещё один способ проконтролировать вкус напитка и приготовить его именно так, как нравится вам.")
    }
}
