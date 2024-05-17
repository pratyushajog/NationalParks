//
//  TitleLabel.swift
//  NationalParks
//
//  Created by Pratyusha Joginipally on 4/29/24.
//

import UIKit

class TitleLabel: UILabel {

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
    super.init(frame: .zero)
    self.textAlignment = textAlignment
    self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    configure()
  }

  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    textColor = .label
    adjustsFontSizeToFitWidth = true
    minimumScaleFactor = 0.9
    lineBreakMode = .byWordWrapping
    numberOfLines = 2
  }

}
