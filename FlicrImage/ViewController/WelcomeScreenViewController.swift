//
//  WelcomeScreenViewController.swift
//  FlicrImage
//
//  Created by Nguyễn Minh Hiếu on 15/03/2025.
//

import Foundation
import UIKit
class WelcomeScreenViewController: ViewController {
    @IBOutlet weak var transBtn: UIButton!
    
    override func viewDidLoad() {
        
        print("welcome")
    }
    
    @IBAction func btnClick(_ sender: Any) {
        SceneManager.shared.start(scene: .main)
    }
}
