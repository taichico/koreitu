import Foundation

public final class ShowDataPresenter: ShowDataPresenterProtocol {
    private var view: ShowDataViewProtocol?
    private let router: ShowDataWireframeProtocol
    
    public init(interface: ShowDataViewProtocol, router: ShowDataWireframeProtocol) {
        self.view = interface
        self.router = router
    }
}
