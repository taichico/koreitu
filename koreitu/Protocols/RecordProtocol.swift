import Foundation

public protocol RecordWireframeProtocol {
    
}

public protocol RecordPresenterProtocol {
    func printInfo()
}

public protocol RecordViewProtocol {
    var presenter: RecordPresenter? { get set }
}
