//
//  EntriesResponse.swift
//  Entries-AMCEF
//
//  Created by Dávid Baľak on 18/02/2023.
//

import Foundation

// MARK: - Entry

struct EntriesResponse: Codable, Equatable {

    let count: Int
    let entries: [EntryElement]

}

// MARK: - EntryElement

extension EntriesResponse {

    struct EntryElement: Codable, Equatable, Hashable {

        let api, description: String
        let auth: Auth
        let https: Bool
        let cors: Cors
        let link: String
        let category: String

        enum CodingKeys: String, CodingKey {

            case api = "API"
            case description = "Description"
            case auth = "Auth"
            case https = "HTTPS"
            case cors = "Cors"
            case link = "Link"
            case category = "Category"

        }
    }

    enum Auth: String, Codable, Equatable {

        case apiKey = "apiKey"
        case empty = ""
        case oAuth = "OAuth"
        case userAgent = "User-Agent"
        case xMashapeKey = "X-Mashape-Key"

    }

    enum Cors: String, Codable, Equatable {

        case no = "no"
        case unknown = "unknown"
        case unkown = "unkown"
        case yes = "yes"

    }

}
