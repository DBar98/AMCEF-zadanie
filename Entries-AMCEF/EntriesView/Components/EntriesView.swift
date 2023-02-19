//
//  ContentView.swift
//  Entries-AMCEF
//
//  Created by Dávid Baľak on 18/02/2023.
//

import SwiftUI

struct EntriesView: View {

    enum Action {

        case onRefresh
        case onOfflineCell

    }

    let entries: [EntryModel]
    let isShowwingOfflineData: Bool
    let onAction: (Action) -> Void

    @State private var searchText = ""
    @State private var showWebView = false
    @State private var selectedURL: String = ""

    var searchResults: [EntryModel] {
        if searchText.isEmpty {
            return entries
        } else {
            return entries.filter {
                $0.api.lowercased().contains(searchText.lowercased()) || $0.description.lowercased().contains(searchText.lowercased())
            }
        }
    }

    var body: some View {
        if !entries.isEmpty {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(searchResults, id: \.self) { entry in
                        ContnetCell(isShowingOfflineData: isShowwingOfflineData, entry: entry)
                            .padding([.bottom, .horizontal],16)
                    }
                }
            }
            .scrollDismissesKeyboard(.immediately)
            .listStyle(.grouped)
            .searchable(text: $searchText)
            .refreshable {
                onAction(.onRefresh)
            }
            .scrollContentBackground(.hidden)
            .sheet(isPresented: $showWebView) {
                NavigationView {
                    WebView(url: selectedURL)
                        .navigationBarItems(trailing: HStack {
                            Button(action: {showWebView = false}) {
                                Image(systemName: Symbols.xmark.name)
                                    .resizable()
                                    .tint(.black)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 32, height: 32)
                            }
                        })
                }
            }
        }
        else {
            EmptyView {
                onAction(.onRefresh)
            }
        }
    }
}

//MARK: - Components
extension EntriesView {

    func ContnetCell(isShowingOfflineData: Bool, entry: EntryModel) -> some View {
        Group {
            if isShowingOfflineData {
                OfflineCell(entry: entry)
            } else {
                BasicCell(entry: entry)
            }
        }
    }

    func OfflineCell(entry: EntryModel) -> some View {
        return EntryCell(model: entry)
            .tint(.black)
            .onTapGesture {
                onAction(.onOfflineCell)
            }
    }

    func BasicCell(entry: EntryModel) -> some View {

        EntryCell(model: entry)
            .onTapGesture {
                selectedURL = entry.link
                showWebView = true
            }
    }

}

struct EntriesView_Previews: PreviewProvider {
    static var previews: some View {
        EntriesView(entries: EntryModel.mock, isShowwingOfflineData: true) {_ in }
    }
}
