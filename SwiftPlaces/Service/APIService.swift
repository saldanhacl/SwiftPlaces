//
//  APIService.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 25/04/21.
//

import Foundation

class APIService {
    
  private let baseURL: String = "https://hotmart-mobile-app.herokuapp.com/"

  func fetch<T: Decodable>(_ endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
    
    let urlString = baseURL + endpoint
    guard let url = URL(string: urlString) else { preconditionFailure("Invalid URL") }
    let urlRequest = URLRequest(url: url)
    
    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
      do {
        if let error = error {
          completion(.failure(error))
          return
        }

        guard let data = data else {
          preconditionFailure("No error was received but we also don't have data...")
        }

        let decodedObject = try JSONDecoder().decode(T.self, from: data)

        completion(.success(decodedObject))
      } catch {
        completion(.failure(error))
      }
    }.resume()
  }
}
