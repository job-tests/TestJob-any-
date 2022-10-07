//
//  CellCollectionView.swift
//  ProjectNew
//
//  Created by Kirill Drozdov on 05.05.2022.
//

import Foundation
import UIKit


class CellCollectionView: UICollectionViewCell {

    lazy var iconImage: UIImageView = {
        var icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        return icon
    }()

    lazy var titileLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()

    lazy var valueLabel: UILabel = {
        var value = UILabel()
        value.translatesAutoresizingMaskIntoConstraints = false
        value.textColor = UIColor(red: 120/255, green: 124/255, blue: 139/255, alpha: 1)
        value.font = UIFont.boldSystemFont(ofSize: 15)
        return value
    }()

    lazy var penImage: UIImageView = {
        var icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        return icon
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)


        contentView.addSubview(iconImage)
        NSLayoutConstraint.activate([

            iconImage.leadingAnchor.constraint  (equalTo: leadingAnchor , constant: 16),
            iconImage.topAnchor.constraint      (equalTo: topAnchor     , constant: 16),
            iconImage.widthAnchor.constraint    (equalToConstant: 24),
            iconImage.heightAnchor.constraint   (equalToConstant: 24)
        ])

        contentView.addSubview(titileLabel)
        NSLayoutConstraint.activate([

            titileLabel.leadingAnchor.constraint    (equalTo: iconImage.trailingAnchor , constant: 8),
            titileLabel.topAnchor.constraint        (equalTo: topAnchor                , constant: 16),
        ])

        contentView.addSubview(valueLabel)
        NSLayoutConstraint.activate([

            valueLabel.leadingAnchor.constraint (equalTo: leadingAnchor             , constant: 16),
            valueLabel.topAnchor.constraint     (equalTo: iconImage.bottomAnchor    , constant: 15),
            valueLabel.bottomAnchor.constraint  (equalTo: bottomAnchor              , constant: -16)
        ])

        contentView.addSubview(penImage)
        NSLayoutConstraint.activate([

            penImage.topAnchor.constraint       (equalTo: topAnchor         , constant: 16),
            penImage.trailingAnchor.constraint  (equalTo: trailingAnchor    , constant: -16),
            penImage.widthAnchor.constraint     (equalToConstant: 24),
            penImage.heightAnchor.constraint    (equalToConstant: 24)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
