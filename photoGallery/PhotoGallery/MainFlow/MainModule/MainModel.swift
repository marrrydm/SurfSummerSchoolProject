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
    var items: [DetailItemModel] = [] {
        didSet {
            didItemsUpdate?()
        }
    }

    // MARK: - Methods
    func getPosts() {
        items = Array(repeating: DetailItemModel.createDefault(), count: 100)
    }
}
