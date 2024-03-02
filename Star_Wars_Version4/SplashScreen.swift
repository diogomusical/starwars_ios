//
//  SplashScreen.swift
//  Star_Wars_Version4
//
//  Created by Diogo on 13/09/2023.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    //Variaveis para a imagem do fundo
    @State private var backgroundWidth = 844.0
    @State private var backgroundHeight = 473.99997
    @State private var backgroundRotateDegree = 90.0
    //@State private var backgroundFile = "background"
    // Fim das variáveis de imagem do Fundo
    //Variaveis para o logotipo
    @State private var logoWidth = 272.0
    @State private var logoHeight = 165.0
    @State private var logoFile = "logotipo_starwars"
    
    var body: some View {
        if isActive{
            ContentView()
        }
        else{
            GeometryReader { geo in
                ZStack{
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                        .opacity(1.0)
                    
                /*    Text("Demo View")
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)*/
                    Image(logoFile)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: logoWidth, height: logoHeight)
                        .clipped()
                }
                
            }
          
                //Rectangle()
                    //.foregroundColor(.clear)
                    //.frame(width: backgroundWidth, height: backgroundHeight)
              //      .background(
              //  Image("background")
      //              .resizable()
        //            .aspectRatio(contentMode: .fill)
          //          .frame(width: backgroundWidth, height: backgroundHeight)
            //        .clipped()
               // )
                //    .rotationEffect(Angle(degrees: backgroundRotateDegree))
              //      .overlay(
            //VStack{  Rectangle()
         //       .foregroundColor(.clear)
         //       .frame(width: logoWidth, height: logoHeight)
          //      .background(
         //   Image(logoFile)
          //      .resizable()
            //    .aspectRatio(contentMode: .fill)
           //     .frame(width: logoWidth, height: logoHeight)
            //    .clipped()
           // )
            //)
            //}
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 10.0){
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
