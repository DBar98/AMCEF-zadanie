//
//  ErrorView.swift
//  Entries-AMCEF
//
//  Created by Dávid Baľak on 18/02/2023.
//

import SwiftUI

struct ErrorView: View {

    let errorMessage: String
    let onTryAgainAction: () -> ()
    

    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Image(systemName: Symbols.triangle.name)
                .resizable()
                .frame(width: 110, height: 100)

            Text(errorMessage)
                .font(.body)
                .padding(20)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .safeAreaInset(edge: .bottom) {
            Button(action: {
                onTryAgainAction()
            }, label: {
                Text(AppStrings.tryAgain)
                    .font(.body)
                    .foregroundColor(.white)
            })
            .buttonStyle(AmcefPrimaryButton())
        }
        
    }
    
}

//MARK: Preview

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(
            errorMessage: AppStrings.somethingWentWrong) { }
    }
}
