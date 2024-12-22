//
//  GetAllComicsUseCase.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 21/12/24.
//

import Foundation

protocol GetCharacterSeriesUseCaseContract {
    func execute(charID: String) async throws -> [MarvelSerie]?
}

final class GetCharacterSeriesUseCase: GetCharacterSeriesUseCaseContract {
    func execute(charID: String) async throws -> [MarvelSerie]? {
        
        var series: [MarvelSerie] = []
        series = FakeDB.shared.getSeries(characterID: charID)
        
        if(series.isEmpty) {
            do {
                let response: APIResponseSeries = try await GetCharacterSeriesAPIRequest(charID: charID).perform()
                let APIseries = response.data.results
                print(APIseries)
                
                FakeDB.shared.addSeries(APIseries, charID)
                series = FakeDB.shared.getSeries(characterID: charID)
            } catch {
                throw GetCharactersUseCaseError(reason: "Use Case Failed")
            }
        }
        
        return series
    }
}

final class GetCharacterSeriesUseCaseMock: GetCharacterSeriesUseCaseContract {
    func execute(charID: String = "") async throws -> [MarvelSerie]? {
        return [mockMarvelSeries,mockMarvelSeries,mockMarvelSeries]
    }
}


struct GetCharacterSeriesUseCaseError: Error {
    let reason: String
}
