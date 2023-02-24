import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
//    static var shared = AppDelegate()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc: MainTabBarController = MainTabRouter.createModule()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        // 全てのUIViewControllerのサブクラスで supportedInterfaceOrientations をオーバーライドするのは現実的でないので
        // RotatableProtocol を適用した UIViewController を探して見つかったらそれの supportedInterfaceOrientations の値を使用する.
        var nextVC = window?.rootViewController
        // 全てのモーダル画面を列挙
        var vcList = [UIViewController]()
        while let vc = nextVC {
            // モーダル画面で表示している画面からRotatableProtocolを適用している画面を探す
            vcList.append(contentsOf: searchRotatableViewControllers(vc))
            nextVC = vc.presentedViewController
        }
        if let rotatableVC = vcList.last {
            return rotatableVC.supportedInterfaceOrientations
        }
        return .portrait
    }
    
    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }

    /// 指定した画面で表示している画面からRotatableProtocolを適用している画面を探す
    ///
    /// UITabBarController, UINavigationController, AppViewController の画面に対しては現在表示している画面からも検索する
    private func searchRotatableViewControllers(_ vc: UIViewController) -> [UIViewController] {
        var vcList = [UIViewController]()
        if let vc = vc as? UIViewController {
            vcList.append(vc)
        }

        let childVC: UIViewController?
        if let vc = vc as? UITabBarController {
            childVC = vc.selectedViewController
        } else if let vc = vc as? UINavigationController {
            childVC = vc.topViewController
        } else if let vc = vc as? AppViewController {
            childVC = vc.currentViewController
        } else {
            childVC = nil
        }
        if let childVC = childVC {
            vcList.append(contentsOf: searchRotatableViewControllers(childVC))
        }
        return vcList
    }

}
