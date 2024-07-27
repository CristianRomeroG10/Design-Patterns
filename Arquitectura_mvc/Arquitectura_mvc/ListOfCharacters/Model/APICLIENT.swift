//
//  APICLIENT.swift
//  Arquitectura_mvc
//
//  Created by Cristian guillermo Romero garcia on 22/07/24.
//

import Foundation

final class ApiClient {
    func getListOfCharacters()async -> CharacterModelResponse{
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        let (data,_) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(CharacterModelResponse.self, from: data)
    }
}
