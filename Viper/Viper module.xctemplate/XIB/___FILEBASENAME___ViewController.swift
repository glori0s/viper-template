// ___FILEHEADER___

import UIKit

class ___VARIABLE_productName:identifier___ViewController: UIViewController {

    // MARK: - Public properties
    
    var presenter: ___VARIABLE_productName:identifier___ViewToPresenter?
    
    // MARK: - Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        ___VARIABLE_productName:identifier___Assembler.assemble(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ___VARIABLE_productName:identifier___PresenterToView

extension ___VARIABLE_productName:identifier___ViewController: ___VARIABLE_productName:identifier___PresenterToView {}
