//
//  SwiftDataCharacter.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 19/12/24.
//

import Foundation

final class MarvelCharacter : Identifiable {
    var characterId: String
    var characterName: String
    var portrayal: String       //Description es una palabra reservada, así que ponemos un sinónimo
    var thumbnailPath: String
    var thumbnailExtension: String

    init(characterId: String, characterName: String, portrayal: String, thumbnail: Thumbnail) {
        self.characterId = characterId
        self.characterName = characterName
        self.portrayal = portrayal
        self.thumbnailPath = thumbnail.path
        self.thumbnailExtension = thumbnail.thumbnailExtension
    }
    
    init(APICharacter: APICharacter)
    {
        self.characterId = String(APICharacter.id)
        self.characterName = APICharacter.name
        self.portrayal = APICharacter.description ?? ""
        self.thumbnailPath = APICharacter.thumbnail.path
        self.thumbnailExtension = APICharacter.thumbnail.thumbnailExtension
    }
}
