//
//  CharacterRowView.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 17/12/24.
//

import SwiftUI

struct CharacterRowView: View {
    var character: APICharacter
    
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: "\(character.thumbnail.path)/landscape_xlarge.\(character.thumbnail.thumbnailExtension)")) { photo in
                photo
                    .resizable()
                    .cornerRadius(20)
                    .padding([.leading, .trailing], 20)
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
            
            //los datos del heroe
            VStack(alignment: .leading){
                HStack{
                    StrokeText(text: character.name, width: 1.5, color: .white)
                        .font(.title)
                        .bold()
                        .padding(.leading, 30)
                    
                    Spacer()
                }
                
                Spacer()
                
                //Imagen de me gusta
//                if hero.favorite  {
//                    Image(systemName: "heart.circle")
//                        .resizable()
//                        .foregroundStyle(.red)
//                        .frame(width: 40, height: 40)
//                        .padding(.leading, 30)
//                } else {
//                    Image(systemName: "heart.circle")
//                        .resizable()
//                        .foregroundStyle(.gray)
//                        .frame(width: 40, height: 40)
//                        .padding(.leading, 30)
//                }
            }
        }
    }
}

//struct StrokeText: View {
//    let text: String
//    let width: CGFloat
//    let color: Color
//
//    var body: some View {
//        ZStack{
//            ZStack{
//                Text(text).offset(x:  width, y:  width)
//                Text(text).offset(x: -width, y: -width)
//                Text(text).offset(x: -width, y:  width)
//                Text(text).offset(x:  width, y: -width)
//            }
//            .foregroundColor(color)
//            Text(text)
//        }
//    }
//}

#Preview {
    CharacterRowView(character: MockAPICharacter)
}
