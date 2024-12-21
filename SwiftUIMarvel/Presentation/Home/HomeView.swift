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
                ForEach(viewModel.apiCharacters){ character in
                    NavigationLink {
//                        HeroesDetailView(hero: hero, vmHeros: viewModel)
                    } label: {
                        CharacterRowView(character: character)
                    }

                }
            }
            .navigationBarTitle("Characters")
            .searchable(text:$viewModel.filterUI, prompt: "Buscar personajes")
//            .onChange(of: viewModel.filterUI, { oldValue, newValue in
//
//                //Llamar a la recarga...
//                if !newValue.isEmpty{
//                    //no Vacio
//                    //minimo 2 caractres
//                    if newValue.count > 2{
//                        //llamo al viewmodel.  Laamos llamada de red
//                        Task{
//                            await viewModel.getHeros(newSearch: newValue)
//                        }
//                    }
//                } else {
//                    //Vacio
//                    Task{
//                        await viewModel.getHeros(newSearch: "")
//                    }
//
//                }
//
//            })
        }
    }
}


#Preview {
    HomeView(viewModel: HomeViewModel(useCase: GetCharactersUseCaseMock()))
        .environment(AppStateVM())
}
