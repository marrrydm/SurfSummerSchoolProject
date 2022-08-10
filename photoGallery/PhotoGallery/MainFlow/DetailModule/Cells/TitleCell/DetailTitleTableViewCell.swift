//
//  DetailTitleTableViewCell.swift
//  PhotoGallery
//
//  Created by Мария Ганеева on 06.08.2022.
//

import UIKit

final class DetailTitleTableViewCell: UITableViewCell {

    // MARK: - Views
    
    @IBOutlet private weak var titleLabelDetail: UILabel!
    @IBOutlet private weak var dateLabelDetail: UILabel!

    // MARK: - Properties

    var title: String = "" {
        didSet {
            titleLabelDetail.text = title
        }
    }
    var date: String = "" {
        didSet {
            dateLabelDetail.text = date
        }
    }

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureApperance()
    }

    private func configureApperance() {
        selectionStyle = .none
        titleLabelDetail.font = .systemFont(ofSize: 16)
        dateLabelDetail.font = .systemFont(ofSize: 10)
        dateLabelDetail.textColor = .gray
    }
}
