//
//  NetworkManager.swift
//  Niuez 2.0
//
//  Created by Mohd Aamir on 16/02/23.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchDataFromAPI() {
        
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data , response , error in
                if let err = error {
                    print("There was an error while retrieving the data from the API source", err)
                } else {
                    if let safeData = data {
                        let decoder = JSONDecoder()
                        do {
                            let result = try decoder.decode(PostManager.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = result.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
    
    
}
