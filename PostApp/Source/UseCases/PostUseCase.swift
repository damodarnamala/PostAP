//
//  PostUseCase.swift
//  PostApp
//
//  Created by Damodar Namala on 09/09/22.
//

import Foundation
import Combine

protocol PostUseCase {
    func fetchPosts() -> AnyPublisher<[Post], HttpError>
}
struct PostFetchUseCase: PostUseCase {
    func fetchPosts() -> AnyPublisher<[Post], HttpError> {
        let service = PostService()
        return sendRequest(request: service.request(.post))
            .eraseToAnyPublisher()
    }
}


