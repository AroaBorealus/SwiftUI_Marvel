//
//  GetAllCharactersUseCaseTests.swift
//  SwiftUIMarvelTesting
//
//  Created by Aroa Miguel Garcia on 22/12/24.
//

@testable import SwiftUIMarvel
import XCTest

final class GetCharacterSeriesUseCaseTests: XCTestCase {
    func test_getCharacterSeries_success() async {
        let sut = GetCharacterSeriesUseCase()
        let expectation = self.expectation(description: "TestSuccess")
        
        var encodedData: Data = Data()
        
        if let url = Bundle.main.url(forResource: "series", withExtension: "json") {
                do {
                    encodedData = try Data(contentsOf: url)
                } catch {
                    XCTFail()
                }
        }
        else{
            XCTFail()
        }
        
        let expectedSeriesCount = 3
        
        var returnedSeriess: [MarvelSerie] = []
        do {

            APISession.shared = APISessionMock{ _ in .success(encodedData) }

            returnedSeriess = try await sut.execute(charID: "1234")!

            expectation.fulfill()
        } catch {
            XCTFail("El test falló debido a un error inesperado: \(error)")
        }
        
        
        await fulfillment(of: [expectation],timeout: 10)
        
        XCTAssertEqual(expectedSeriesCount, returnedSeriess.count)
    }
    
//    func test_getAllCharacters_failure() async {
//        let sut = GetAllCharactersUseCase()
//        
//        let expectation = self.expectation(description: "TestFailure")
//        var returnedCharacters: [DBCharacter] = []
//        do {
//            let error: APISessionMockError = .init(reason: "mockError")
//            APISession.shared = APISessionMock{ _ in .failure(error) }
//
//            returnedCharacters = try await sut.execute()!
//
//            XCTFail("El test falló debido a un error inesperado: \(error)")
//        } catch {
//            expectation.fulfill()
//        }
//        
//        
//        await fulfillment(of: [expectation],timeout: 10)
//        
//        XCTAssertEqual(returnedCharacters.count, 0)
//    }
}

