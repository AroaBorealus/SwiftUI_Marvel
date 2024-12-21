//
//  LoadingView.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import SwiftUI

struct LoadingView: View {
        
    var body: some View {
        ZStack{
            Image(.image)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            ProgressView()
                .tint(Color.white)
                .controlSize(.large)
        }
    }
}

#Preview {
    LoadingView()
}
