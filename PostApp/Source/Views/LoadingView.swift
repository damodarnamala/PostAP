//
//  LoadingView.swift
//  PostApp
//
//  Created by Damodar Namala on 10/09/22.
//

import SwiftUI

struct LoadingView: View {
    @State var animate = true
    var body: some View {
            VStack(spacing: 16) {
                ActivityIndicator(isAnimating: $animate)
                Text("Loading..")
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
            .padding(34)
            .background(Color.secondary.opacity(0.15))
            .cornerRadius(8)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

