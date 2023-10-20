//
//  ShipsView.swift
//  StarWars_3
//
//  Created by Diogo on 09/10/2023.
//

import SwiftUI

struct ShipsView: View {
    @State var text = "Exemplo1"
    var body: some View {
        Text("Página de Naves Espaciais")
            .font(.title)
    }
}

struct ShipsView_Previews: PreviewProvider {
    static var previews: some View {
        ShipsView()
    }
}
