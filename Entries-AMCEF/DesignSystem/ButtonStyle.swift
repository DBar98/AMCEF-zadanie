//
//  ButtonStyle.swift
//  Entries-AMCEF
//
//  Created by Dávid Baľak on 18/02/2023.
//

import SwiftUI

struct AmcefPrimaryButton: ButtonStyle {

    @State private var isPressed = false

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(Color.black)
            .clipShape(Capsule())
            .padding(.horizontal, 20)
            .cornerRadius(15.0)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
