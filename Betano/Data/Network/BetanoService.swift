//
//  BetanoService.swift
//  Betano
//
//  Created by Yuri on 06/04/2022.
//

import Foundation

protocol BetanoServiceProtocol {
    func getSports(onComplete: @escaping (Result<[Sport], BetanoError>) -> Void)
}

class BetanoService {
    lazy var request: URLRequest = {
        let url = URL(string: "https://618d3aa7fe09aa001744060a.mockapi.io/api/sports")!
        
        var request = URLRequest(url: url, timeoutInterval: 30)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        return request
    }()
}

extension BetanoService: BetanoServiceProtocol {
    func getSports(onComplete: @escaping (Result<[Sport], BetanoError>) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
              return onComplete(.failure(.invalidData))
          }
          
          guard let response = response as? HTTPURLResponse else {
              return onComplete(.failure(.badResponse))
          }
          
          guard response.statusCode == 200 else {
              return onComplete(.failure(.invalidStatusCode(statusCode: response.statusCode)))
          }
          
          guard error == nil else {
              return onComplete(.failure(.invalidData))
          }
            
            do {
                let sports = try JSONDecoder().decode([Sport].self, from: data)
                onComplete(.success(sports))
            } catch let error {
                debugPrint(error)
                onComplete(.failure(.invalidJson))
            }
        }
        task.resume()
    }
}
