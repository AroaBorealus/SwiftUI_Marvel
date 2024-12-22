//
//  CharacterRowView.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 17/12/24.
//

import SwiftUI

struct CharacterRowView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var character: MarvelCharacter
    
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: "\(character.thumbnailPath)/standard_fantastic.\(character.thumbnailExtension)")) { photo in
                photo
                    .resizable()
                    .cornerRadius(20)
                    .scaledToFit()
                    .padding([.leading, .trailing], 20)
            } placeholder: {
                ZStack{
                    Image(.placeholder)
                        .resizable()
                        .scaledToFit()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
            
            //los datos del heroe
            VStack(alignment: .leading){
                HStack{
                    StrokeText(text: character.characterName, width: 1.5, color: (colorScheme == .dark ? .black : .white))
                        .font(.title)
                        .bold()
                        .padding(.leading, 30)
                        .padding(.top, 10)
                    
                    Spacer()
                }
                
                Spacer()
                
                
            }
        }
    }
}

#Preview {
    CharacterRowView(character: mockMarvelCharacter)
}
