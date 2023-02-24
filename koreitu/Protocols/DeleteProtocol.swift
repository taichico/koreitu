import Foundation

public protocol DeleteWireframeProtocol {
    
}

public protocol DeletePresenterProtocol {
    func printInfo()
}

public protocol DeleteViewProtocol {
    var presenter: DeletePresenter? { get set }
}
