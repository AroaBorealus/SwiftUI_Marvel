//
//  HomeViewModel.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import Foundation

@Observable
final class HomeViewModel {
    var state: Status = .loading
    var apiCharacters = [APICharacter]()
    
    var filterUI : String = ""
    
    @ObservationIgnored
    private var useCase: GetCharactersUseCaseContract //esto NO es un observable
    
    init(useCase: GetCharactersUseCaseContract = GetCharactersUseCase()) {
        self.useCase = useCase
        
        Task{
            await getCharacters()
        }
    }
    
    @MainActor
    func getCharacters() async {
        do {
            let data = try await useCase.execute()
            
            guard let characters = data else {
                throw GetCharactersUseCaseError(reason: "Character array found empty")
            }
            
            self.apiCharacters = characters
            state = .error(error: "yupierror")
            
//            self.homeState = .ready
        } catch let error as GetCharactersUseCaseError {
            state = .error(error: error.reason)
        } catch {
            state = .error(error: "A home error has occurred")
        }
    }
}
