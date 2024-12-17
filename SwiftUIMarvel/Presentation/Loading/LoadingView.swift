//
//  LoadingView.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import SwiftUI

struct LoadingView: View {
    
    @Environment(AppStateVM.self) var appState
    
    @State var viewModel: LoadingViewModel
    
    init(viewModel: LoadingViewModel = LoadingViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            List{
                ForEach(viewModel.apiCharacters){ character in
                    NavigationLink {
                        //Destination
                        //                        HeroesDetailView(hero: hero, vmHeros: viewModel)
                    } label: {
                        //Label
                        CharacterView(character: character)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    LoadingView(viewModel: LoadingViewModel(useCase: GetCharactersUseCaseMock()))
        .environment(AppStateVM())
}
