import Foundation

public final class ShowDataRouter: ShowDataWireframeProtocol {
    
    var viewController: ShowDataViewController?
    
    static func createModule() -> ShowDataViewController {
        let view = ShowDataViewController()
        let router = ShowDataRouter()
        let presenter = ShowDataPresenter(interface: view, router: router)
        view.presenter = presenter
        router.viewController = view
        return view
    }
}
