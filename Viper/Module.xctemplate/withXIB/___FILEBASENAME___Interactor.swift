//  ___FILEHEADER___

import Foundation

// MARK: - ___VARIABLE_productName:identifier___PresenterToInteractor

protocol ___VARIABLE_productName:identifier___PresenterToInteractor: AnyObject {}

// MARK: - ___VARIABLE_productName:identifier___Interactor

final class ___VARIABLE_productName:identifier___Interactor: Interactable {
    
    // MARK: - Types
    
    typealias Presenter = ___VARIABLE_productName:identifier___InteractorToPresenter
    
    // MARK: - Public properties
    
    weak var presenter: Presenter?
}

// MARK: - ___VARIABLE_productName:identifier___PresenterToInteractor

extension ___VARIABLE_productName:identifier___Interactor: ___VARIABLE_productName:identifier___PresenterToInteractor {}
