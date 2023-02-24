import Foundation

public protocol ShowDataWireframeProtocol {
    
}

public protocol ShowDataPresenterProtocol {
    func printInfo()
}

public protocol ShowDataViewProtocol {
    var presenter: ShowDataPresenter? { get set }
}
