//
//  ErrorView.swift
//  PostApp
//
//  Created by Damodar Namala on 09/09/22.
//

import SwiftUI
struct ErrorScreen: View {
    let error: (title:String, description:String)
    var body: some View {
        VStack (spacing: 16){
            Text(error.title)
                .font(.headline)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .font(.headline)
            
            Text(error.description)
                .font(.footnote)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .font(.headline)
            
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.red)
                .font(.largeTitle)
        }
    }
}

extension ErrorScreen {
    static func present(with error: (title: String, description: String)) {
        let view = UIHostingController(rootView: ErrorScreen(error: error))
        UIApplication.shared.topMostViewController()?.present(view, animated: true)
    }
}
