//
//  LoadingView.swift
//  Entries-AMCEF
//
//  Created by Dávid Baľak on 19/02/2023.
//

import SwiftUI

struct LoadingView: View {

    let entries = EntryModel.mock

    var body: some View {
        List {
            ForEach(entries, id: \.api) { entry in
                EntryCell(model: entry)
            }
        }
        .scrollContentBackground(.hidden)
        .modifier(RedactedModifier())
    }
}

//MARK: Preview

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
