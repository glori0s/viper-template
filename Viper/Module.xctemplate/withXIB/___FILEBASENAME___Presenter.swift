//  ___FILEHEADER___

import Foundation

// MARK: - ___VARIABLE_productName:identifier___ViewToPresenter

protocol ___VARIABLE_productName:identifier___ViewToPresenter: AnyObject {}

// MARK: - ___VARIABLE_productName:identifier___InteractorToPresenter

protocol ___VARIABLE_productName:identifier___InteractorToPresenter: AnyObject {}

// MARK: - ___VARIABLE_productName:identifier___Presenter

final class ___VARIABLE_productName:identifier___Presenter: Presentable {
    
    // MARK: - Types
    
    typealias View = ___VARIABLE_productName:identifier___PresenterToView
    typealias Interactor = ___VARIABLE_productName:identifier___PresenterToInteractor
    typealias Router = ___VARIABLE_productName:identifier___PresenterToRouter
    
    // MARK: - Public properties
    
    weak var view: View?
    var interactor: Interactor?
    var router: Router?
}

// MARK: - ___VARIABLE_productName:identifier___ViewToPresenter

extension ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___ViewToPresenter {}

// MARK: - ___VARIABLE_productName:identifier___InteractorToPresenter

extension ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___InteractorToPresenter {}
