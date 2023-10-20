//
//  CharactersViewModel.swift
//  Star_Wars_Version4
//
//  Created by Diogo Coelho da Silva on 26/09/2023.
//

import Foundation

@MainActor
class CharactersViewModel: ObservableObject {
    struct Returned: Codable {
        var next: String?
        var results: [Characters]
    }
    @Published var charactersArray: [Characters] = []
    var urlString = "https://swapi.dev/api/people/"

    func getData() async{
        print("We are accesssing the url \(urlString)")
        
        guard let url = URL(string: urlString) else {
            print("ERROR: Could not convert \(urlString) to a URL")
            return
        }
        
        do {
            let(data, _) = try await URLSession.shared.data(from: url)
            do{
                let returned = try JSONDecoder().decode(Returned.self, from: data)
                //urlString = returned.next ?? ""
                charactersArray = returned.results
                print("returned: \(returned)")
            } catch {
                print("JSON ERROR: Could not convert data into JSON. \(error.localizedDescription)")
            }
        } catch {
            print("ERROR: Could not get data from urlString \(urlString)")
            
            
        }
    }
    
}
