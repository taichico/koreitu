import Foundation

public final class RecordPresenter: RecordPresenterProtocol {
    private var view: RecordViewProtocol?
    private let router: RecordWireframeProtocol
    
     init(interface: RecordViewProtocol, router: RecordWireframeProtocol) {
        self.view = interface
        self.router = router
    }
}
