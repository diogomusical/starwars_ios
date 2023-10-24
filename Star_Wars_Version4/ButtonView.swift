//
//  ButtonView.swift
//  StarWars_3
//
//  Created by Diogo Coelho da Silva on 19/10/2023.
//

import SwiftUI

struct ButtonView: View {
    @State internal var text: String
    @State internal var typeFont: String = "StarJediSpecialEdition"
    @State internal var sizeFont: Double = 32
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            //.frame(width:  350, height: 45)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(Color.primaryColor)
            .cornerRadius(36)
            .overlay(
        Text(text)
            .font(Font.custom(typeFont, size: sizeFont))
            .multilineTextAlignment(.center)
            .foregroundColor(Color.black)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
          //  .frame(width: widthFrameText, height: heightFrameText, alignment: .top)
            )
    }
}

#Preview {
    ButtonView(text: "Example Button", sizeFont: 32.0)
}
