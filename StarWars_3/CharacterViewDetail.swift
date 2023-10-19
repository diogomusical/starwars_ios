import SwiftUI

/*
struct CharacterViewDetail: View {
    let character: Character // Certifique-se de que o modelo Character seja passado para esta view

    var body: some View {
        VStack {
            Text(character.name)
                .font(.largeTitle)
                .padding()

            Spacer()

            Text("Height: \(character.height)")
            Text("Mass: \(character.mass)")
            Text("Hair Color: \(character.hairColor ?? "N/A")") // Lida com o caso em que a propriedade é opcional
            Text("Eye Color: \(character.eyeColor ?? "N/A")") // Lida com o caso em que a propriedade é opcional
            Text("Birth Year: \(character.birthYear ?? "N/A")") // Lida com o caso em que a propriedade é opcional
            Text("Gender: \(character.gender)")
            
            Spacer()
        }
        .navigationBarTitle("Detalhes do Personagem")
    }
}*/

struct CharacterViewDetail: View {
    let character: Character
    @State private var homeworldName: String?

    var body: some View {
        VStack {
            Text(character.name)
                .font(Font.custom("StarJedi Special Edition", size: 20))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))

            Text("Biographical Information")
                .font(Font.custom("StarJedi Special Edition", size: 20))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))

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

                    Text("Planet ")
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
                        Text(homeworldName)
                            .font(Font.custom("StarJedi Special Edition", size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
                           
                            .frame(maxWidth: .infinity, alignment: .leading)
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
        }
        .navigationBarHidden(true)
        .background(
            Image("background")
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
    }
}





struct CharacterViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        CharacterViewDetail(character: Character(name: "Luke Skywalker", birth_year: "data de nascimento", height: "172 cm", mass: "77 kg", hairColor: "Blond", eyeColor: "Blue", birthYear: "19 BBY", gender: "Male", homeworld: "homeworld_exemplo"))
    }
}

