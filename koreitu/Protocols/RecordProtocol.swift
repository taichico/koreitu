import Foundation

public protocol RecordWireframeProtocol {
    
}

public protocol RecordPresenterProtocol {

}

 protocol RecordViewProtocol {
    var presenter: RecordPresenter? { get set }
}
