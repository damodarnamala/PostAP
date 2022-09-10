//
//  NetworkProtocol.swift
//  Created by Damodar Namala on 09/09/22.
//

import Foundation
import Combine
import SwiftUI


public protocol HttpEndPoint {
    associatedtype Path
    var baseUrl: String { get }
    var headers: [String: String]? {get set}
}

/**
 Sends API request
 - parameter request: Url request to get the data from API
 - returns publisher
 */
public func sendRequest<T: Decodable>(request: URLRequest) -> AnyPublisher<T, HttpError> {
    return URLSession.shared.dataTaskPublisher(for: request)
        .subscribe(on: DispatchQueue.main)
        .tryMap { output in
            guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                print("ERROR: Check status code, \(request.url?.absoluteString ?? "")")
                throw HttpError.invalidServerResponse
            }
            return output.data
        }
        .decode(type: T.self, decoder: JSONDecoder())
        .mapError({ error -> HttpError in
            print("ERROR: Check response body matched or not, \(request.url?.absoluteString ?? "")")
            return HttpError.dataMisMatchOrUnableToParseError
        })
        .eraseToAnyPublisher()
}
