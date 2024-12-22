//
//  UseCasesCommonMocks.swift
//  SwiftUIMarvelTesting
//
//  Created by Aroa Miguel Garcia on 22/12/24.
//

@testable import SwiftUIMarvel
import XCTest

struct APISessionMockError: Error {
    let reason: String
}

final class APISessionMock: APISessionContract {
    let mockResponse: ((any APIRequest) -> Result<Data, APISessionMockError>)
    
    init(mockResponse: @escaping (any APIRequest) -> Result<Data, APISessionMockError>) {
        self.mockResponse = mockResponse
    }
    
    func request<Request: APIRequest>(apiRequest: Request) async throws -> Data {
        let result = mockResponse(apiRequest)
        switch result {
        case .success(let data):
            return data
        case .failure(let error):
            throw error
        }
    }
}
