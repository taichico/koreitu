import Foundation

public protocol IdealWireframeProtocol {
    
}

public protocol IdealPresenterProtocol {
    func idealDoneButtonTap()
    func periodDoneButtonTap()
    func decideButtonAction()
}

public protocol IdealViewProtocol {
    var presenter: IdealPresenter? { get set }
    func idealDoneButtonTap()
    func periodDoneButtonTap()
//    func decideButtonAction()
}
