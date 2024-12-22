//
//  Carousel.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 22/12/24.
//

import SwiftUI

//fileprivate enum Colors: String, CaseIterable, Identifiable {
//    case red
//    case blue
//    case orange
//    case purple
//    
//    var id: UUID { UUID() }
//    
//    var color: Color {
//        switch self {
//        case .red:
//            Color.red
//        case .blue:
//            Color.blue
//        case .orange:
//            Color.orange
//        case .purple:
//            Color.purple
//        }
//    }
//}

//struct ImageCarousel: View {
//    
//    @State var scrollPosition: Int?
//    private let pageWidth: CGFloat = UIScreen.main.bounds.width-20
//    private let pageHeight: CGFloat = UIScreen.main.bounds.height-100
////    private let colors = Colors.allCases
//    private let series: [Serie]
//    
//    init(series: [Serie]){
//        
//    }
//
//    var body: some View {
//        ScrollView(.horizontal) {
//            HStack(spacing: 0) {
//                ForEach(0..<colors.count, id:\.self) { index in
//                    let color = colors[index]
//                    Text(color.rawValue)
//                        .foregroundStyle(.black)
//                        .font(.system(size: 24, weight: .bold))
//                        .frame(width: pageWidth, height: pageHeight)
//                        .background(
//                            RoundedRectangle(cornerRadius: 16)
//                                .fill(color.color)
//                        )
//                        .padding(.horizontal, (UIScreen.main.bounds.width - pageWidth)/2)
////                        .padding(.bottom)
//                }
//            }
//            .scrollTargetLayout()
//        }
//        .scrollPosition(id: $scrollPosition)
//        .scrollIndicators(.hidden)
//        .scrollTargetBehavior(.paging)
//    }
//}

//#Preview {
//    ImageCarousel()
//}
