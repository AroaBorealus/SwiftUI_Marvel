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
    var apiSeries = [APISeries]()
    
    
    @ObservationIgnored
    private var useCase: GetAllSeriesUseCaseContract //esto NO es un observable
    
    init(useCase: GetAllSeriesUseCaseContract = GetAllSeriesUseCase()) {
        self.useCase = useCase
        
        Task{
            await getSeries()
        }
    }
    
    @MainActor
    func getSeries() async {
        do {
            let data = try await useCase.execute()
            
            guard let series = data else {
                throw GetAllSeriesUseCaseError(reason: "Character array found empty")
            }
            
            self.apiSeries = series            
//            self.homeState = .ready
        } catch let error as GetAllSeriesUseCaseError {
            state = .error(error: error.reason)
        } catch {
            state = .error(error: "A home error has occurred")
        }
    }
}
