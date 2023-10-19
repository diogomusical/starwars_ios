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
    @State internal var alignment: Int = 1
    var body: some View {
        Text(text)
            .font(Font.custom(typeFont, size: sizeFont))
            .multilineTextAlignment(.center)
            .foregroundColor(Color(red: 1.0, green: 0.91, blue: 0.12))
    }
}

#Preview {
    TextView(text: "Example Text", sizeFont: 32.0)
}

