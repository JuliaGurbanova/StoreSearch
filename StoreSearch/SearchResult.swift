//
//  SearchResult.swift
//  StoreSearch
//
//  Created by Julia Gurbanova on 01.02.2024.
//

import Foundation

class ResultArray: Codable {
    var resultCount = 0
    var results = [SearchResult]()
}

class SearchResult: Codable, CustomStringConvertible {
    enum CodingKeys: String, CodingKey {
        case imageSmall = "artworkUrl60"
        case imageLarge = "artworkUrl100"
        case itemGenre = "primaryGenreName"
        case bookGenre = "genres"
        case itemPrice = "price"
        case kind, artistName, currency
        case trackName, trackPrice, trackViewUrl
        case collectionName, collectionViewUrl, collectionPrice
    }
    var artistName: String? = ""
    var trackName: String? = ""
    var kind: String? = ""
    var trackPrice: Double? = 0.0
    var currency = ""
    var imageSmall = ""
    var imageLarge = ""
    var trackViewUrl: String?
    var collectionName: String?
    var collectionViewUrl: String?
    var collectionPrice: Double?
    var itemPrice: Double?
    var itemGenre: String?
    var bookGenre: [String]?

    var name: String {
        return trackName ?? collectionName ?? ""
    }

    var description: String {
        return "\nResult - Kind: \(kind ?? "None"), Name: \(name), Artist Name: \(artistName ?? "None")"
    }

    var storeURL: String {
        return trackViewUrl ?? collectionViewUrl ?? ""
    }

    var price: Double {
        return trackPrice ?? collectionPrice ?? itemPrice ?? 0.0
    }

    var genre: String {
        if let genre = itemGenre {
            return genre
        } else if let genres = bookGenre {
            return genres.joined(separator: ", ")
        }
        return ""
    }

    var type: String {
        let kind = self.kind ?? String(localized: "audiobook")

        switch kind {
        case "album": return String(localized: "Album")
        case "audiobook": return String(localized: "Audiobook")
        case "book": return String(localized: "Book")
        case "ebook": return String(localized: "E-Book")
        case "feature-movie": return String(localized: "Movie")
        case "music-video": return String(localized: "Music Video")
        case "podcast": return String(localized: "Podcast")
        case "software": return String(localized: "App")
        case "song": return String(localized: "Song")
        case "tv-episode": return String(localized: "TV Episode")
        default: break
        }

        return String(localized: "Unknown")
    }

    var artist: String {
        return artistName ?? ""
    }
}
