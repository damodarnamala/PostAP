//
//  UI+Extentions.swift
//  PostApp
//
//  Created by Damodar Namala on 09/09/22.
//

import Foundation
import UIKit

extension UIApplication {
    func topMostViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        return keyWindow?.rootViewController?.topMostViewController()
    }
}

