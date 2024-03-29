//
//  NetworkManager.swift
//  StocksApp
//
//  Created by shashant on 23/05/21.
//

import Foundation

final class NetworkManager<T: Codable> {
    func fetch(from url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                completion(.failure(.error(err: error!.localizedDescription)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.inavlidResponse(response: response!.description)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch let err {
                completion(.failure(.decodingError(err: err.localizedDescription)))
                print(err)
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case error(err: String)
    case inavlidResponse(response: String)
    case invalidData
    case decodingError(err: String)
}
