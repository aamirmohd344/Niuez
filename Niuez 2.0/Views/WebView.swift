//
//  WebView.swift
//  Niuez 2.0
//
//  Created by Mohd Aamir on 16/02/23.
//

import SwiftUI
import WebKit

struct WebView: View {
    
    var url: String?
    
    var body: some View {
        ViewAllContent(urlString: url)
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: "https:www.github.com/aamirmohd344")
    }
}

struct ViewAllContent: UIViewRepresentable {
    
    typealias UIViewType = WKWebView
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeURL = urlString {
            if let url = URL(string: safeURL) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
}
