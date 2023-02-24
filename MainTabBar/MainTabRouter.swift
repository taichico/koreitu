import UIKit

public final class MainTabRouter: MainTabWireframeProtocol {
    
    var viewController: MainTabBarController?
    
    // 記録
    private weak var recordVC: UIViewController?
    // データを見る
    private weak var showDataVC: UIViewController?
    // 理想
    private weak var idealVC: UIViewController?
    // 削除
    private weak var deleteVC: UIViewController?
    
     static func createModule() -> MainTabBarController {
        let view = MainTabBarController()
        let router = MainTabRouter()
        let presenter = MainTabPresenter(interface: view, router: router)
         view.presenter = presenter
        router.setup(view: view)
        return view
    }
    
    public func showRecord() {
        viewController?.selectedIndex = MainTabItemIndex.record.index
    }
    
    public func showData() {
        viewController?.selectedIndex = MainTabItemIndex.showData.index
    }
    
    public func showIdeal() {
        viewController?.selectedIndex = MainTabItemIndex.ideal.index
    }
    
    public func showDelete() {
        viewController?.selectedIndex = MainTabItemIndex.delete.index
    }
    
    private func setup(view: MainTabBarController) {
        // 記録
        let recordVC = RecordRouter.createModule()
        // データを見る
        let showDataVC = ShowDataRouter.createModule()
        // 理想
        let idealVC = IdealRouter.createModule()
        // 削除
        let deleteVC = DeleteRouter.createModule()
        
        self.recordVC = recordVC
        self.showDataVC = showDataVC
        self.idealVC = idealVC
        self.deleteVC = deleteVC
        
        let vcs: [UIViewController] = MainTabItemIndex.allCases.map {
            switch $0 {
                
            case .record:
                return JALNavigationController(rootViewController: recordVC)
            case .showData:
                return JALNavigationController(rootViewController: showDataVC)
            case .ideal:
                return JALNavigationController(rootViewController: idealVC)
            case .delete:
                return JALNavigationController(rootViewController: deleteVC)
            }
        }
        view.viewControllers = vcs
    }
    
}
