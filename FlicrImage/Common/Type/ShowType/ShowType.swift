//
//  ShowType.swift
//  FlicrImage
//
//  Created by Nguyễn Minh Hiếu on 15/03/2025.
//

import Foundation


enum ShowType {
    case root
    case push
    case present
    case embedded(index: Int, in: Scene)
    
    var embeddedIndex: Int? {
        switch self {
        case .embedded(let index, _):
            return index
        default:
            return nil
        }
    }
    
    var parentScene: Scene? {
        switch self {
        case .embedded(_, let scene):
            return scene
        default:
            return nil
        }
    }
}
