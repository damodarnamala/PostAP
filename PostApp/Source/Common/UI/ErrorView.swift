//
//  ErrorView.swift
//  PostApp
//
//  Created by Damodar Namala on 09/09/22.
//

import SwiftUI
struct ErrorScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    let error: (title:String, description:String)
    var body: some View {
        VStack (spacing: 16) {
            Spacer()
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
            Spacer()
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Dismiss")
                    .font(.subheadline)
                    .foregroundColor(.primary)
            }
            .padding()
            .background(Color.primary.opacity(0.15))
            .cornerRadius(8)
        }
    }
}

extension ErrorScreen {
    static func present(with error: (title: String, description: String)) {
        let view = UIHostingController(rootView: ErrorScreen(error: error))
        UIApplication.shared.topMostViewController()?.present(view, animated: true)
    }
}
