//
//  APISeries.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 20/12/24.
//

import Foundation

struct APIResponseSeries: Decodable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let data: SeriesDataContainer
    let etag: String?
}

struct SeriesDataContainer: Decodable {
    let offset, limit, total, count: Int
    let results: [APISeries]
}

struct APISeries: Identifiable, Decodable {
    let id: Int
    let title: String
    let description: String?
    let resourceURI: String
    let urls: [URLElement]
    let startYear: Int
    let endYear: Int
    let rating: String?
    let type: ResultType
    let modified: Date
    let thumbnail: Thumbnail
    let creators: Creators
    let characters: Characters
    let stories: Stories
    let comics: ComicList
    let events: EventList
    let next, previous: SeriesSummary?
}

struct Characters: Decodable {
    let available: Int
    let collectionURI: String
    let items: [CharacterSummary]
    let returned: Int
}

struct CharacterSummary: Decodable {
    let resourceURI: String?
    let name: String?
    let role: String?
}

struct Item: Decodable {
    let resourceURI: String
    let name: String
    let role: Role?
    let type: ItemType?
}

enum Role: String, Decodable {
    case colorist = "colorist"
    case coloristCover = "colorist (cover)"
    case editor = "editor"
    case inker = "inker"
    case coverInker = "inker (cover)"
    case letterer = "letterer"
    case penciler = "penciler"
    case coverPenciler = "penciler (cover)"
    case writer = "writer"
    case coverPainter = "painter (cover)"
}

enum ItemType: String, Decodable {
    case cover = "cover"
    case interiorStory = "interiorStory"
}

enum Issn: String, Decodable {
    case empty = ""
    case the02745267 = "0274-5267"
}

enum Format: String, Decodable {
    case hardcover = "Hardcover"
    case tradePaperback = "Trade Paperback"
}

struct TextObject: Decodable {
    let type: String?
    let language: String?
    let text: String?
}

enum ResultType: String, Decodable {
    case collection = "collection"
    case empty = ""
    case oneShot = "one shot"
    case ongoing = "ongoing"
}

struct Creators: Decodable {
    let available: Int
    let collectionURI: String
    let items: [CreatorSummary]
    let returned: Int
}

struct CreatorSummary: Decodable {
    let resourceURI: String
    let name: String
    let role: Role
}

struct ComicList: Decodable {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [ComicSummary]
}

struct ComicSummary: Decodable {
    let resourceURI: String?
    let name: String?
}

struct EventList: Decodable {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [EventSummary]
}

struct EventSummary: Decodable {
    let resourceURI: String?
    let name: String?
}

struct SeriesSummary: Decodable {
    let resourceURI: String?
    let name: String?
}
