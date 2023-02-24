import Foundation

public final class RecordRouter: RecordWireframeProtocol {
    
    var viewController: RecordViewController?
    
    static func createModule() -> RecordViewController {
        let view = RecordViewController()
        let router = RecordRouter()
        let presenter = RecordPresenter(interface: view, router: router)
        view.presenter = presenter
        router.viewController = view
        return view
    }
}
