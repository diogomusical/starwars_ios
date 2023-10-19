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
                    
                    TextView(text: "Here you will find all the information you need about your favorite characters, their ships and their planets", sizeFont: 24.0).frame(width: 297, height: 290 , alignment: .top)
                
                        
                    TextView(text: "May the force be with you", sizeFont: 32.0)
                    
                    
                    NavigationLink(destination: CharactersView(), label: {
                        ButtonView(text: "Characters", sizeFont: 32.0).frame(width: 350, height: 45)
                    }
                                                  
                )
                    
                    NavigationLink(destination: PlanetsView(), label: {
                        ButtonView(text: "Planets", sizeFont: 32.0).frame(width: 350, height: 45)
                    }
                                                  
                )
                    
                    NavigationLink(destination: ShipsView(), label: {
                        ButtonView(text: "Ships", sizeFont: 32.0).frame(width: 350, height: 45)
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
