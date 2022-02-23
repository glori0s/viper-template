// ___FILEHEADER___

import Foundation

final class ___VARIABLE_productName:identifier___Assembler {
    
    // MARK: - Public methods
    
    static func assemble(_ view: ___VARIABLE_productName:identifier___ViewController) {
        let presenter = ___VARIABLE_productName:identifier___Presenter()
        let interactor = ___VARIABLE_productName:identifier___Interactor()
        let router = ___VARIABLE_productName:identifier___Router()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view
    }
}
