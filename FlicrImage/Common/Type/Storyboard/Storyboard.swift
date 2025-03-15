//
//  Storyboard.swift
//  FlicrImage
//
//  Created by Nguyễn Minh Hiếu on 15/03/2025.
//

import Foundation
import UIKit
enum Storyboard {
    case main
    case welcome
    
    fileprivate var name: String {
        switch self {
        case .main:
            return "Main"
        case .welcome:
            return "Main"
        }
    }
    var value: UIStoryboard {
        return UIStoryboard(name: self.name, bundle: nil)
    }
}
