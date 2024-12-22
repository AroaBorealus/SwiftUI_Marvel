//
//  HomeViewModel.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import Foundation

protocol HomeViewModelContract {
    var state: Status { get set }
    var characters: [MarvelCharacter] { get set }
    
    func getCharacters()
}


@Observable
final class HomeViewModel: HomeViewModelContract {
    var state: Status = .loading
    var characters = [MarvelCharacter]()
    
    init() {
        getCharacters()
    }
    
    
    func getCharacters() {
        self.characters = FakeDB.shared.getCharacters()
    }
}


final class HomeViewModelMock: HomeViewModelContract {
    var state: Status = .loading
    var characters = [MarvelCharacter]()
    
    init() {
        getCharacters()
    }
    
    func getCharacters() {
        self.characters = [mockMarvelCharacter, mockMarvelCharacter, mockMarvelCharacter, mockMarvelCharacter]
    }
}
