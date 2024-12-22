//
//  ErrorView.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import SwiftUI

struct ErrorView: View {
    @Environment(AppStateVM.self) var appState
    
    private var textError: String
    
    init(error: String) {
        textError = error
    }
    
    var body: some View {
        VStack{
            Text(textError)
                .foregroundStyle(.red)
                .font(.headline)
                .bold()
                .padding(.top, 40)
            Button {
                appState.status = .ready
            } label: {
                Text("Volver")
                    .font(.title2)
                    .frame(width: 300, height: 50)
                    .background(.orange)
                    .cornerRadius(15)
                    .shadow(radius: 10, x:20, y:20)
                    .padding(.top, 40)
            }

        }
    }
}

#Preview {
    ErrorView(error: "Error de preview")
        .environment(AppStateVM())
}
