//
//  UIStoryboard+.swift
//  FlicrImage
//
//  Created by Nguyễn Minh Hiếu on 15/03/2025.
//
import Foundation
import UIKit

extension UIStoryboard {
    func instantiate<T: UIViewController>(_ type: T.Type) -> T {
        let instance = self.instantiateViewController(withIdentifier: String(describing: type)) as! T
        return instance
    }
}

