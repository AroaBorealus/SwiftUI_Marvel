//
//  APICharacter.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import Foundation

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

let MockAPICharacter = APICharacter(id: 1009550,
                                    name: "Bart Rozum",
                                    description: "",
                                    modified: "2024-10-21T15:32:30-0400",
                                    thumbnail: Thumbnail(
                                        path: "http://i.annihil.us/u/prod/marvel/i/mg/c/90/4ce154e96ec1e", thumbnailExtension: "jpg"),
                                    resourceURI: "http://gateway.marvel.com/v1/public/characters/1009550",
                                    comics: Comics(
                                        available: 2,
                                        collectionURI: "http://gateway.marvel.com/v1/public/characters/1009550/comics",
                                        items: [ComicsItem(
                                                    resourceURI: "http://gateway.marvel.com/v1/public/comics/84374",
                                                    name: "Damage Control (2022) #3"),
                                                ComicsItem(
                                                    resourceURI: "http://gateway.marvel.com/v1/public/comics/84376",
                                                    name: "Damage Control (2022) #5")],
                                        returned: 2),
                                    series: Comics(
                                        available: 2,
                                        collectionURI: "http://gateway.marvel.com/v1/public/characters/1009550/stories",
                                        items: [ComicsItem(
                                            resourceURI: "http://gateway.marvel.com/v1/public/stories/186545",
                                            name: "cover from Damage Control (2029) #3"),
                                        ], returned: 1),
                                    stories: Stories(
                                        available: 2,
                                        collectionURI: "http://gateway.marvel.com/v1/public/characters/1009550/stories",
                                        items: [StoriesItem(
                                                    resourceURI: "http://gateway.marvel.com/v1/public/stories/186545",
                                                    name: "cover from Damage Control (2029) #3",
                                                    type: "cover"),
                                                StoriesItem(
                                                    resourceURI: "http://gateway.marvel.com/v1/public/stories/186549",
                                                    name: "cover from Damage Control (2029) #5",
                                                    type: "cover")],
                                        returned: 2),
                                    events: Comics(
                                                available: 0,
                                                collectionURI: "http://gateway.marvel.com/v1/public/characters/1009550/events",
                                                items: [],
                                                returned: 0),
                                    urls: [URLElement(
                                                type: "detail",
                                                url: "http://marvel.com/characters/2765/bart_rozum?utm_campaign=apiRef&utm_source=ec42ff12023878ab39a533cb3fcb5f44"),
                                           URLElement(
                                            type: "comiclink",
                                            url: "http://marvel.com/comics/characters/1009550/bart_rozum?utm_campaign=apiRef&utm_source=ec42ff12023878ab39a533cb3fcb5f44")])
