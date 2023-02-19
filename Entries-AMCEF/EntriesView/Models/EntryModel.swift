//
//  EntryModel.swift
//  Entries-AMCEF
//
//  Created by Dávid Baľak on 19/02/2023.
//

import Foundation

struct EntryModel: Equatable, Hashable {

    let api: String
    let category: String
    let description: String
    let link: String
    let isHTTPS: Bool
    let isApiKeyUsed: Bool

}

//MARK: - Mock
extension EntryModel {
    static var mock: [EntryModel] = [
            .init(api: "Api Mocked Data Name", category: " Category", description: "r since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specime", link: "www.google.com", isHTTPS: true, isApiKeyUsed: true),
            .init(api: "Api Mocked Data Name", category: " Category", description: "r since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specime", link: "www.google.com", isHTTPS: true, isApiKeyUsed: true),
            .init(api: "Api Mocked Data Name", category: " Category", description: "r since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specime", link: "www.google.com", isHTTPS: true, isApiKeyUsed: true),
            .init(api: "Api Mocked Data Name", category: " Category", description: "r since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specime", link: "www.google.com", isHTTPS: true, isApiKeyUsed: true),
            .init(api: "Api Mocked Data Name", category: " Category", description: "r since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specime", link: "www.google.com", isHTTPS: true, isApiKeyUsed: true),
            .init(api: "Api Mocked Data Name", category: " Category", description: "r since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specime", link: "www.google.com", isHTTPS: true, isApiKeyUsed: true),
            .init(api: "Api Mocked Data Name", category: " Category", description: "r since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specime", link: "www.google.com", isHTTPS: true, isApiKeyUsed: true),
        ]
}
