//
//  ParkCollectionViewCell.swift
//  NationalParks
//
//  Created by Pratyusha Joginipally on 4/29/24.
//

import UIKit

class ParkCollectionViewCell: UICollectionViewCell {
  static let reuseId = "ParkCell"

  let parkImageView = ParkImageView(frame: .zero)
  let parkNameLabel = TitleLabel(textAlignment: .left, fontSize: 16)

  override init(frame: CGRect) {
    super.init(frame: frame)

    configure()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func set(park: Park) {
    parkNameLabel.text = park.fullName
    parkImageView.downloadImage(from: park.images[0].url)
  }

  private func configure() {
    addSubview(parkImageView)
    addSubview(parkNameLabel)

    let padding: CGFloat = 8

    NSLayoutConstraint.activate([
      parkImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      parkImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
      parkImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
      parkImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),

      parkNameLabel.topAnchor.constraint(equalTo: parkImageView.bottomAnchor, constant: -50),
      parkNameLabel.leadingAnchor.constraint(equalTo: parkImageView.leadingAnchor, constant: padding),
      parkNameLabel.trailingAnchor.constraint(equalTo: parkImageView.trailingAnchor, constant: -padding),
      parkNameLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
}
