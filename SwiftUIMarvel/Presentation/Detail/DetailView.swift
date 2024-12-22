//
//  DetailView.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 21/12/24.
//

import SwiftUI

struct DetailView: View {
    @Environment(AppStateVM.self) var appState
    @State var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel = DetailViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("Series")
            .font(.largeTitle)
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(viewModel.marvelSeries){ serie in
                    VStack {
                        AsyncImage(url: URL(string: "\(serie.thumbnailPath)/landscape_xlarge.\(serie.thumbnailExtension)")) { photo in
                            photo
                                .resizable()
                                .cornerRadius(20)
                                .padding([.leading, .trailing], 20)
                        } placeholder: {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                        }
                        Text(serie.serieTitle)
                    }
                    .frame(width: 250, height: 350)
                }
            }
        }.onAppear{
            viewModel.loadCharacter()
        }
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(useCase: GetCharacterSeriesUseCaseMock()))
        .environment(AppStateVM())
}
