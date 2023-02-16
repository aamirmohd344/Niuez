//
//  ContentView.swift
//  Niuez 2.0
//
//  Created by Mohd Aamir on 16/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: WebView(url: post.url)) {
                    HStack {
                        Text("\(post.points)")
                        Text(post.title)
                            .font(.callout)
                    }
                }
            }
            .navigationTitle("Niuez 2.0")
        }
        .onAppear {
            self.networkManager.fetchDataFromAPI()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
