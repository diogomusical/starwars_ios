//
//  Characters.swift
//  Star_Wars_Version4
//
//  Created by Diogo Coelho da Silva on 26/09/2023.
//

import Foundation

struct Characters: Identifiable, Codable {
    let id = UUID().uuidString
    var name = ""
    var birth_year = ""
   // var species = "" //Este comando01 não liga à API
    var gender = ""
    var height = ""
    var mass = ""
    /*
    var species = ""
    var gender = ""
    var pronouns = ""
    var height = ""
    var mass = ""
    var homeworld = ""
     */
    
    enum CodingKeys: CodingKey {
        case name, birth_year
        //, species //Este comando01 não liga à API
        ,gender
        ,height
        ,mass
        /*, born, species, gender, pronouns, height, mass, homeworld
         */
    }
}
