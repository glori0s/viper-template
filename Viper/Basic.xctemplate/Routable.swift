// ___FILEHEADER___

import UIKit

// MARK: - Routable

protocol Routable: AnyObject {
    
    // MARK: - Types
    
    associatedtype View: UIViewController & Viewable
    associatedtype Presenter: Presentable
    associatedtype Interactor: Interactable
    associatedtype Router: Routable
    
    // MARK: - Public properties
    
    var view: View? { get set }
    
    // MARK: - Public methods
    
    static func createModule(view: View, presenter: Presenter, interactor: Interactor, router: Router) -> View
}
