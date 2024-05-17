//
//  Park.swift
//  NationalParks
//
//  Created by Pratyusha Joginipally on 4/22/24.
//

import Foundation

struct Park: Codable, Hashable {
  var url: String?
  var fullName: String?
  var parkCode: String?
  var description: String?
  var activities: [Activity]
  var states: String?
  var images: [ImageData]
}
