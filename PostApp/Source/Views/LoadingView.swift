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
        ZStack {
            Color.primary.opacity(0.05)
            VStack(spacing: 16) {
                ActivityIndicator(isAnimating: $animate)
                Text("Loading..")
                    .foregroundColor(.orange)
                    .font(.footnote)
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}


struct ActivityIndicator: UIViewRepresentable {
    @Binding var isAnimating: Bool
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.tintColor = .orange
        indicator.color = .orange
        return indicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
