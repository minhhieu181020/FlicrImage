//
//  ViewController.swift
//  FlicrImage
//
//  Created by Nguyễn Minh Hiếu on 13/03/2025.
//

import Foundation
import UIKit
import RxSwift
class ViewController: UIViewController {
    
    func viewModel<T: ViewModel>(_ type: T.Type) -> T {
        return self.viewModel as! T
    }
    
}
