import Foundation

public protocol DeleteWireframeProtocol {
    
}

public protocol DeletePresenterProtocol {
    func deleteDoneButtonTap()
}

public protocol DeleteViewProtocol {
    var presenter: DeletePresenter? { get set }
    func deleteDoneButtonTap()
}
