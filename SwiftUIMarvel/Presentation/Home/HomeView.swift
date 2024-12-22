//
//  HomeView.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import SwiftUI

struct HomeView: View {
    @Environment(AppStateVM.self) var appState
    
    @State var viewModel: HomeViewModelContract
    
    init(viewModel: HomeViewModelContract = HomeViewModel()) {
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
            .navigationBarTitle("homeNavBarTitle")
        }
    }
}


#Preview {
    
    HomeView(viewModel: HomeViewModelMock())
        .environment(AppStateVM())
}
