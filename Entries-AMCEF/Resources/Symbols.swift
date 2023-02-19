//
//  Symbols.swift
//  Entries-AMCEF
//
//  Created by Dávid Baľak on 19/02/2023.
//

import Foundation

enum Symbols {

    case magnifyingGlass
    case triangle
    case lock
    case xmark

    var name: String {
        switch self {
        case .magnifyingGlass:
            return "magnifyingglass"

        case .triangle:
            return "exclamationmark.triangle"

        case .lock:
            return "lock.shield.fill"
            
        case .xmark:
            return "xmark.circle"
        }
    }

}
