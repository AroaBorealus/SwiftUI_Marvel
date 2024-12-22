//
//  DetailEmptyView.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 22/12/24.
//

import SwiftUI

struct DetailEmptyView: View {
    var body: some View {
        VStack{
            Spacer()
            VStack{
                Image(.jeffNoData)
                    .resizable()
                    .scaledToFit()
                Text("emptyViewText")
                    .multilineTextAlignment(.center)
                    .font(.title)
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    DetailEmptyView()
}
