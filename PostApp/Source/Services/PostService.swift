//
//  PostsAPI.swift
//  PostApp
//
//  Created by Damodar Namala on 09/09/22.
//

import Foundation
import Combine

struct PostService: HttpEndPoint {
    enum EndPointPath {
        case post
    }
    var headers: [String: String]?
    var baseUrl: String {
        return "https://jsonplaceholder.typicode.com/"
    }
    
    typealias Path = EndPointPath
}

extension PostService {
    func request(_ endPoint: EndPointPath) -> URLRequest {
        var path: String = ""
        switch endPoint {
            case .post:
                path = "posts"
                // self.headers = ["abc": "bcd"]
        }
        let url = baseUrl + path
        return URLRequest.create(url: url, method:.get)
    }
}
