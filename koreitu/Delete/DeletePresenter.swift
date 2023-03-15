import Foundation

public final class DeletePresenter: DeletePresenterProtocol {
    private var view: DeleteViewProtocol?
    private let router: DeleteWireframeProtocol
    
    public init(interface: DeleteViewProtocol, router: DeleteWireframeProtocol) {
        self.view = interface
        self.router = router
    }
}
