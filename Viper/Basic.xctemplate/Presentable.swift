// ___FILEHEADER___

import Foundation

// MARK: - Presentable

protocol Presentable: AnyObject {
    
    // MARK: - Types
    
    associatedtype View
    associatedtype Interactor
    associatedtype Router
    
    // MARK: - Public properties
    
    var view: View? { get set }
    var interactor: Interactor? { get set }
    var router: Router? { get set }
}
