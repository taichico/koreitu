import Foundation

public final class IdealRouter: IdealWireframeProtocol {
    
    var viewController: IdealViewController?
    
    static func createModule() -> IdealViewController {
        let view = IdealViewController()
        let router = IdealRouter()
        let presenter = IdealPresenter(interface: view, router: router)
        view.presenter = presenter
        router.viewController = view
        return view
    }
}
