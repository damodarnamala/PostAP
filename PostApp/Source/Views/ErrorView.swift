//
//  ErrorView.swift
//  PostApp
//
//  Created by Damodar Namala on 09/09/22.
//

import SwiftUI
struct ErrorScreen: View {
    let error: String
    var body: some View {
        VStack {
            Text(error).font(.headline)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
        }
    }
}

extension ErrorScreen {
    static func present(with error: String) {
        let view = UIHostingController(rootView: ErrorScreen(error: error))
        UIApplication.shared.topMostViewController()?.present(view, animated: true)
    }
}
