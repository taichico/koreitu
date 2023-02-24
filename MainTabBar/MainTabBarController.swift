import UIKit

final class MainTabBarController: UITabBarController, MainTabViewProtocol {
    var presenter: MainTabPresenterProtocol?
    
    override func viewDidLoad() {
        setupTab()
    }
    
    func setupTab() {
        let recordViewController = RecordViewController()
        recordViewController.tabBarItem = UITabBarItem(title: "tab1", image: .none, tag: 0)
        
        let showDataViewController = ShowDataViewController()
        showDataViewController.tabBarItem = UITabBarItem(title: "tab1", image: .none, tag: 0)
        
        let idealViewController = IdealViewController()
        idealViewController.tabBarItem = UITabBarItem(title: "tab1", image: .none, tag: 0)
        
        let deleteViewController = DeleteViewController()
        deleteViewController.tabBarItem = UITabBarItem(title: "tab1", image: .none, tag: 0)
        
        viewControllers = [recordViewController, showDataViewController, idealViewController, deleteViewController]
    }
}


