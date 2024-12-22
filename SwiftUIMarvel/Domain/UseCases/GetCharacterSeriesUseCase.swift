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
        do {
            let bundle = Bundle(for: GetCharactersUseCaseMock.self)
            guard let url = bundle.url(forResource: "series", withExtension: "json"),
                  let data = try? Data.init(contentsOf: url)  else {
                throw NSError(domain: "com.aroaborealus.SwiftUIMarvel", code: -1)
            }
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'.'SSS'Z'"
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(formatter)
            let decodedResponse = try decoder.decode(APIResponseSeries.self, from: data)
            
            
            let APIseries = decodedResponse.data.results
            print(APIseries)
            FakeDB.shared.addSeries(APIseries, charID)

            return FakeDB.shared.getSeries(characterID: charID)
        } catch {
            throw GetCharacterSeriesUseCaseError(reason: "Use Case Failed")
        }
    }
}


struct GetCharacterSeriesUseCaseError: Error {
    let reason: String
}
