//
//  GetComicsAPIRequest.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 20/12/24.
//

import Foundation

struct GetCharacterSeriesAPIRequest: APIRequest {
    typealias Response = APIResponseSeries
        
    let method: HTTPMethod = .GET
    var path: String
    
    init(charID: String) {
        self.path = "/v1/public/characters/\(charID)/series"
    }
}
