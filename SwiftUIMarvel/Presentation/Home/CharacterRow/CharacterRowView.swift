//
//  CharacterRowView.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 17/12/24.
//

import SwiftUI

struct CharacterRowView: View {
    var character: MarvelCharacter
    
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: "\(character.thumbnailPath)/landscape_xlarge.\(character.thumbnailExtension)")) { photo in
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
                    StrokeText(text: character.characterName, width: 1.5, color: .white)
                        .font(.title)
                        .bold()
                        .padding(.leading, 30)
                    
                    Spacer()
                }
                
                Spacer()
                
                
            }
        }
    }
}

//#Preview {
//    CharacterRowView(character: MockAPICharacter)
//}
