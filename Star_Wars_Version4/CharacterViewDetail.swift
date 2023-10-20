
import SwiftUI



struct CharacterViewDetail: View {
    let character: Character
    @State private var homeworldName: String?
    @State private var speciesName: String?

    var body: some View {
        VStack(alignment: .center) {
            TextView(text: character.name, sizeFont: 20)
            
            VStack(
                //alignment: .leading
            ) {
                
                
                
                
                
                TextView(text: "biographical information", sizeFont: 20, texthalignment: .leading)
                
                HStack {
                    VStack {
                        TextView(text: "Born ", sizeFont: 14, texthalignment: .trailing)
                    }
                    
                    VStack {
                        TextView(text: "  \(character.birth_year)", sizeFont: 14, texthalignment: .leading)
                    }
                }
                
                TextView(text: "Physical Description", sizeFont: 20, texthalignment: .leading)
                
                HStack {
                    VStack {
                        TextView(text: "Gender ", sizeFont: 14, texthalignment: .trailing)
                    
                        TextView(text: "Height ", sizeFont: 14, texthalignment: .trailing)
   
                        TextView(text: "Mass ", sizeFont: 14, texthalignment: .trailing)
             
                        TextView(text: "HomeWorld ", sizeFont: 14, texthalignment: .trailing)
            
                        TextView(text: "Species ", sizeFont: 14, texthalignment: .trailing)
                    }
                    
                    VStack {
                        
                        TextView(text: " \(character.gender)", sizeFont: 14, texthalignment: .leading)
                        
                        
                        TextView(text: " \(character.height)", sizeFont: 14, texthalignment: .leading)
                       
                        
                        TextView(text: " \(character.mass)", sizeFont: 14, texthalignment: .leading)
                       
                        
                        if let homeworldName = homeworldName {
                            TextView(text: " \(homeworldName)", sizeFont: 14, texthalignment: .leading)
                           
                          
                        }
                        
                        if let speciesName = speciesName {
                            TextView(text: " \(speciesName)", sizeFont: 14, texthalignment: .leading)
                 
                        }
                    }
                }
            }
        }
        .onAppear {
            if let homeworldURL = URL(string: character.homeworld) {
                let request = URLRequest(url: homeworldURL)

                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let error = error {
                        print("Error fetching homeworld data: \(error)")
                        return
                    }

                    if let data = data {
                        do {
                            let planet = try JSONDecoder().decode(Planet.self, from: data)
                            self.homeworldName = planet.name
                        } catch {
                            print("Error decoding JSON for homeworld: \(error)")
                        }
                    }
                }.resume()
            }

            if let speciesURL = URL(string: character.species[0]) {
                let request = URLRequest(url: speciesURL)

                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let error = error {
                        print("Error fetching species data: \(error)")
                        return
                    }

                    if let data = data {
                        do {
                            let species = try JSONDecoder().decode(Species.self, from: data)
                            self.speciesName = species.name
                        } catch {
                            print("Error decoding JSON for species: \(error)")
                        }
                    }
                }.resume()
            }
            
        }
        .navigationBarHidden(true)
        .background(
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        )
    }
        
}

struct CharacterViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        CharacterViewDetail(character: Character(name: "Luke Skywalker", birth_year: "data de nascimento", height: "172 cm", mass: "77 kg", hairColor: "Blond", eyeColor: "Blue", birthYear: "19 BBY", gender: "Male", homeworld: "homeworld_exemplo", species: ["url_da_especie"]))
    }
}

