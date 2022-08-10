//
//  DetailModel.swift
//  PhotoGallery
//
//  Created by Мария Ганеева on 06.08.2022.
//

import Foundation
import UIKit

struct DetailItemModel {
    let image: UIImage?
    let title: String
    var isFavorite: Bool
    let dateCreation: String
    let content: String

    static func createDefault() -> DetailItemModel {
        .init(image: UIImage(named: "photo-default"), title: "Самый милый корги", isFavorite: false, dateCreation: "12.05.2022", content: "Для бариста и посетителей кофеен специальные кружки для кофе — это ещё один способ проконтролировать вкус напитка и приготовить его именно так, как нравится вам. \n Для бариста и посетителей кофеен специальные кружки для кофе — это ещё один способ проконтролировать вкус напитка и приготовить его именно так, как нравится вам. \n Для бариста и посетителей кофеен специальные кружки для кофе — это ещё один способ проконтролировать вкус напитка и приготовить его именно так, как нравится вам.")
    }
}
