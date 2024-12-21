//
//  GetComicsAPIRequest.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 20/12/24.
//

import Foundation

struct GetSeriesAPIRequest: APIRequest {
    typealias Response = APIResponseSeries
    
    let method: HTTPMethod = .GET
    let path: String = "/v1/public/series"
    
    //Para comics de 1 personaje en concreto:
    //v1/public/series?characters=1009550&apikey=c759f8d1937a41560841ee92f4b16dc8&ts=1&hash=2fa0dff6e73d64591c36c0dcb6765d25&orderBy=-modified
}
