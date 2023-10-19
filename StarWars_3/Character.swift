//
//  Character.swift
//  StarWars_3
//
//  Created by Diogo on 09/10/2023.
//

import Foundation

struct Character: Codable {
    let name: String
    let birth_year: String
    let height: String
    let mass: String
    let hairColor: String?
    let eyeColor: String?
    let birthYear: String?
    let gender: String
    let homeworld: String
    let species: [String]
    
}

struct CharacterResponse: Codable {
let results: [Character]
}

