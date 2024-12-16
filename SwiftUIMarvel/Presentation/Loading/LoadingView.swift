//
//  LoadingView.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Entrar")
        }
        .padding()
    }
}

#Preview {
    LoadingView()
}
