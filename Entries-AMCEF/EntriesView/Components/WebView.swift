//
//  WebView.swift
//  Entries-AMCEF
//
//  Created by Dávid Baľak on 18/02/2023.
//

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    let url: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: self.url) else {
            return
        }
        uiView.load(URLRequest(url: url))
    }
}

