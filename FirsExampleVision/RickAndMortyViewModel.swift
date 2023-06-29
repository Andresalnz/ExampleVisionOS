//
//  RickAndMortyViewModel.swift
//  FirsExampleVision
//
//  Created by Andres Aleu on 27/6/23.
//

import Foundation
import Observation

@Observable
class RickAndMortyViewModel {
    var characters: [CharacterInfoDTO] = []
  
    let apiSession = URLSession.shared
    
    init()  {
         getCharacters()
    }
    
    
    
    func getCharacters()   {
        Task {
            do {
                let urlStr = "https://rickandmortyapi.com/api/character"
                guard let url = URL(string: urlStr) else { return  }
                
                let (data, _) = try await apiSession.data(from: url)
               let charactersInfo = try JSONDecoder().decode(CharactersDTO.self, from: data)
                if let characterssjson = charactersInfo.characters {
                    characters = characterssjson
                }
               
            } catch  {
                print("Error --> \(error.localizedDescription)")
            }
        }
       
       
    }
}
