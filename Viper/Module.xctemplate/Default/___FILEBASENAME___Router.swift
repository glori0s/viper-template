// ___FILEHEADER___

import Foundation

// MARK: - ___VARIABLE_productName:identifier___PresenterToRouter

protocol ___VARIABLE_productName:identifier___PresenterToRouter: AnyObject {}

// MARK: - ___VARIABLE_productName:identifier___Router

final class ___VARIABLE_productName:identifier___Router: Routable {
    
    // MARK: - Types
    
    typealias View = ___VARIABLE_productName:identifier___View
    typealias Presenter = ___VARIABLE_productName:identifier___Presenter
    typealias Interactor = ___VARIABLE_productName:identifier___Interactor
    typealias Router = ___VARIABLE_productName:identifier___Router
    
    // MARK: - Public properties
    
    weak var view: View?
    
    // MARK: - Public methods
    
    static func createModule(view: View, presenter: Presenter, interactor: Interactor, router: Router) -> View {
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}

// MARK: - ___VARIABLE_productName:identifier___PresenterToRouter

extension ___VARIABLE_productName:identifier___Router: ___VARIABLE_productName:identifier___PresenterToRouter {}
