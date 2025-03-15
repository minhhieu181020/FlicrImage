//
//  PageViewController.swift
//  FlicrImage
//
//  Created by Nguyễn Minh Hiếu on 15/03/2025.
//

import UIKit
import SnapKit

typealias PageViewControllerInitialData = (initialIndex: Int, initialData: Any?)
class PageViewController: ViewController {

    var currentSelected: Int = 0 {
        didSet {
            if currentSelected >= 0 && currentSelected < self.viewControllers_.count {
                let viewController = self.viewControllers_[currentSelected]
                self.pageViewController?.setViewControllers([viewController], direction: .forward, animated: false, completion: nil)
            }
        }
    }
    
    var currentViewController: UIViewController? {
        get {
            if currentSelected >= 0 && currentSelected < self.viewControllers_.count {
                return self.viewControllers_[currentSelected]
            } else {
                return nil
            }
        }
    }
    
    var viewControllers: [ViewController] {
        get {
            return self.viewControllers_
        }
        set {
            self.viewControllers_ = newValue
        }
    }
    
    fileprivate var viewControllers_: [ViewController] = []
    fileprivate var pageViewController: UIPageViewController?
    
    override func viewDidLoad() {
        if let initialData = self.viewModel.initialData as? PageViewControllerInitialData {
            self.currentSelected = initialData.initialIndex
        }
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.pageViewController?.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        self.pageViewController?.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        self.pageViewController?.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        self.pageViewController?.viewDidDisappear(animated)
    }
    
    /// Add page view controller to an view with child view controllers
    func addPageView(in view: UIView, viewControllers: [ViewController]) {
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.addChild(pageVC)
        view.addSubview(pageVC.view)
        pageVC.view.snp.makeConstraints { maker in
            maker.top.bottom.leading.trailing.equalToSuperview()
        }
        self.viewControllers_.removeAll()
        self.viewControllers_.append(contentsOf: viewControllers)
        if self.currentSelected >= 0 && self.currentSelected < self.viewControllers_.count {
            let viewController = self.viewControllers_[self.currentSelected]
            pageVC.setViewControllers([viewController], direction: .forward, animated: false, completion: nil)
        }
        pageVC.didMove(toParent: self)
        pageVC.viewDidLoad()
        self.pageViewController = pageVC
    }
}
