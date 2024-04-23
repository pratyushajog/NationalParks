//
//  NetworkManager.swift
//  NationalParks
//
//  Created by Pratyusha Joginipally on 4/23/24.
//

import Foundation

class NetworkManager {
  static let shared = NetworkManager()
  let baseURL = "https://developer.nps.gov/api/v1"
  let perPage = 100

  private init() {}

  // API call to fetch all the parks
  // start: refers to the page number in the API call
  func getParks(start: Int, completed: @escaping ([Park]?, String?) -> Void) {
    let endpoint = baseURL + "/parks?limit=\(perPage)&start=\(start)&api_key=iCUoINHQctFM9UbCf3Dpx2fUBeHu6ChRTRIi2jlo"

    guard let url = URL(string: endpoint) else {
      completed(nil, "Invalid URL")
      return
    }

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if let _ = error {
        completed(nil, "Unable to complete")
        return
      }

      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        completed(nil, "Invalid Response")
        return
      }

      guard let data = data else {
        completed(nil, "Invalid Data")
        return
      }

      do {
        let decoder = JSONDecoder()
        let parks = try decoder.decode(ParkData.self, from: data)
        completed(parks.data, nil)
      } catch {
        completed(nil, "Invalid Data")
      }
    }

    task.resume()
  }
}
