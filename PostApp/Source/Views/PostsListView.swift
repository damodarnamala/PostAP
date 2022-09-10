//
//  PostsListView.swift
//  PostApp
//
//  Created by Damodar Namala on 09/09/22.
//

import SwiftUI
import Foundation
import Combine

struct PostsListView: View {
    @ObservedObject var postViewModel = PostViewModel()
    
    var body: some View {
        VStack {
            if postViewModel.isLoading {
                LoadingView()
            } else {
                List(postViewModel.posts, id:\.id) { post in
                    let title =  post.title.capitalized
                    Text(title)
                        .font(.subheadline)
                }
                .listStyle(.plain)
            }
        }
        .padding(.vertical, 16)
        .onAppear {
            postViewModel.fetchPosts()
        }

    }
}

struct PostsListView_Previews: PreviewProvider {
    static var previews: some View {
        PostsListView()
    }
}
