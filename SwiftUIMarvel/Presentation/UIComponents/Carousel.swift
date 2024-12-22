//
//  Carousel.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 22/12/24.
//

import SwiftUI


struct SeriesCarousel: View {
    
    @State var scrollPosition: Int?
    private let pageWidth: CGFloat = UIScreen.main.bounds.width-20
    private let pageHeight: CGFloat = UIScreen.main.bounds.height-100
    private let series: [MarvelSerie]
    
    init(series: [MarvelSerie] = [mockMarvelSeries,mockMarvelSeries]){
        self.series = series
    }
    
    var body: some View {
        ZStack {
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(series) { serie in
                        VStack{
                            StrokeText(text: serie.serieTitle, width: 1.5, color: Color.white)
                            AsyncImage(url: URL(string: "\(serie.thumbnailPath)/portrait_uncanny.\(serie.thumbnailExtension)")) { photo in
                                photo
                                    .resizable()
                                    .cornerRadius(20)
                                    .scaledToFit()
                                //                                .padding([.leading, .trailing], 20)
                            } placeholder: {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle())
                            }
                        }.foregroundStyle(.black)
                            .font(.system(size: 24, weight: .bold))
                            .frame(width: pageWidth, height: pageHeight)
                            .padding(.horizontal, (UIScreen.main.bounds.width - pageWidth)/2)
                    }
                }
                .scrollTargetLayout()
                .id(3)
            }
            .scrollPosition(id: $scrollPosition)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.paging)
            .id(2)
            
            VStack {
                Spacer()
                dotsView
                    .padding(.bottom, 20)
            }
            .id(1)
        }
        
    }
    
    private var dotsView: some View{
        
        HStack {
            ForEach(0..<series.count, id: \.self) { index in
                Circle()
                    .fill(Color.gray.opacity(0.8
                                             //                        (index == (scrollPosition ?? 0) % series.count) ? 0.8 : 0.3 //TODO: Change opacity depending on current position
                                            ))
                    .frame(width: (series.count > 6 ? 10.0 : 20.0))
                
            }
        }
        .frame(width: pageWidth)
    }
}


#Preview {
    SeriesCarousel()
}
