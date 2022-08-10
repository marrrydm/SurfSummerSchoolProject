//
//  DetailImageTableViewCell.swift
//  PhotoGallery
//
//  Created by Мария Ганеева on 06.08.2022.
//

import UIKit

final class DetailImageTableViewCell: UITableViewCell {

    // MARK: - Views

    @IBOutlet private weak var imageViewDetail: UIImageView!

    // MARK: - Properties

    var image: UIImage? {
        didSet {
            imageViewDetail.image = image
        }
    }

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureApperance()

    }

    private func configureApperance() {
        selectionStyle = .none
        imageViewDetail.layer.cornerRadius = 12
        imageViewDetail.contentMode = .scaleAspectFill
    }
}
