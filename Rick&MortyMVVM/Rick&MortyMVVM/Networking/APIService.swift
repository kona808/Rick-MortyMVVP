//
//  APIService.swift
//  Rick&MortyMVVM
//
//  Created by Jacob Perez on 10/17/22.
//

import UIKit

struct APIService {
    func getPerform(_ request: URLRequest, completion: @escaping (Result<Data, ResultError>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                completion(.failure(.requestError(error)))
            }
            if let response = response as? HTTPURLResponse {
                print("Completed with a respone of", response.statusCode)
            }
            guard let data else {
                completion(.failure(.noData))
                return
            }
            completion(.success(data))
        }.resume()
    }
    
}
//    /// Abstraction .v.
//    static let baseURLString = "https://rickandmortyapi.com/api"
//    static let kCharacter = "character"
//    static let kName = "name"
//
//    static func fetchCharacters(with searchTerm: String, completion: @escaping (Result<TopLevelDictionary, ResultError>) -> Void ) {
//
//        // First thing first. Create the gdamn URL.
//        guard let baseUrl = URL(string: baseURLString) else {
//            completion(.failure(.badURL))
//            return
//        }
//        let characterURL = baseUrl.appendingPathComponent(kCharacter)
//        // Now we need to add the URLQueryItems
//        var urlComponents = URLComponents(url: characterURL, resolvingAgainstBaseURL: true)
//        /// Create the URLQuery item
//        let nameFilter = URLQueryItem(name: kName, value: searchTerm)
//        urlComponents?.queryItems = [nameFilter]
//
//        guard let finalURL = urlComponents?.url else {
//            completion(.failure(.badURL))
//            return
//        }
//        // Get to taskin'
//        URLSession.shared.dataTask(with: finalURL) { data, _, error in
//            if let error {
//                completion(.failure(.requestError(error)))
//                return
//            }
//            guard let data else {
//                completion(.failure(.couldNotUnwrap))
//                return
//            }
//            do {
//                guard let tld = try? JSONDecoder().decode(TopLevelDictionary.self, from: data) else {
//                    completion(.failure(.couldNotUnwrap))
//                    return
//                }
//                completion(.success(tld))
//            }
//            completion(.failure(.noData))
//        }.resume()
//    }
//    static func fetch(image with: String, completion: @escaping (Result<UIImage, ResultError>) -> Void) {
//        guard let imageUrl = URL(string: with) else { completion(.failure(.badURL))
//            return
//        }
//        URLSession.shared.dataTask(with: imageUrl) { data, _, error in
//            if let error {
//                completion(.failure(.requestError(error)))
//                return
//            }
//            guard let data else { completion(.failure(.noData))
//                return
//            } // We only need a do, try, catch if we have a throwing reciever
//            guard let image = UIImage(data: data) else { completion(.failure(.noData))
//                return
//            }
//            completion(.success(image))
//        }.resume()
//    }

