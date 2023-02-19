//
//  ViewStates.swift
//  Entries-AMCEF
//
//  Created by Dávid Baľak on 18/02/2023.
//

import Foundation

enum ViewSate: Equatable {

    case idle
    case loading
    case failed(CustomError)
    case success([EntryModel])

}
