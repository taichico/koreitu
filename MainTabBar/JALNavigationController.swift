//
//  JALNavigationController.swift
//  Common
//
//  Created by Yusaku Ueda on 2018/11/07.
//  Copyright © 2018年 Japan Airlines. All rights reserved.
//

import UIKit

/// UINavigationControllerの継承.
///
/// 原則UINavigationControllerではなくこちらを使用する.
open class JALNavigationController: UINavigationController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }

    /// 横スワイプでの戻る処理を呼び出すヘルパー
    private let gestureHelper = InteractivePopGestureHelper()
//    /// 横スワイプでの戻る処理を有効にするフラグ
//    public var isInteractivePopGesture: Bool = false {
//        didSet { gestureHelper.isEnabled = isInteractivePopGesture }
//    }
//
//    public override init(rootViewController: UIViewController) {
//        super.init(rootViewController: rootViewController)
////        commonInit()
//    }
//
//    public override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
//        super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
////        commonInit()
//    }
//
//    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
////        commonInit()
//    }
//
//    public required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }

    private func commonInit() {
        // 画面端スワイプのヘルパーを初期化
//        gestureHelper.isEnabled = isInteractivePopGesture
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
//            appearance.configureWithOpaqueBackground()
//            appearance.backgroundColor = .white
//            self.navigationBar.standardAppearance = appearance
//            self.navigationBar.scrollEdgeAppearance = appearance
        } else {
            // バーの半透明を無効化
//            navigationBar.isTranslucent = false
        }
        // 画面端スワイプで前画面に戻る機能をヘルパーで有効無効を切り替えるように設定
        // 戻るボタンをカスタムしている場合は無効になってしまうため、delegateで有効にする必要がある
//        interactivePopGestureRecognizer?.isEnabled = true
//        interactivePopGestureRecognizer?.delegate = gestureHelper
        // ステータスバーの文字を白くする
//        navigationBar.barStyle = .default
        // ナビゲーションバーのボタンの同時押しを禁止
//        navigationBar.isExclusiveTouch = true
        // アイコンの色を設定
//        navigationBar.tintColor = UIColor.black
    }

    // MARK: - Rotate

    /// 画面回転を許可するかどうかを返す.
    ///
    /// - Returns: true:回転を許可する. false:回転を許可しない.
//    override open var shouldAutorotate: Bool {
//        guard let topViewController = topViewController else {
//            return super.shouldAutorotate
//        }
//        // 標準のUINavigationControllerは常にtrueを返すので、
//        // 表示している画面に合わせて返り値を変化させるようにする.
//        return topViewController.shouldAutorotate
//    }
//
//    /// 画面回転を許可する方向を返す.
//    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        guard let topViewController = topViewController else {
//            return super.supportedInterfaceOrientations
//        }
//        // 標準のUINavigationControllerは常にportraitを返すので、
//        // 表示している画面に合わせて返り値を変化させるようにする.
//        return topViewController.supportedInterfaceOrientations
//    }
//
//    /// タブの表示は現在表示している画面のものを使用するように修正
//    open override var tabBarItem: UITabBarItem! {
//        get { return topViewController?.tabBarItem ?? super.tabBarItem }
//        set { super.tabBarItem = newValue }
//    }
}


//
//  InteractivePopGestureHelper.swift
//  Common
//
//  Created by Yusaku Ueda on 2019/06/17.
//  Copyright © 2019年 Japan Airlines. All rights reserved.
//

import Foundation

/// ジェスチャーの有効無効を切り替えるデリゲートを実装する
///
/// UINavigationControllerの横スワイプによる画面切り替えの有効無効を切り替えるのに使用する.
public class InteractivePopGestureHelper: NSObject, UIGestureRecognizerDelegate {
    /// ジェスチャーの有効状態
//    public var isEnabled: Bool = false
//
//    // MARK: UIGestureRecognizerDelegate
//
//    /// ジェスチャーを処理するならtrueを返す
//    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        return isEnabled
//    }
}
