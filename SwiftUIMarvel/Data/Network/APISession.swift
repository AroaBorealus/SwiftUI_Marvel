//
//  APISession.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import Foundation

protocol APISessionContract {
    func request<Request: APIRequest>(apiRequest: Request) async throws -> Data
}

struct APISession: APISessionContract {
    static var shared: APISessionContract = APISession()
    
    private let session = URLSession(configuration: .default)
    private let requestInterceptors: [APIRequestInterceptorContract]
    
    init(requestInterceptors: [APIRequestInterceptorContract] = [APIRequestAuthenticatorInterceptor()]) {
        self.requestInterceptors = requestInterceptors
    }
    
    func request<Request: APIRequest>(apiRequest: Request) async throws -> Data {
        do {
            var request = try apiRequest.getRequest()
            requestInterceptors.forEach { $0.intercept(request: &request) }
            print(request.url!)

            let (data, response) = try await session.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw APIErrorResponse.network(apiRequest.path)
            }
            
            return data
        } catch {
            throw error
        }
    }
}

