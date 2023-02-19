//
//  RedactedModifier.swift
//  Entries-AMCEF
//
//  Created by Dávid Baľak on 18/02/2023.
//

import SwiftUI

struct RedactedModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
        .foregroundStyle(.linearGradient(
            colors: [.black, .gray],
            startPoint: .leading,
            endPoint: .trailing)
        )
        .disabled(true)
        .redacted(reason: .placeholder)
        .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: true)
    }

}
