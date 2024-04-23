//
//  ViewController.swift
//  NationalParks
//
//  Created by Pratyusha Joginipally on 4/18/24.
//

import UIKit

class NationalParksListVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.

    view.backgroundColor = .red
    NetworkManager.shared.getParks(start: 0) { (parks, error) in
      print(parks)
    }
  }


}

