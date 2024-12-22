//
//  APICharacter.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import Foundation

struct APIResponseCharacter: Decodable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: APIDataCharacter
}

struct APIDataCharacter: Decodable {
    let offset, limit, total, count: Int
    let results: [APICharacter]
}

struct APICharacter: Identifiable, Decodable {
    let id: Int
    let name: String
    let description: String? // Puede estar vacío
    let modified: String
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics, series: Comics
    let stories: Stories
    let events: Comics
    let urls: [URLElement]
}

struct Comics: Decodable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}

struct ComicsItem: Decodable {
    let resourceURI: String
    let name: String
}

struct Stories: Decodable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItem]
    let returned: Int
}

struct StoriesItem: Decodable {
    let resourceURI: String
    let name: String
    let type: String
}

struct Thumbnail: Decodable {
    let path: String
    let thumbnailExtension: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

struct URLElement: Decodable {
    let type: String
    let url: String
}
