//
//  APIService.swift
//  SwiftPlaces
//
//  Created by Lucas Honorato on 25/04/21.
//

import Foundation

struct Header {
    let field: String
    let value: String
}

class APIService {
    
    enum Service {
        case locations
        case photos
    }
    
    init(_ service: Service) {
        self.service = service
    }
    
    private var service: Service
    
    private var baseURL: String {
        get {
            switch self.service {
            case .locations:
                return Config.placesApiUrl
            case .photos:
                return Config.photosApiUrl
            }
        }
    }
    
    private var headers: [Header]? {
        get {
            switch self.service {
            case .locations:
                return nil
            case .photos:
                return [Header(field: "Authorization", value: Config.photosApiKey)]
            }
        }
    }
    
    func fetch<T: Decodable>(_ endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        
        let urlString = baseURL + endpoint
        guard let url = URL(string: urlString) else { preconditionFailure("Invalid URL") }
        let urlRequest = addHeaders(URLRequest(url: url))
        
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
    
    
    
    private func addHeaders(_ request: URLRequest) -> URLRequest {
        guard let headers = headers else { return request }
        var requestWithHeaders = request
        for header in headers {
            requestWithHeaders.setValue(header.value, forHTTPHeaderField: header.field)
        }
        return requestWithHeaders
    }
}
