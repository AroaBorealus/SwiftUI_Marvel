//
//  GetCharactersUseCase.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import Foundation

protocol GetCharactersUseCaseContract {
    func execute() async throws -> [APICharacter]?
}

final class GetCharactersUseCase: GetCharactersUseCaseContract {
    func execute() async throws -> [APICharacter]? {
        do {
            let response: APIResponseCharacter = try await GetCharactersAPIRequest().perform()
            let characters = response.data.results
            print(characters)
            return characters
        } catch {
            throw GetCharactersUseCaseError(reason: "Use Case Failed")
        }
    }
}

final class GetCharactersUseCaseMock: GetCharactersUseCaseContract {
    func execute() async throws -> [APICharacter]? {
        do {
            let bundle = Bundle(for: GetCharactersUseCaseMock.self)
            guard let url = bundle.url(forResource: "characters", withExtension: "json"),
                  let data = try? Data.init(contentsOf: url)  else {
                throw NSError(domain: "com.aroaborealus.SwiftUIMarvel", code: -1)
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decodedResponse = try decoder.decode(APIResponseCharacter.self, from: data)
            
            
            let characters = decodedResponse.data.results
            print(characters)
            return characters
        } catch {
            throw GetCharactersUseCaseError(reason: "Use Case Failed")
        }
    }
}


struct GetCharactersUseCaseError: Error {
    let reason: String
}

