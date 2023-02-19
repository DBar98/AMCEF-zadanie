//
//  Entries_AMCEFApp.swift
//  Entries-AMCEF
//
//  Created by Dávid Baľak on 18/02/2023.
//

import SwiftUI

@main
struct Entries_AMCEFApp: App {

    @StateObject private var persistenceContainer = PersistenceController.shared

    var body: some Scene {
        WindowGroup {

            let viewContext = PersistenceController.shared.container.viewContext

            ///Context is available to all child views
           EntriesContainerView(
            viewModel: EntriesViewModel(
                networking: NetworkingService(),
                context: viewContext
            )
           )
           .environment(\.managedObjectContext, viewContext)
        }
    }
}
