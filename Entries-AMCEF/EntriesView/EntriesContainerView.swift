//
//  EntriesContainerView.swift
//  Entries-AMCEF
//
//  Created by Dávid Baľak on 18/02/2023.
//

import SwiftUI

struct EntriesContainerView: View {

    //MARK: - Properties

    @ObservedObject var viewModel: EntriesViewModel
    @State private var warningAlert: Bool = false

    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: EntryEntity.entity(), sortDescriptors: [])
    private var databaseEntries: FetchedResults<EntryEntity>

    //MARK: - Body

    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.state {
                case .loading, .idle:
                    LoadingView()

                case let .success(entries):
                    EntriesView(entries: entries, isShowwingOfflineData: false, onAction: handleAction(_:))

                case let .failed(customError):
                    switch customError {
                    case .noInternetConnection:
                        if !databaseEntries.isEmpty {
                            EntriesView(entries: getDatabaseData(from: databaseEntries), isShowwingOfflineData: true, onAction: handleAction(_:))
                        } else {
                            ErrorView(errorMessage: customError.localizedDescription) {
                                viewModel.fetchEntries(refreshing: false)
                            }
                        }

                    default:
                        ErrorView(errorMessage: customError.localizedDescription) {
                            viewModel.fetchEntries(refreshing: false)
                        }
                    }
                }
            }
            .navigationTitle(AppStrings.entries)
            .navigationBarTitleDisplayMode(.large)
        }
        .onAppear {
            viewModel.fetchEntries(refreshing: false)
        }
        .animation(.default, value: viewModel.state)
        .alert(AppStrings.unableToOpen, isPresented: $warningAlert) {
            Button(AppStrings.ok, action: {
                warningAlert.toggle()
            })
        }
    }

}

//MARK: - Offline data handling
extension EntriesContainerView {

    func getDatabaseData(from databaseEntries: FetchedResults<EntryEntity>) -> [EntryModel] {
        databaseEntries.map {
            EntryModel(
                api: $0.api ?? "",
                category: $0.category ?? "",
                description: $0.entryDesc ?? "",
                link: $0.link ?? "",
                isHTTPS: $0.isHTTPS,
                isApiKeyUsed: $0.isApiKeyUsed
            )
        }
    }

}

//MARK: - Action handling
extension EntriesContainerView {

    func handleAction(_ action: EntriesView.Action) {
        switch action {
        case .onRefresh:
            viewModel.fetchEntries(refreshing: true)

        case .onOfflineCell:
            warningAlert.toggle()
        }
    }

}
