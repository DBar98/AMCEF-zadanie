//
//  EntryCell.swift
//  Entries-AMCEF
//
//  Created by Dávid Baľak on 18/02/2023.
//

import SwiftUI

struct EntryCell: View {

    let model: EntryModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(model.api)
                            .font(.body)
                            .bold()

                        if model.isHTTPS {
                            Text("HTTPS")
                                .font(.caption2)
                                .foregroundColor(.green)
                        }
                    }

                    Text(model.category)
                        .font(.footnote)

                    Text(model.description)
                        .font(.caption2)
                        .italic()
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal, 16)
                .frame(height: 80)

                if model.isApiKeyUsed {
                    Spacer()
                    
                    Image(systemName: Symbols.lock.name)
                        .resizable()
                        .frame(width: 20, height: 25)
                        .padding(.horizontal, 16)
                }
            }
            
            Divider()
                .frame(height: 2)
                .foregroundColor(.black)
        }
    }

}

//MARK: Preview

struct EntryCell_Previews: PreviewProvider {

    static var previews: some View {
        EntryCell(
            model: .init(
                api: "Api name",
                category: "Category name",
                description: "Some description oiwhuwuehfi uwh ef iuw nhefuiwhei fuh wb eiufh wbuyeg fuwgefbugjhwegf ewhjfgwhegfbcjsdcjhwbghwehjfgbwjhegfjwhgbejfhgwbehjfgwjegfbjhw",
                link: "https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-list-of-dynamic-items",
                isHTTPS: true,
                isApiKeyUsed: true
            )
        )
    }

}
