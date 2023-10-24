//
//  CharactersView.swift
//  StarWars_3
//
//  Created by Diogo on 09/10/2023.
//

import SwiftUI

enum GenderFilter: String, CaseIterable {
    case male = "male"
    case female = "female"
    case other = "n/a"
}

struct CharactersView: View {
    @State private var characters: [Character] = []
    @State private var isAPILoaded = false
    @State private var isLoading = true
    @State private var searchTerm = ""
    @State private var isAscendingOrder = true
    @State private var sortBy = 0 // 0 para nome, 1 para ano de nascimento
    @State private var isSheetPresented = false // Adicionado para controlar a apresentação da sheet
    @State private var selectedGenderFilters: Set<GenderFilter> = Set(GenderFilter.allCases) // Permitir múltiplos filtros

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

    var filteredCharacters: [Character] {
        resultsSearch.filter { character in
            if selectedGenderFilters.isEmpty {
                return true // Retorna todos se nenhum filtro estiver selecionado
            } else {
                return selectedGenderFilters.contains(GenderFilter(rawValue: character.gender) ?? .other)
            }
        }
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
                        .frame(width: 118, height: 71)
                    HStack {
                        TextField("Search", text: $searchTerm)
                        .textFieldStyle(RoundedBorderTextFieldStyle())}

                   

                    HStack {
                        HStack{

                             Button(action: {
                                 isSheetPresented.toggle() // Mostra a sheet ao pressionar o botão
                             }) {
                                 Image("sliders")
                                     .resizable()
                                     .frame(width: 24, height: 24)
                             }
                             .sheet(isPresented: $isSheetPresented) {
                                 FilterSheetView(selectedGenderFilters: $selectedGenderFilters)
                             }
                         }
                         .padding()
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
                        ForEach(filteredCharacters.indices, id: \.self) { index in
                            NavigationLink(destination: CharacterViewDetail(character: filteredCharacters[index])) {
                                Text(filteredCharacters[index].name.lowercased())
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
    @Binding var selectedGenderFilters: Set<GenderFilter>

    var body: some View {
        VStack {
            List {
                Section(header: Text("Gender").font(Font.custom("StarJedi Special Edition", size: 16)).foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))) { // Adiciona uma seção com o nome "Gender"
                    LazyHGrid(rows: [GridItem(.flexible())], content: {
                        ForEach(GenderFilter.allCases, id: \.self) { gender in
                            Button(action: {
                                if selectedGenderFilters.contains(gender) {
                                    selectedGenderFilters.remove(gender)
                                } else {
                                    selectedGenderFilters.insert(gender)
                                }
                            }) {
                                Text(gender.rawValue.capitalized)
                                    .padding(8)
                                    .background(selectedGenderFilters.contains(gender) ? Color(red: 1, green: 0.91, blue: 0.12) : .white)
                                    .cornerRadius(8)
                                    .font(Font.custom("StarJedi Special Edition", size: 16))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                            }
                        }
                    })
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets()) // Para remover o espaço à esquerda
                }
            }.listStyle(PlainListStyle())
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)) // Remove o espaço em branco das células
                .background(.black)
          //  .listStyle(PlainListStyle())
           // .padding()
           // .background(Color.black) // Adiciona fundo preto à lista

            Spacer()

            Button("Fechar") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
        }
    }
}





struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
