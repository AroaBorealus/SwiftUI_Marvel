//
//  HomeView.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import SwiftUI

struct HomeView: View {
    @Environment(AppStateVM.self) var appState
    
    @State var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel = HomeViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.characters){ character in
                    NavigationLink {
                        DetailView(viewModel: DetailViewModel(characterID: character.characterId))
                    } label: {
                        CharacterRowView(character: character)
                    }
                }
            }
            .navigationBarTitle("Characters")
            .searchable(text:$viewModel.filterUI, prompt: "Buscar personajes")
        }
    }
}


#Preview {
    HomeView(viewModel: HomeViewModel(useCase: GetCharactersUseCaseMock()))
        .environment(AppStateVM())
}
