import Foundation

public final class DeleteRouter: DeleteWireframeProtocol {
    
    var viewController: DeleteViewController?
    
    static func createModule() -> DeleteViewController {
        let view = DeleteViewController()
        let router = DeleteRouter()
        let presenter = DeletePresenter(interface: view, router: router)
        view.presenter = presenter
        router.viewController = view
        return view
    }
}
