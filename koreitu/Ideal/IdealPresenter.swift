import Foundation

public final class IdealPresenter: IdealPresenterProtocol {
    private var view: IdealViewProtocol?
    private let router: IdealWireframeProtocol
    
    public init(interface: IdealViewProtocol, router: IdealWireframeProtocol) {
        self.view = interface
        self.router = router
    }
    
    public func printInfo() {
        print("hogehoge")
    }
}
