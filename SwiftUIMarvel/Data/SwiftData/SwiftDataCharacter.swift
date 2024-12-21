//
//  SwiftDataCharacter.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 19/12/24.
//

import SwiftData
import Foundation

@Model
class SwiftDataCharacter {
    @Attribute(.unique) var id: UUID
    var characterId: String
    var characterName: String
    var portrayal: String       //Description es una palabra reservada, así que ponemos un sinónimo
    var thumbnail: String

    init(characterId: String, characterName: String, portrayal: String, thumbnail: Thumbnail) {
        self.id = UUID()
        self.characterId = characterId
        self.characterName = characterName
        self.portrayal = portrayal
        self.thumbnail = "\(thumbnail.path).\(thumbnail.thumbnailExtension)"
    }
}
