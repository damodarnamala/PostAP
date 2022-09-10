//
//  FetchState.swift
//  PostApp
//
//  Created by Damodar Namala on 10/09/22.
//
import Combine

import Foundation
/// State  for API data fething
public enum FetchState: Equatable {
    /// UNCHANGED:  Use it for inital state to declare`FetchState`
    case unchaged
    /// LOADING:    Update when api's data fetching started
    case loading
    /// FINISHED: Update once api's data fetching completed.
    case finished
    /// ERROR:  Update with error when api's returns error
    ///- parameters:
    /// - error:if there is any from api's response
    case error(_ error: String)
}

/**
 Handle the state from publisher
 - parameter compltion: takes the publisher completion block with error
 - parameter state: it's and inout property to update after returnsing the completion
 */
public func handle(compltion: Subscribers.Completion<HttpError>, state: inout FetchState) {
    switch compltion {
        case .failure(let error):
            print("ERROR: API Response")
            state = .finished
            ErrorScreen.present(with: error.value)
        case .finished:
            state = .finished
    }
}

