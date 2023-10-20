//
//  TextView.swift
//  StarWars_3
//
//  Created by Diogo Coelho da Silva on 19/10/2023.
//

import SwiftUI

struct TextView: View {
    @State internal var text: String
    @State internal var typeFont: String = "StarJediSpecialEdition"
    @State internal var sizeFont: Double
    @State var texthalignment: HorizontalAlignment = .center
    @State var textmhalignment: TextAlignment = .center
    
    
    var body: some View {
        Text(text)
            .font(Font.custom(typeFont, size: CGFloat(sizeFont)))
            .frame(maxWidth: .infinity, alignment: Alignment(horizontal: texthalignment, vertical: .center))
           .multilineTextAlignment(textmhalignment) // Corrigido aqui
            .foregroundColor(Color(red: 1.0, green: 0.91, blue: 0.12))
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(text: "Example Text", sizeFont: 32.0)
    }
}


