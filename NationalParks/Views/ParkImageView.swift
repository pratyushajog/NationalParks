//
//  ParkImageView.swift
//  NationalParks
//
//  Created by Pratyusha Joginipally on 5/8/24.
//

import UIKit

class ParkImageView: UIImageView {

  let placeHolderImage = UIImage(named: "NPS-App-Icon-5")

  override init(frame: CGRect) {
    super.init(frame: frame)

    configure()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configure() {
    layer.cornerRadius = 10
    clipsToBounds = true
    image = placeHolderImage
    translatesAutoresizingMaskIntoConstraints = false
  }

  func downloadImage(from urlString: String) {
    guard let url = URL(string: urlString) else {
      return
    }

    let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
      guard let self = self else { return }

      if let _ = error { return }

      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
      guard let data = data else { return }

      guard let image = UIImage(data: data) else { return }

      DispatchQueue.main.async { self.image = image }
    }

    task.resume()
  }

}
