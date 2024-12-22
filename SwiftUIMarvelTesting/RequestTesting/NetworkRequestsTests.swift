//
//  NetworkRequestsTests.swift
//  KCReactiveDragonBallTests
//
//  Created by Aroa Miguel Garcia on 22/12/24.
//

@testable import SwiftUIMarvel
import XCTest
import Combine

final class NetworkRequestsTests: XCTestCase {
    func test_GetCharactersRequest() {
        
        let characterRequest = GetCharactersAPIRequest()
        XCTAssertNotNil(characterRequest)
        
        var constructedRequest: URLRequest
        
        do{
            try constructedRequest = characterRequest.getRequest()
            print("GetRequest: \(constructedRequest)")
        }catch{
            XCTFail("Request not constructed properly")
        }
    }
    
    func test_GetCharacterSeriesRequest() {
        
        let characterSeriesRequest = GetCharacterSeriesAPIRequest(charID: "1011136")
        XCTAssertNotNil(characterSeriesRequest)
        
        var constructedRequest: URLRequest
        
        do{
            try constructedRequest = characterSeriesRequest.getRequest()
            print("GetRequest: \(constructedRequest)")
        }catch{
            XCTFail("Request not constructed properly")
        }
    }
    
//    func test_GetTransformationsRequest() {
//        let transformationsRequest = GetTransformationsAPIRequest(characterId: "1234")
//        XCTAssertNotNil(transformationsRequest)
//        
//        var constructedRequest: URLRequest
//        
//        do{
//            try constructedRequest = transformationsRequest.getRequest()
//            print("GetRequest: \(constructedRequest)")
//        }catch{
//            XCTFail("Request not constructed properly")
//        }
//    }
}
