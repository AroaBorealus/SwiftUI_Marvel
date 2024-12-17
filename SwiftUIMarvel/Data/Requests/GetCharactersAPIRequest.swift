//
//  GetCharactersAPIRequest.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import Foundation

struct GetCharactersAPIRequest: APIRequest {
    typealias Response = APIResponse
    
    let method: HTTPMethod = .GET
    let path: String = "/v1/public/characters"
}
