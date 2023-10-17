//
//  ContentView.swift
//  StarWars_3
//
//  Created by Diogo on 09/10/2023.
//

import SwiftUI





struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack(alignment: .center){
                    Image("logotipo_starwars")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118, height: 71)
                        .clipped()
                    
                    Text("Here you will find all the information you need about your favorite characters, their ships and their planets")
                        .font(Font.custom("StarJediSpecialEdition", size: 24))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 1.0, green: 0.91, blue: 0.12))
                        .frame(width: 297, height: 290 , alignment: .top)
                    
                    Text("May the force be with you")
                        .font(Font.custom("StarJediSpecialEdition", size: 32))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 1.0, green: 0.91, blue: 0.12))
                    
                    NavigationLink(destination: CharactersView(), label: {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width:  350, height: 45)
                            .background(Color(red: 1.0, green: 0.91, blue: 0.12))
                            .cornerRadius(36)
                            .overlay(
                                Text("Characters")
                                    .font(Font.custom("StarJediSpecialEdition", size: 32))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color.black)
                                //  .frame(width: widthFrameText, height: heightFrameText, alignment: .top)
                            )
                    }
                                   
                    )
                
                    NavigationLink(destination: PlanetsView(), label: {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width:  350, height: 45)
                            .background(Color(red: 1.0, green: 0.91, blue: 0.12))
                            .cornerRadius(36)
                            .overlay(
                        Text("Planets")
                            .font(Font.custom("StarJediSpecialEdition", size: 32))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.black)
                          //  .frame(width: widthFrameText, height: heightFrameText, alignment: .top)
                            )
                    }
                                                  
                )
                    
                    NavigationLink(destination: ShipsView(), label: {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width:  350, height: 45)
                            .background(Color(red: 1.0, green: 0.91, blue: 0.12))
                            .cornerRadius(36)
                            .overlay(
                        Text("Ships")
                            .font(Font.custom("StarJediSpecialEdition", size: 32))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.black)
                          //  .frame(width: widthFrameText, height: heightFrameText, alignment: .top)
                            )
                    }
                                                  
                )
                    
                }
                
            }
            }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
