//
//  Series.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 22/12/24.
//

import Foundation

final class MarvelSerie : Identifiable {
    var serieId: String
    var serieTitle: String
    var thumbnailPath: String
    var thumbnailExtension: String
    var marverlCharacters: [String] = []

    init(serieId: String, serieTitle: String, thumbnail: Thumbnail, characterID: String) {
        self.serieId = serieId
        self.serieTitle = serieTitle
        self.thumbnailPath = thumbnail.path
        self.thumbnailExtension = thumbnail.thumbnailExtension
        addCharacter(characterID: characterID)
    }
    
    init(APISeries: APISeries, characterID: String)
    {
        self.serieId = String(APISeries.id)
        self.serieTitle = APISeries.title
        self.thumbnailPath = APISeries.thumbnail.path
        self.thumbnailExtension = APISeries.thumbnail.thumbnailExtension
        addCharacter(characterID: characterID)
    }
    
    func addCharacter(characterID: String)
    {
        if self.marverlCharacters.contains(characterID) {return}

        self.marverlCharacters.append(characterID)
    }
}
