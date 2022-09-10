//
//  HttpError.swift
//  PostApp
//
//  Created by Damodar Namala on 10/09/22.
//

import Foundation
/// Http Errors
public enum HttpError: Error {
    /// INVALID response
    case invalidServerResponse
    /// DATA mismatch with the response
    case dataMisMatch
}
