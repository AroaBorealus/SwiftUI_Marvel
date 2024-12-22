//
//  FakeDB.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 22/12/24.
//

import Foundation

final class FakeDB{
    
    static var shared = FakeDB()
    
    var characters: [MarvelCharacter] = []
    var series: [MarvelSerie] = []
        
    func addCharacters(_ newCharacters: [MarvelCharacter]){
        for character in newCharacters{
            characters.append(character)
        }
    }
    
    func addCharacters(_ newCharacters: [APICharacter]){
        for character in newCharacters{
            characters.append(MarvelCharacter(APICharacter: character))
        }
    }
    
    func getCharacters() -> [MarvelCharacter]{
        return characters
    }
    
    func clearCharacters(){
        characters = []
    }
    
    func addSeries(_ newSeries: [MarvelSerie]){
        for serie in newSeries{
            deleteSeries(seriesID: serie.serieId)
            series.append(serie)
        }
    }
    
    func addSeries(_ newSeries: [APISeries], _ characterID: String){
        for serie in newSeries{
            if let oldSeries = getSeries(serieID: String(serie.id)) {
                oldSeries.addCharacter(characterID: characterID)
            }
            else {
                series.append(MarvelSerie(APISeries: serie, characterID: characterID))
            }
        }
    }
    
    func getSeries() -> [MarvelSerie]{
        return series
    }
    
    func getSeries(characterID: String) -> [MarvelSerie]{
        return series.filter { $0.marverlCharacters.contains(characterID)}
    }
    
    func getSeries(serieID: String) -> MarvelSerie? {
        return series.first{$0.serieId == serieID}
    }
    
    func clerSeries(){
        series = []
    }
    
    func deleteSeries(seriesID: String){
        series.removeAll { $0.serieId == seriesID }
    }
}
