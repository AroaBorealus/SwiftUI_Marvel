//
//  DetailLoaderView.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 22/12/24.
//

import SwiftUI

struct DetailLoaderView: View {
    var body: some View {
        VStack{
            Spacer()
            ZStack{
                Image(.jeffLoading)
                    .resizable()
                    .scaledToFit()
            }
            VStack{
                ProgressView()
                    .controlSize(.large)
                Text("loaderViewText")
                    .font(.largeTitle)
            }
            Spacer()
        }
        
    }
}

#Preview {
    DetailLoaderView()
}
