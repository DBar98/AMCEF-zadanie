//
//  EntriesViewModel.swift
//  Entries-AMCEF
//
//  Created by Dávid Baľak on 18/02/2023.
//

import CoreData
import Combine
import SwiftUI
import OSLog

class EntriesViewModel: ObservableObject {

    //MARK: - State
    
    @Published private(set) var state: ViewSate = .idle

    //MARK: - Private properties

    private var subscriptions: Set<AnyCancellable> = []
    private let networking: NetworkingService
    private (set) var context: NSManagedObjectContext

    // MARK: - Init

    init(networking: NetworkingService, context: NSManagedObjectContext) {
        self.networking = networking
        self.context = context
    }

}

// MARK: - Networking Actions

extension EntriesViewModel {
    
    func fetchEntries(refreshing: Bool) {
        if !refreshing {
            self.state = .loading
        }

        networking.getEntries()
            .sink {[weak self] completion in
                guard let self = self else { return }

                switch completion {
                case let .failure(error):
                    if let code = error.responseCode {
                        self.state = .failed(.serverError(code))
                    }
                    if error.isSessionTaskError {
                        self.state = .failed(.noInternetConnection)
                    }
                    if error.isResponseSerializationError {
                        self.state = .failed(.decodingError)
                    }

                case .finished:
                    break
                }
            } receiveValue: {[weak self] value in
                guard let self = self else { return }

                if value.entries.count > 40 {
                    let firstEntries = Array(value.entries.prefix(40))
                    self.state = .success(self.mapResponseToModel(from: firstEntries))

                    do {
                        try self.updateEntries(models: firstEntries)
                    } catch {
                        NSLog("Error: \(error.localizedDescription)")
                    }
                }
            }
            .store(in: &subscriptions)
    }

}

//MARK: - Handle Response

extension EntriesViewModel {

    func mapResponseToModel(from values: [EntriesResponse.EntryElement]) -> [EntryModel] {
        let models = values.map {
            EntryModel(
                api: $0.api,
                category: $0.category,
                description: $0.description,
                link: $0.link,
                isHTTPS: $0.https,
                isApiKeyUsed: $0.auth == .apiKey
            )
        }

        return models
    }

}

//MARK: - Database operations

extension EntriesViewModel {

    func updateEntries(models: [EntriesResponse.EntryElement]) throws {
        do {
            try deleteEntries()
        } catch {
            NSLog("Error: \(error.localizedDescription)")
        }

        try models.forEach { model in
            let entryEntity = EntryEntity(context: self.context)
            entryEntity.api = model.api
            entryEntity.entryDesc = model.description
            entryEntity.link = model.link
            entryEntity.category = model.category
            entryEntity.isApiKeyUsed = (model.auth == .apiKey)
            entryEntity.isHTTPS = model.https

            do {
                try self.context.save()
            } catch {
                throw CustomError.databaseSaveFailed
            }
        }
    }

    func deleteEntries() throws{
        do {
            let items: [NSManagedObject] = try context.fetch(NSFetchRequest(entityName: "EntryEntity"))
            items.forEach { object in
                context.delete(object)
            }
        } catch {
            throw CustomError.databaseGetFailed
        }
    }

}
