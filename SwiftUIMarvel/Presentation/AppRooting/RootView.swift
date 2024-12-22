//
//  RootView.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import SwiftUI

struct RootView: View {
    @Environment(AppStateVM.self) var appState
       
    var body: some View {
        switch(appState.status){
            case .loading:
                withAnimation {
                    LoadingView()
                }
            case .ready:
                withAnimation {
                    HomeView()
                }
            case .detail(charID: let charID):
                withAnimation{
                    DetailView(viewModel: DetailViewModel(characterID: charID))
                }
            case .error(error: let errorString):
                withAnimation {
                    ErrorView(error: errorString)
                }
        }
    }
}

#Preview {
    RootView()
        .environment(AppStateVM())
}
