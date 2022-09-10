//
//  PostModel.swift
//  PostApp
//
//  Created by Damodar Namala on 09/09/22.
//

import Foundation

struct Post: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
