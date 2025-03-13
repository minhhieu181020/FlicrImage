//
//  ViewModel.swift
//  FlicrImage
//
//  Created by Nguyễn Minh Hiếu on 13/03/2025.
//

import UIKit
import RxSwift

class ViewModel: NSObject {
    let disposeBag = DisposeBag()
    let initialData: Any?
    let isLoading: BehaviorSubject<Bool>
    var isLocking: Bool = false
    let isLockingObservable: BehaviorSubject<Bool> = BehaviorSubject(value: false)
    var waitingMQTTWorkItem: DispatchWorkItem?
    let isNoData: BehaviorSubject<Bool> = BehaviorSubject(value: false)
    var didGoResult: Bool = false
    
    weak var tableView: UITableView? = nil
    fileprivate var didListenInfinite: Bool = false
    
    required init(_ initialData: Any? = nil) {
        self.initialData = initialData
        self.isLoading = BehaviorSubject(value: false)
        super.init()
    }
    
    deinit {
        self.waitingMQTTWorkItem?.cancel()
    }
    
    
    
    func bind(_ tableView: UITableView?) {
        self.tableView = tableView
    }
   
   
  
}
