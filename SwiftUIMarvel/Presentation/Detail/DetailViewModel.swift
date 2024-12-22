//
//  DetailViewModel.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 21/12/24.
//

import Foundation

@Observable
final class DetailViewModel {
    var state: Status = .loading
    var marvelSeries = [MarvelSerie]()
    let characterID : String
    
    @ObservationIgnored
    private var useCase: GetCharacterSeriesUseCaseContract
    
    init(characterID: String = "", useCase: GetCharacterSeriesUseCaseContract = GetCharacterSeriesUseCase()) {
        self.useCase = useCase
        self.characterID = characterID
    }
    
    public func loadCharacter()
    {
        Task{
            await GetCharacterSeries(characterID: characterID)
        }
    }
    
    @MainActor
    func GetCharacterSeries(characterID: String) async {
        do {
            let data = try await useCase.execute(charID: characterID)
            
            guard let series = data else {
                throw GetCharacterSeriesUseCaseError(reason: "Character array found empty")
            }
            
            self.marvelSeries = series            
//            self.homeState = .ready
        } catch let error as GetCharacterSeriesUseCaseError {
            state = .error(error: error.reason)
        } catch {
            state = .error(error: "A home error has occurred")
        }
    }
}
