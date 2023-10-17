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
                    // Conteúdo alinhado à esquerda
                    Text("Born " )
                        .font(Font.custom("StarJedi Special Edition", size: 14))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                VStack {
                    // Conteúdo alinhado à direita
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
            //Falta as espécies
            HStack {
                VStack {
                    // Conteúdo alinhado à esquerda
                    Text("Gender ")
                        .font(Font.custom("StarJedi Special Edition", size: 14))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    //Falta as espécies
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
                }
                
                VStack {
                    // Conteúdo alinhado à direita
                    Text(" \(character.gender)")
                        .font(Font.custom("StarJedi Special Edition", size: 14))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    //Falta as espécies
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
                }
            }
            
            /*Text("Hair Color: \(character.hairColor ?? "N/A")")
             .font(Font.custom("StarJedi Special Edition", size: 14))
             .multilineTextAlignment(.center)
             .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
             Text("Eye Color: \(character.eyeColor ?? "N/A")")
             .font(Font.custom("StarJedi Special Edition", size: 14))
             .multilineTextAlignment(.center)
             .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
             Text("Birth Year: \(character.birthYear ?? "N/A")")
             .font(Font.custom("StarJedi Special Edition", size: 14))
             .multilineTextAlignment(.center)
             .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
             Spacer()
             */
        }
               .background(
            Image("background")
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
           )
        // .navigationBarTitle("Character Details")
        //.background(Image("background"))
        }
}


struct CharacterViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        CharacterViewDetail(character: Character(name: "Luke Skywalker", birth_year: "data de nascimento", height: "172 cm", mass: "77 kg", hairColor: "Blond", eyeColor: "Blue", birthYear: "19 BBY", gender: "Male"))
    }
}

