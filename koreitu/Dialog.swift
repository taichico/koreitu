import UIKit

struct Common {
    struct Utility {
        static func showAlert(title: String?, isDestructive: Bool, completion: ((Bool) -> Void)?) {
            let buttonStyle: UIAlertAction.Style!
            if isDestructive == true {
                buttonStyle = .destructive
            } else {
                buttonStyle = .default
            }

            let alert = UIAlertController(title: title, message: "", preferredStyle: UIAlertController.Style.alert)

                let OKAction = UIAlertAction(title: "はい", style: buttonStyle)
                alert.addAction(OKAction)
                alert.preferredAction = OKAction

                let cancelAction = UIAlertAction(title: "いいえ", style: UIAlertAction.Style.cancel)
                alert.addAction(cancelAction)

            let topview = topViewController()
            if let topview = topview {
                topview.present(alert, animated: true, completion: nil)
            }
        }
            
        /// 最上位のViewControllerを取得
        /// - Returns: UIViewController
        static func topViewController() -> UIViewController? {
            var topViewController: UIViewController?
            if #available(iOS 13.0, *) {
                let scenes = UIApplication.shared.connectedScenes
                let windowScene = scenes.first as? UIWindowScene
                let window = windowScene?.windows.first
                topViewController = window?.rootViewController
            } else {
                topViewController = UIApplication.shared.keyWindow?.rootViewController
            }

            while (topViewController?.presentedViewController) != nil {
                topViewController = topViewController?.presentedViewController
            }

            return topViewController
        }
    }
}
