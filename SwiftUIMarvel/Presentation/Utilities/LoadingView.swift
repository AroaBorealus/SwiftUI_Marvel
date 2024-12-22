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
        ZStack{
            ExecuteCode{
                if(viewModel.didFinishLoad){
                    appState.status = .ready
                }
            }
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            ProgressView()
                .tint(Color.white)
                .controlSize(.large)
        }
    }
}

struct ExecuteCode : View {
    init( _ codeToExec: () -> () )
    {
        codeToExec()
    }
    
    var body: some View {
        EmptyView()
    }
}

#Preview {
    LoadingView().environment(AppStateVM())
}
