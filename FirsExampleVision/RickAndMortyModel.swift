//
//  RickAndMortyModel.swift
//  FirsExampleVision
//
//  Created by Andres Aleu on 27/6/23.
//

import Foundation

struct CharactersDTO:  Identifiable, Decodable, Hashable {
    let id: Int?
    let info: InfoDTO?
    let characters: [CharacterInfoDTO]?
   
    
    enum CodingKeys: String, CodingKey {
        case id
        case info
        case characters = "results"
    }
}

struct InfoDTO: Identifiable, Decodable, Hashable {
    let id: Int?
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}

struct CharacterInfoDTO: Identifiable, Decodable, Hashable {
    let id: Int?
    let name: String?
    let image: URL?
    let species: Species?
}


enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
    case Humanoid = "Humanoid"
    case unknown = "unknown"
    case Poopybutthole = "Poopybutthole"
    case MythologicalCreature = "Mythological Creature"
    case Animal = "Animal"
    case Robot = "Robot"
    case Cronenberg = "Cronenberg"
}

