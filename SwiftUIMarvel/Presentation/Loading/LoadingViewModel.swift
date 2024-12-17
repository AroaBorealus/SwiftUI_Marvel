//
//  LoadingViewModel.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import Foundation

@Observable
final class LoadingViewModel {
    var apiCharacters = [APICharacter]() //es un observable
    
    //filtro
    var filterUI : String = "" //es un observable
    
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
            print(characters)
            
            self.apiCharacters = characters
            
//            self.homeState = .ready
        } catch let error as GetCharactersUseCaseError {
//            self.homeState = .error(reason: error.reason)
        } catch {
//            self.homeState = .error(reason: "A home error has occurred")
        }
    }
}

