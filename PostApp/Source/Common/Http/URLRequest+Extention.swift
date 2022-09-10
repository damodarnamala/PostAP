//
//  URLRequest+Extention.swift
//  Created by Damodar Namala on 09/09/22.
//

import Foundation

public typealias OptionStringDictionary = [String: String]

extension URLRequest {
    /// To componse Url request
    /// - parameters:
    ///   - url: string to call API
    ///   - method: string for`HTTPMethod`
    ///   - headers: ductionary  `HTTPMethod`
    ///   - body: http body send along with API request

    static func create(url: String,
                       method: HTTPMethod? = .get,
                       headers: OptionStringDictionary? = nil,
                       body: Data? = nil) -> URLRequest {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = method?.rawValue
        request.allHTTPHeaderFields = headers
//        request.allowsCellularAccess = true
//        request.cachePolicy = .returnCacheDataElseLoad
//        request.timeoutInterval = 30
//        request.httpShouldHandleCookies = false
        return request
    }
}
