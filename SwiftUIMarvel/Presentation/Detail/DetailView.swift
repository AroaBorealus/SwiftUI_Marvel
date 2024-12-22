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
        
        switch viewModel.detailStatus{
        case .loading:
            DetailLoaderView()
                .onAppear{
                    viewModel.loadCharacter()
                }
        case .ready:
            SeriesCarousel(series: viewModel.marvelSeries)
        case .noData:
            DetailEmptyView()
        case .error(error: let reason):
            ErrorView(error: reason)
        }
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(useCase: GetCharacterSeriesUseCaseMock()))
        .environment(AppStateVM())
}
