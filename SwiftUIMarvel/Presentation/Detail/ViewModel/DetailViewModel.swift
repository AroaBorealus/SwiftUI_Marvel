//
//  DetailViewModel.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 21/12/24.
//

import Foundation

enum DetailStatus {
    case loading, ready, noData, error(error: String)
}


@Observable
final class DetailViewModel {
    var detailStatus: DetailStatus = .loading
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
            
            if(series.isEmpty){
                detailStatus = .noData
                return
            }
            
            marvelSeries = series
            detailStatus = .ready
            
        } catch let error as GetCharacterSeriesUseCaseError {
            detailStatus = .error(error: error.reason)
        } catch {
            detailStatus = .error(error: "A home error has occurred")
        }
    }
}
