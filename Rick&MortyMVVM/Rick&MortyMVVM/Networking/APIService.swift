//
//  APIService.swift
//  Rick&MortyMVVM
//
//  Created by Jacob Perez on 10/17/22.
//

import Foundation

struct APIService {
    /// Abstraction .v.
    static let baseURLString = "https://rickandmortyapi.com/api"
    static let kCharacter = "character"
    static let kName = "name"
    
    static func fetchCharacters(with searchTerm: String, completion: @escaping (Result<TopLevelDictionary, ResultError) -> Void ) {
        
        // First thing first. Create the gdamn URL.
        guard let baseUrl = URL(string: baseURLString) else {
            completion(.failure(.badURL))
            return
        }
        let characterURL = baseUrl.appendingPathComponent(kCharacter)
        // Now we need to add the URLQueryItems
        var urlComponents = URLComponents(url: characterURL, resolvingAgainstBaseURL: true)
        /// Create the URLQuery item
        let nameFilter = URLQueryItem(name: kName, value: searchTerm)
        
        guard let finalURL = urlComponents?.url else {
            completion(.failure(.badURL))
            return
        }
        // Get to taskin'
        URLSession.shared.dataTask(with: finalURL) { data, _, error in
            if let error {
                completion(.failure(.requestError(error)))
                return
            }
            guard let data else {
                completion(.failure(.noData))
                return
            }
            do {
                guard let tld = try? JSONDecoder().decode(TopLevelDictionary, from: data) else {
                    completion(.failure(.couldNotUnwrap))
                    return
                }
                completion(.success(tld))
            }
            completion(.failure(.errorDecoding))
        }.resume()
    }
}
