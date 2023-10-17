//
//  SplashScreenView.swift
//  StarWars_3
//
//  Created by Diogo on 09/10/2023.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var shouldShowContentView = false
    
    var body: some View {
        if shouldShowContentView {
            ContentView()
        } else {
            ZStack{
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack(alignment: .center){
                    Image("logotipo_starwars")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 272, height: 165)
                        .clipped()
                    
                    
                }
                .onAppear {
                    // Execute qualquer lógica que você deseja na SplashScreen,
                    // como carregar dados, fazer autenticação, etc.
                    // Após a conclusão da lógica, você pode navegar para a próxima tela.
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        shouldShowContentView = true
                    }
                }
            }
        }
    }
}


struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
