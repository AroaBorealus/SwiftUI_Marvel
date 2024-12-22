//
//  LoadingViewModel.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 22/12/24.
//

import Foundation

@Observable
final class LoadingViewModel{
    
    var didFinishLoad = false
    
    @ObservationIgnored
    let charactersUseCase: GetCharactersUseCaseContract
    
    init(charactersUseCase: GetCharactersUseCaseContract = GetCharactersUseCase()){
        
        self.charactersUseCase = charactersUseCase
        
        Task{
            try await charactersUseCase.execute()
            didFinishLoad = true
        }
    }
}
