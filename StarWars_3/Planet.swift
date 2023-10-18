//
//  Planet.swift
//  StarWars_3
//
//  Created by Diogo Coelho da Silva on 17/10/2023.
//

import Foundation

struct Planet: Codable {
    let name: String
}

struct PlanetResponse: Codable {
let resultsPlanet: [Planet]
}
