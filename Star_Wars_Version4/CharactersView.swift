//
//  CharactersView.swift
//  StarWars_3
//
//  Created by Diogo on 09/10/2023.
//

import SwiftUI

struct CharactersView: View {
    @State private var characters: [Character] = []
    @State private var isAPILoaded = false
    @State private var isLoading = true
    @State private var searchTerm = ""
    @State private var isAscendingOrder = true
    @State private var sortBy = 0 // 0 para nome, 1 para ano de nascimento
    
    var resultsSearch: [Character] {
        var sortedCharacters = characters
        
        switch sortBy {
        case 0: // Ordenar por nome
            sortedCharacters.sort { (char1, char2) in
                return char1.name < char2.name
            }
        case 1: // Ordenar por ano de nascimento
            sortedCharacters.sort { (char1, char2) in
                if let year1 = char1.birthYear, let year2 = char2.birthYear {
                    return year1 < year2
                } else if char1.birthYear != nil {
                    return true
                } else {
                    return false
                }
            }
        default:
            break
        }
        
        if !isAscendingOrder {
            sortedCharacters.reverse()
        }
        
        if searchTerm.isEmpty {
            return sortedCharacters
        } else {
            return sortedCharacters.filter {
                $0.name.lowercased().contains(searchTerm.lowercased())
            }
        }
    }
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .black
        UISearchBar.appearance().showsCancelButton = false
    }
    
    func fetchCharacters() {
        guard let url = URL(string: "https://swapi.py4e.com/api/people/") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let characterResponse = try JSONDecoder().decode(CharacterResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.characters = characterResponse.results
                    self.isLoading = false
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    var body: some View {
        NavigationView {
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .onAppear(perform: fetchCharacters)
            } else {
                VStack {
                    Image("logotipo_starwars")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 118, height: 71) // Ajuste o tamanho conforme necessário
                    
                    TextField("Search", text: $searchTerm)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    HStack {
                        Button(action: {
                            sortBy = 0 // Ordenar por nome
                        }) {
                            Text("name")
                                .frame(width: 78, height: 25)
                                .font(Font.custom("StarJedi Special Edition", size: 14))
                                .multilineTextAlignment(.center)
                                .background(sortBy == 0 ? Color(red: 1, green: 0.91, blue: 0.12) : Color.white)
                                .cornerRadius(36)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 36)
                                        .inset(by: 0.5)
                                        .stroke(Color(red: 1, green: 0.91, blue: 0.12), lineWidth: 1)
                                )
                        }
                        .foregroundColor(.black)
                        
                        Button(action: {
                            sortBy = 1 // Ordenar por ano de nascimento
                        }) {
                            Text("year")
                                .frame(width: 78, height: 25)
                                .font(Font.custom("StarJedi Special Edition", size: 14))
                                .multilineTextAlignment(.center)
                                .background(sortBy == 1 ? Color(red: 1, green: 0.91, blue: 0.12) : Color.white)
                                .cornerRadius(36)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 36)
                                        .inset(by: 0.5)
                                        .stroke(Color(red: 1, green: 0.91, blue: 0.12), lineWidth: 1)
                                )
                        }
                        .foregroundColor(.black)
                        
                        Button(action: {
                            isAscendingOrder.toggle()
                        }) {
                            if isAscendingOrder {Image("down_yellow").rotationEffect(.degrees(180)) }
                            else {Image("up_white")}
                        }
                        
                        Button(action: {
                            isAscendingOrder.toggle()
                        }) {
                            if isAscendingOrder {Image("up_white").rotationEffect(.degrees(180))}
                            else {Image("down_yellow") }
                        }
                        
                    }
                    .padding()
                    
                    List {
                        ForEach(resultsSearch.indices, id: \.self) { index in
                            NavigationLink(destination: CharacterViewDetail(character: resultsSearch[index])) {
                                Text(resultsSearch[index].name.lowercased())
                                    .font(Font.custom("StarJedi Special Edition", size: 20))
                                    .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .scrollContentBackground(.hidden)
                    .listRowBackground(Color.clear)
                }
                .background(
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                )
            }
        }
    }
}



struct FilterSheetView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        // Conteúdo da sua Sheet de filtros aqui
        Text("Filtros")
            .padding()
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}


