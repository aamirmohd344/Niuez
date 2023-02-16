//
//  PostManager.swift
//  Niuez 2.0
//
//  Created by Mohd Aamir on 16/02/23.
//

import Foundation

struct PostManager: Decodable {
    var hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    var objectID: String
    var points: Int
    var url: String?
    var title: String
}
