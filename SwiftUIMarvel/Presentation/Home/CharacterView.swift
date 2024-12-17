//
//  CharacterView.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 17/12/24.
//

import SwiftUI

struct CharacterView: View {
    var character: APICharacter
    
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: "\(character.thumbnail.path).\(character.thumbnail.thumbnailExtension)")) { photo in
                photo
                    .resizable()
                    .cornerRadius(20)
                    .padding([.leading, .trailing], 20)
                    .opacity(0.9)
                
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
            
            //los datos del heroe
            VStack(alignment: .leading){
                HStack{
                    Text(character.name)
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

#Preview {
    CharacterView(character: MockAPICharacter)
}
