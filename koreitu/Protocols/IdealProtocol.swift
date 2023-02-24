import Foundation

public protocol IdealWireframeProtocol {
    
}

public protocol IdealPresenterProtocol {
    func printInfo()
}

public protocol IdealViewProtocol {
    var presenter: IdealPresenter? { get set }
}
