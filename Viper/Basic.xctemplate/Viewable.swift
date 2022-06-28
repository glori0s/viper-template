// ___FILEHEADER___

import Foundation

// MARK: - Viewable

protocol Viewable: AnyObject {
    
    // MARK: - Types
    
    associatedtype Presenter
    
    // MARK: - Public properties
    
    var presenter: Presenter? { get set }
}
