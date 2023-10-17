//
//  CharactersView.swift
//  StarWars_3
//
//  Created by Diogo on 09/10/2023.
//

import SwiftUI

/*struct CustomTableView: UIViewRepresentable {
 func makeUIView(context: Context) -> UITableView {
 let tableView = UITableView()
 tableView.backgroundColor = .red
 return tableView
 }
 
 func updateUIView(_ uiView: UITableView, context: Context) {
 // Update any properties or configurations here, if needed.
 }
 }*/


struct CharactersView: View {
    @State private var characters: [Character] = []
    @State private var isAPILoaded = false
    @State private var isLoading = true
    @State private var searchTerm = ""
    
    var resultsSearch: [Character] {
            if searchTerm.isEmpty {
                return characters
            } else {
                return characters.filter { $0.name.contains(searchTerm) }
            }
        }
    
    init() {
        UITableView.appearance().separatorStyle = .none
      //  UISearchBar.appearance().backgroundColor = UIColor.green
      //  UISearchBar.appearance().tintColor = UIColor.green
      //  UISearchBar.appearance().barTintColor = UIColor.yellow
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white //Para colocar o fundo somente da barra de pesquisa a branco e letrsa pretas
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .black //Para colocar o fundo somente da barra de pesquisa a branco e letras pretas
        UISearchBar.appearance().showsCancelButton = false // Para remover o botão cancelar

    }
    
    var body: some View {
        NavigationView {
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .onAppear(perform: fetchCharacters)
            } else {
                //VStack{
                    
                    
                    List {
                        Section() {
                            Image("logotipo_starwars")
                                   .resizable()
                                   //.aspectRatio(contentMode: .fit)
                                   .frame(width: 118,height: 71)
                                   .frame(maxWidth: .infinity, maxHeight: .infinity) //Para alinhar ao centro a imagem
                            .listRowInsets(EdgeInsets())
                            .listRowBackground(Color.clear)

                        }
                        
                        ForEach(resultsSearch.indices, id: \.self) { index in
                            
                            NavigationLink(destination: CharacterViewDetail(character: resultsSearch[index])) {
                                //   VStack(alignment: .center) {
                                Text(resultsSearch[index].name.lowercased())
                                
                                    .font(Font.custom("StarJedi Special Edition", size: 20))
                                    .foregroundColor(Color(red: 1, green: 0.91, blue: 0.12))
                                    .frame(maxWidth: .infinity, alignment: .center)
                                 //   .navigationBarHidden(true) // Para retirar a barra do back

                            }
                            //
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden) //Retira as barras entre elementos da lista
                           // .navigationBarHidden(true) // Para retirar a barra do back

                        }
                    }
                    .listStyle(PlainListStyle())
                    .scrollContentBackground(.hidden)
                    .listRowBackground(Color.clear)
                   // .navigationBarHidden(true) // Para retirar a barra do back

                    .background(
                     Image("background")
                         .resizable()
                         .edgesIgnoringSafeArea(.all)
                    )
                    .searchable(text: $searchTerm)
                
                
                }
            //}
        }
    }
    
    func fetchCharacters() {
        guard let url = URL(string: "https://swapi.py4e.com/api/people/")
        else {
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
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
