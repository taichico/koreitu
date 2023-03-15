import Foundation

public protocol DeleteWireframeProtocol {
    
}

public protocol DeletePresenterProtocol {

}

public protocol DeleteViewProtocol {
    var presenter: DeletePresenter? { get set }
}
