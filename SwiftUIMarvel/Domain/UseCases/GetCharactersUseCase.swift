//
//  GetCharactersUseCase.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import Foundation

protocol GetCharactersUseCaseContract {
    func execute() async throws
}

final class GetCharactersUseCase: GetCharactersUseCaseContract {
    func execute() async throws {
        do {
            let response: APIResponseCharacter = try await GetCharactersAPIRequest().perform()
            let characters = response.data.results
            print(characters)
            FakeDB.shared.addCharacters(characters)
        } catch {
            throw GetCharactersUseCaseError(reason: "Use Case Failed")
        }
    }
}

final class GetCharactersUseCaseMock: GetCharactersUseCaseContract {
    func execute() async throws{
        FakeDB.shared.clearCharacters()
        FakeDB.shared.addCharacters([mockMarvelCharacter])
    }
}


struct GetCharactersUseCaseError: Error {
    let reason: String
}

