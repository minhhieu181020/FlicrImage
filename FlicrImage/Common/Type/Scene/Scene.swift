//
//  Scene.swift
//  FlicrImage
//
//  Created by Nguyễn Minh Hiếu on 15/03/2025.
//

import Foundation
import UIKit

enum Scene: String {
    // welcome
    case welcome = "welcome"
    
    
    // Signed In
    case main = "main"
    
    
    func getViewController(_ inititalData: Any? = nil) -> ViewController {
        let viewControllerType = self.viewController
        let viewController = self.storyboard.value.instantiate(viewControllerType)
        let viewModelType = self.viewModel
        let viewModel = viewModelType.init(inititalData)
        viewController.viewModel = viewModel
        return viewController
    }
    var showType: ShowType {
        switch self {
        case .welcome:
            return .root
        case .main:
            return .push
        }
            
    }
    fileprivate var viewController: ViewController.Type {
        switch self {
        case .welcome:
            return WelcomeScreenViewController.self
        case .main:
            return MainScreenViewController.self
        }
    }
    fileprivate var viewModel: ViewModel.Type {
        switch self {
        case .main:
            return MainScreenViewModel.self
        case .welcome:
            return WelcomeViewModel.self
        }
    }
    fileprivate var storyboard: Storyboard {
        switch self {
        case .main:
            return Storyboard.main
        case .welcome:
            return Storyboard.welcome
        }
    }
}

