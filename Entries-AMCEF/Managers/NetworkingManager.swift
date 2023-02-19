//
//  NetworkingManager.swift
//  Entries-AMCEF
//
//  Created by Dávid Baľak on 18/02/2023.
//

import Foundation
import Combine
import Alamofire


protocol NetworkingProtocol {
    func getEntries() -> AnyPublisher<EntriesResponse, AFError>
}

class NetworkingService: NetworkingProtocol {
    func getEntries() -> AnyPublisher<EntriesResponse, AFError> {
        guard let url = URL(string: "https://api.publicapis.org/entries") else { return Empty().eraseToAnyPublisher()}

        return AF.request(url, method: .get)
            .validate()
            .publishDecodable(type: EntriesResponse.self)
            .value()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

