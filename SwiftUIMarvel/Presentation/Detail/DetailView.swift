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
        List{
            ForEach(viewModel.apiSeries){ serie in
                Text(serie.title)
            }
        }
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(useCase: GetAllSeriesUseCaseMock()))
        .environment(AppStateVM())
}
