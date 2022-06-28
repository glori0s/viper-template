// ___FILEHEADER___

import Foundation

// MARK: - Interactable

protocol Interactable: AnyObject {
    
    // MARK: - Types
    
    associatedtype Presenter
    
    // MARK: - Public properties
    
    var presenter: Presenter? { get set }
}
