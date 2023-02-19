//
//  EmptyView.swift
//  Entries-AMCEF
//
//  Created by Dávid Baľak on 19/02/2023.
//

import SwiftUI

struct EmptyView: View {

    let onRefresh: () -> Void

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Image(systemName: Symbols.magnifyingGlass.name)
                .resizable()
                .frame(width: 80, height: 80)

            Text(AppStrings.noDataFound)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .safeAreaInset(edge: .bottom) {
            Button(action: {
                onRefresh()
            }, label: {
                Text(AppStrings.refresh)
                    .font(.body)
                    .foregroundColor(.white)
            })
            .buttonStyle(AmcefPrimaryButton())
        }
    }
}

//MARK: Preview

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView() {}
    }
}
