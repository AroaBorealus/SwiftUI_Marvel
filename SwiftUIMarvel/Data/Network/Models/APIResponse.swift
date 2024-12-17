//
//  APIResponse.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import Foundation

struct APIResponse: Decodable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: APIData
}

struct APIData: Decodable {
    let offset, limit, total, count: Int
    let results: [APICharacter]
}
