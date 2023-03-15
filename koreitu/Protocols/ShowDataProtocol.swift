import Foundation

public protocol ShowDataWireframeProtocol {
    
}

public protocol ShowDataPresenterProtocol {

}

public protocol ShowDataViewProtocol {
    var presenter: ShowDataPresenter? { get set }
}
