//
//  PostViewModel.swift
//  PostApp
//
//  Created by Damodar Namala on 09/09/22.
//

import Foundation
import Combine

final class PostViewModel: ObservableObject {
    @Published private var postFetchingState: FetchState = .unchaged
    @Published var posts: [Post] = []
    
    var isLoading : Bool {
        self.postFetchingState == .loading
    }
    
    var bag = Set<AnyCancellable>()
    private (set) var useCase: PostUseCase

    init(useCase: PostUseCase = PostFetchUseCase() ) {
        self.useCase = useCase
    }

    func fetchPosts() {
        postFetchingState = .loading
        useCase.fetchPosts()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                handle(compltion: completion, state: &self.postFetchingState)
            } receiveValue: { posts in
                self.posts = posts
            }.store(in: &bag)
    }
}
