
import SwiftUI



struct CharacterViewDetail: View {
    let character: Character
    @State private var homeworldName: String?
    @State private var speciesName: String?

    var body: some View {
        VStack(alignment: .center) {
            TextView(text: character.name, sizeFont: 20)
            
            VStack(alignment: .leading) {
                
                
                
                
                
                TextView(text: "biographical information", sizeFont: 20)
                
                HStack {
                    VStack {
                        Text("Born ")
                            .font(Font.custom("StarJedi Special Edition", size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                    VStack {
                        Text(" \(character.birth_year)" )
                            .font(Font.custom("StarJedi Special Edition", size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                
                Text("Physical Description")
                    .font(Font.custom("StarJedi Special Edition", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
                
                HStack {
                    VStack {
                        Text("Gender ")
                            .font(Font.custom("StarJedi Special Edition", size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        Text("Height ")
                            .font(Font.custom("StarJedi Special Edition", size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        Text("Mass ")
                            .font(Font.custom("StarJedi Special Edition", size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        Text("HomeWorld")
                            .font(Font.custom("StarJedi Special Edition", size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        Text("Species")
                            .font(Font.custom("StarJedi Special Edition", size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                    VStack {
                        Text(" \(character.gender)")
                            .font(Font.custom("StarJedi Special Edition", size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(" \(character.height)")
                            .font(Font.custom("StarJedi Special Edition", size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(" \(character.mass)")
                            .font(Font.custom("StarJedi Special Edition", size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        if let homeworldName = homeworldName {
                            Text(" " + homeworldName)
                                .font(Font.custom("StarJedi Special Edition", size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        if let speciesName = speciesName {
                            Text(" " + speciesName)
                                .font(Font.custom("StarJedi Special Edition", size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
                                .frame(maxWidth: .infinity, alignment: .leading)
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

