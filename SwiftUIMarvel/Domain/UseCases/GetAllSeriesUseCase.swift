//
//  GetAllComicsUseCase.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 21/12/24.
//

import Foundation

protocol GetAllSeriesUseCaseContract {
    func execute() async throws -> [APISeries]?
}

final class GetAllSeriesUseCase: GetAllSeriesUseCaseContract {
    func execute() async throws -> [APISeries]? {
        do {
            let response: APIResponseSeries = try await GetSeriesAPIRequest().perform()
            let series = response.data.results
            print(series)
            return series
        } catch {
            throw GetCharactersUseCaseError(reason: "Use Case Failed")
        }
    }
}

final class GetAllSeriesUseCaseMock: GetAllSeriesUseCaseContract {
    func execute() async throws -> [APISeries]? {
        do {
            let bundle = Bundle(for: GetCharactersUseCaseMock.self)
            guard let url = bundle.url(forResource: "series", withExtension: "json"),
                  let data = try? Data.init(contentsOf: url)  else {
                throw NSError(domain: "com.aroaborealus.SwiftUIMarvel", code: -1)
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decodedResponse = try decoder.decode(APIResponseSeries.self, from: data)
            
            
            let series = decodedResponse.data.results
            print(series)
            return series
        } catch {
            throw GetAllSeriesUseCaseError(reason: "Use Case Failed")
        }
    }
}


struct GetAllSeriesUseCaseError: Error {
    let reason: String
}


