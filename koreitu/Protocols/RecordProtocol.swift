import Foundation

public protocol RecordWireframeProtocol {
    
}

public protocol RecordPresenterProtocol {

}

public protocol RecordViewProtocol {
    var presenter: RecordPresenter? { get set }
}
