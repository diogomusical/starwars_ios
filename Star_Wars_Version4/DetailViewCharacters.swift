//
//  DetailView.swift
//  Species
//
//  Created by Diogo Coelho da Silva on 22/09/2023.
//

import SwiftUI

struct DetailViewCharacters: View {
    let characters: Characters
    @State private var fontText = "StarJediSpecialEdition"
    @State private var colorTextYellowRed = 1.0
    @State private var colorTextYellowGreen = 0.91
    @State private var colorTextYellowBlue = 0.12
    var body: some View {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                .overlay(
                VStack(alignment: .leading){
                    
                    Text(characters.name)
                        .font(Font.custom(fontText, size: 20))
                        .padding(.top, 40)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: colorTextYellowRed, green: colorTextYellowGreen, blue: colorTextYellowBlue))
                     //   .bold()
                    
                    Text("Biographical information")
                        .font(Font.custom(fontText, size: 20))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: colorTextYellowRed, green: colorTextYellowGreen, blue: colorTextYellowBlue))
                        
                    
                        

                    
                 /*   Rectangle()
                        .frame(height: 2)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.gray)
                  */
                    //VStack{
                    HStack{
                        Text("Born ")
                            .font(Font.custom(fontText, size: 16))
                            .foregroundColor(Color(red: colorTextYellowRed, green: colorTextYellowGreen, blue: colorTextYellowBlue))
                           // .bold()
                        Text(characters.birth_year)
                            .font(Font.custom(fontText, size: 16))
                            .foregroundColor(Color(red: colorTextYellowRed, green: colorTextYellowGreen, blue: colorTextYellowBlue))
                         //   .bold()
                    }
                    
                    Text("Physical Description")
                        .font(Font.custom(fontText, size: 20))
                        .multilineTextAlignment(.center)
                        .padding(.top, 40)
                        .foregroundColor(Color(red: colorTextYellowRed, green: colorTextYellowGreen, blue: colorTextYellowBlue))
                        // Text("Species: ") //Este comando01 não liga à API
                        // Text(characters.species) //Este comando01 não liga à API
                       
                    HStack{
                        Text("Gender:")
                            .font(Font.custom(fontText, size: 14))
                            .foregroundColor(Color(red: colorTextYellowRed, green: colorTextYellowGreen, blue: colorTextYellowBlue))
                         //   .bold()
                        Text(characters.gender)
                            .font(Font.custom(fontText, size: 14))
                            .foregroundColor(Color(red: colorTextYellowRed, green: colorTextYellowGreen, blue: colorTextYellowBlue))
                           // .bold()
                    }
                    HStack{
                        Text("Height:")
                            .font(Font.custom(fontText, size: 14))
                            .foregroundColor(Color(red: colorTextYellowRed, green: colorTextYellowGreen, blue: colorTextYellowBlue))
                            .bold()
                        Text(characters.height)
                            .font(Font.custom(fontText, size: 14))
                            .foregroundColor(Color(red: colorTextYellowRed, green: colorTextYellowGreen, blue: colorTextYellowBlue))
                            .bold()
                    }
                    HStack{
                        Text("Mass:")
                            .font(Font.custom(fontText, size: 16))
                            .foregroundColor(Color(red: colorTextYellowRed, green: colorTextYellowGreen, blue: colorTextYellowBlue))
                        //.bold()
                        Text(characters.mass)
                            .font(Font.custom(fontText, size: 16))
                            .foregroundColor(Color(red: colorTextYellowRed, green: colorTextYellowGreen, blue: colorTextYellowBlue))
                        //.bold()
                        // }
                    }
                    Spacer()
                    
                }
                )
            }.padding(.top, 50)
        
    }
}

struct DetailView_Previews: PreviewProvider{
    static var previews: some View{
        DetailViewCharacters(characters: Characters(name: "Diogo", birth_year: "10"
                //, species: "Diogo"Este comando01 não liga à API
                                          ,gender: "Masculino"
                                          ,height: "180"
                                          ,mass: "76"
    /*, born: "10 de Janeiro", species: "Humano", gender: "Masculino", pronouns: "de", height: "1.87 kg", mass: "massa", homeworld: "homeworld"
     */))
    }
}

