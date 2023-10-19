//
//  Specie.swift
//  StarWars_3
//
//  Created by Diogo Coelho da Silva on 19/10/2023.
//

import Foundation


struct Species: Codable {
    let name: String
}

struct SpeciesResponse: Codable {
let resultsSpecies: [Species]
}
