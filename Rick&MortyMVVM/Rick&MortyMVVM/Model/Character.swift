//
//  Character.swift
//  Rick&MortyMVVM
//
//  Created by Jacob Perez on 10/17/22.
//

import Foundation

struct TopLevelDictionary: Decodable {
    let info: Info
    let results: [Character]
}
struct Info: Decodable {
    /// Next is the next URL Used for Pagination
    let next: String
}
struct Character: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case gender
        case origin
        case location
        case imageString = "image"
    }
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: Origin
    let location: Location
    let imageString: String
}
struct Origin: Decodable {
    let name: String
}
struct Location: Decodable {
    let name: String
}
//{
//            "id": 236,
//            "name": "Mr. Beauregard",
//            "status": "Dead",
//            "species": "Alien",
//            "type": "Parasite",
//            "gender": "Male",
//            "origin": {
//                "name": "unknown",
//                "url": ""
//            },
//            "location": {
//                "name": "Earth (Replacement Dimension)",
//                "url": "https://rickandmortyapi.com/api/location/20"
//            },
//            "image": "https://rickandmortyapi.com/api/character/avatar/236.jpeg"
