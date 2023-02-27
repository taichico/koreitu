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
        recordVC.tabBarItem = UITabBarItem(title: "記録する", image: .none, tag: 0)
        // データを見る
        let showDataVC = ShowDataRouter.createModule()
        showDataVC.tabBarItem = UITabBarItem(title: "データを見る", image: .none, tag: 0)
        // 理想
        let idealVC = IdealRouter.createModule()
        idealVC.tabBarItem = UITabBarItem(title: "周期を決める", image: .none, tag: 0)
        // 削除
        let deleteVC = DeleteRouter.createModule()
        deleteVC.tabBarItem = UITabBarItem(title: "データの削除", image: .none, tag: 0)
        
        self.recordVC = recordVC
        self.showDataVC = showDataVC
        self.idealVC = idealVC
        self.deleteVC = deleteVC
        
        let vcs: [UIViewController] = MainTabItemIndex.allCases.map {
            switch $0 {
            case .record:
                return recordVC
            case .showData:
                return showDataVC
            case .ideal:
                return idealVC
            case .delete:
                return deleteVC
            }
        }
        view.viewControllers = vcs
    }
}
