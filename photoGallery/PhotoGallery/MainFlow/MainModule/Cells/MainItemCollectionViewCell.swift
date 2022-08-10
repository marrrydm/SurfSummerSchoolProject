//
//  MainItemCollectionViewCell.swift
//  PhotoGallery
//
//  Created by Мария Ганеева on 05.08.2022.
//

import UIKit

class MainItemCollectionViewCell: UICollectionViewCell {

    // MARK: - Constants
    private enum Constants {
        static let fillHeartImage = UIImage(named: "heart-fill")
        static let heartImage = UIImage(named: "heart")
    }

    // MARK: - Views
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!

    // MARK: - Actions
    @IBAction private func favoriteAction(_ sender: Any) {
        didFavoriteTapped?()
        isFavorite.toggle()
    }

    // MARK: - Events
    var didFavoriteTapped: (() -> Void)?

    // MARK: - Calculated

    var buttonImage: UIImage? {
        return isFavorite ? Constants.fillHeartImage : Constants.heartImage
    }

    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.2) {
                self.contentView.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.98, y: 0.98) : .identity
            }
        }
    }

    // MARK: - Properties

    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    var isFavorite: Bool = false {
        didSet {
            favoriteButton.setImage(buttonImage, for: .normal)
        }
    }

    // MARK: - UICollectionViewCell
    override func awakeFromNib() {
        super.awakeFromNib()
        configureApperance()
    }
}

// MARK: - Private Methods

private extension MainItemCollectionViewCell {
    func configureApperance() {
        titleLabel.tintColor = .black
        titleLabel.font = .systemFont(ofSize: 12)

        imageView.layer.cornerRadius = 12
        imageView.contentMode = .scaleAspectFill

        favoriteButton.tintColor = .white
    }
}
