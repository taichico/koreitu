import Foundation

public protocol IdealWireframeProtocol {
    
}

public protocol IdealPresenterProtocol {
    func printInfo()
    func doneButtonTap()
}

public protocol IdealViewProtocol {
    var presenter: IdealPresenter? { get set }
    func doneButtonTapped()
}
