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
    var characters = [MarvelCharacter]()
    
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
        self.characters = FakeDB.shared.getCharacters()
    }
}
