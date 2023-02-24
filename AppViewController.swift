//
//  AppViewController.swift
//  Common
//
//  Created by Yusaku Ueda on 2018/11/01.
//  Copyright © 2018年 Japan Airlines. All rights reserved.
//

import UIKit

public final class AppViewController: UIViewController {

    // MARK: Properties

    private var _currentViewController: UIViewController
    public var currentViewController: UIViewController {
        get { return _currentViewController }
        set { setCurrentViewController(newValue, animated: false) }
    }

    // MARK: - Life cycle

    public init(viewController: UIViewController) {
        _currentViewController = viewController
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        _currentViewController.addAsContainer(to: self, newFrame: view.bounds, animated: false)
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 子ビューが解放されているなら、再度読み込ませる
        if !_currentViewController.isViewLoaded {
            _currentViewController.view.frame = view.bounds
            view.addSubview(_currentViewController.view)
        }
    }

    // MARK: Rotate

    public override var shouldAutorotate: Bool {
        return currentViewController.shouldAutorotate
    }

    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return currentViewController.supportedInterfaceOrientations
    }

    // MARK: Statusbar

    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return currentViewController.preferredStatusBarStyle
    }

    public override var prefersStatusBarHidden: Bool {
        return currentViewController.prefersStatusBarHidden
    }

    public override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return currentViewController.preferredStatusBarUpdateAnimation
    }

    // MARK: Override

    // MARK: Methods

    public func setCurrentViewController(_ newViewController: UIViewController, animated: Bool) {
        guard _currentViewController != newViewController else {
//            log.warning("currentViewController and newViewController is same.")
            return
        }
        let oldViewController = _currentViewController
        _currentViewController = newViewController
        _switchCurrentViewController(to: newViewController, from: oldViewController, animated: animated)
    }

    /// 現在表示中の画面を切り替える処理の実装.
    ///
    /// - Parameters:
    ///   - newViewController: 切り替え先の画面
    ///   - animated: アニメーション付きで切り替える場合はtrue. 無しならfalse.
    private func _switchCurrentViewController(to newViewController: UIViewController?, from oldViewController: UIViewController?, animated: Bool) {
        guard isViewLoaded else {
            // 画面未ロードの場合はここでは切り替え処理を行わない.
            // viewDidLoadで行う.
            return
        }
        guard oldViewController != newViewController else {
            // 切り替え前後が同じ画面の場合は何もしない
            return
        }
        // 切り替え前の画面を切り離し
        oldViewController?.removeFromContainer(animated: animated)
        // 切り替え後の画面を追加
        newViewController?.addAsContainer(to: self, newFrame: view.bounds, animated: animated)

        if let newView = newViewController?.view {
            // 他の画面を隠さないように最背面に移動
            view.sendSubviewToBack(newView)
        }
    }
}


//
//  UIViewController+Utils.swift
//  Common
//
//  Created by Yusaku Ueda on 2018/11/07.
//  Copyright © 2018年 Japan Airlines. All rights reserved.
//

import UIKit
import SafariServices

public extension UIViewController {

    /// self を Container ViewController に追加する.
    ///
    /// self が別の Container ViewController の子になっている場合でも、元々の親から削除してから指定した親に追加される.
    /// - Parameter toParent: Container View Controller.
    /// - Parameter newFrame: self.view に設定するframe.
    /// - Parameter superview: 追加するときに親ビューに指定するview. nilの場合はtoParent.viewを使用する.
    /// - Parameter animated: アニメーションの有無. viewWillAppear等の引数にも渡される. default: false
    public func addAsContainer(to toParent: UIViewController, newFrame: CGRect, superview: UIView? = nil, animated: Bool = false) {
        _move(to: toParent, newFrame: newFrame, superview: superview, animated: animated)
    }

    /// self を Container ViewController から削除する.
    ///
    /// - Parameter animated: アニメーションの有無. viewWillAppear等の引数にも渡される. default: false
    public func removeFromContainer(animated: Bool = false) {
        _move(to: nil, newFrame: nil, superview: nil, animated: animated)
    }

    /// self を Container ViewController に追加/削除する.
    ///
    /// 追加する場合は toParent, newFrame 共に **非nil** を、
    /// 削除する場合は toParent, newFrame 共に **nil** を指定する.
    ///
    /// self が別の Container ViewController の子になっている場合でも、元々の親から削除してから指定した親に追加される.
    ///
    /// - Parameter toParent: Container View Controller. 削除する場合は nil.
    /// - Parameter newFrame: self.view に設定するframe. 削除する場合は nil.
    /// - Parameter superview: 追加するときに親ビューに指定するview. nilの場合はtoParent.viewを使用する.
    /// - Parameter animated: アニメーションの有無. viewWillAppear等の引数にも渡される.
    private func _move(to toParent: UIViewController?, newFrame: CGRect?, superview: UIView?, animated: Bool) {
        assert(parent != nil || toParent != nil)
        // 表示中の画面=>表示中の画面 or 非表示中の画面=>非表示中の画面の場合はviewWillAppear等を呼ばないようにする
        let isMove = (parent?.view.window != nil) == (toParent?.view.window != nil)
        if parent != nil {
            self.willMove(toParent: nil)
            if !isMove {
                // viewWillDisappear:, viewDidDisappear: を呼ぶ
                self.beginAppearanceTransition(false, animated: animated)
                animateDisappear(animated: animated) {
                    self.view.removeFromSuperview()
                    self.endAppearanceTransition()
                    self.removeFromParent()
                }
            } else {
                self.view.removeFromSuperview()
                self.removeFromParent()
            }
        }

        assert(!(toParent != nil) || newFrame != nil, "toParent != nil なら newFrame != nil")
        assert(!(toParent == nil) || newFrame == nil, "toParent == nil なら newFrame == nil")
        assert(!(toParent == nil) || superview == nil, "toParent == nil なら superview == nil")
        if let toParent = toParent, let newFrame = newFrame {
            let superview: UIView = superview ?? toParent.view
            toParent.addChild(self)
            view.frame = newFrame
            if !isMove {
                // viewWillAppear:, viewDidAppear: を呼ぶ
                self.beginAppearanceTransition(true, animated: animated)
                superview.addSubview(self.view)
                animateAppear(animated: animated) {
                    self.endAppearanceTransition()
                    self.didMove(toParent: toParent)
                }
            } else {
                superview.addSubview(self.view)
                didMove(toParent: toParent)
            }
        }
    }

    private func animateAppear(animated: Bool, completion: @escaping () -> Void) {
        if animated {
            CATransaction.begin()
            defer { CATransaction.commit() }

            let anim = CABasicAnimation(keyPath: "opacity")
            anim.fromValue = 0.0 as Float
            anim.timingFunction = CAMediaTimingFunction(name: .linear)
            anim.duration = 0.2
            CATransaction.setCompletionBlock(completion)
            view.layer.add(anim, forKey: "opacity")
        } else {
            completion()
        }
    }

    private func animateDisappear(animated: Bool, completion: @escaping () -> Void) {
        if animated {
            CATransaction.begin()
            defer { CATransaction.commit() }

            let anim = CABasicAnimation(keyPath: "opacity")
            anim.toValue = 0.0 as Float
            anim.timingFunction = CAMediaTimingFunction(name: .linear)
            anim.duration = 0.2
            anim.isRemovedOnCompletion = false
            anim.fillMode = .forwards
            CATransaction.setCompletionBlock {
                self.view.layer.removeAnimation(forKey: "opacity")
                completion()
            }
            view.layer.add(anim, forKey: "opacity")
        } else {
            completion()
        }
    }

    /// 親を辿っていって最上位の親を返す.
    ///
    /// self が最上位の場合は self を返す.
    public var rootViewController: UIViewController {
        var rootVC: UIViewController = self
        while let parentVC = rootVC.parent {
            rootVC = parentVC
        }
        return rootVC
    }

    /// 最上位の親がAppViewControllerならそれを返す.
    public var appViewController: AppViewController? {
        return rootViewController as? AppViewController
    }

    /// モーダルを辿っていって、最前面にモーダル表示しているViewControllerを返す.
    ///
    /// self が最前面の場合は self を返す.
    public var topPresentedViewController: UIViewController {
        var vc: UIViewController = self
        while let modalVC = vc.presentedViewController {
            vc = modalVC
        }
        return vc
    }

    /// モーダルを遡っていって、最初に条件を満たすViewControllerを返す.
    ///
    /// self が条件を満たす場合は self を返す.
    /// - Parameters:
    ///   - conditionBlock: 条件ブロック. 条件を満たす場合はtrueを返す
    ///   - vc: モーダルを遡る過程で見つけたUIViewController. 最初はselfが渡される.
    /// - Returns: 最初に見つかった条件を満たすViewController.
    public func firstPresentingViewController(_ conditionBlock: (_ vc: UIViewController) -> Bool) -> UIViewController? {
        var vc: UIViewController? = self
        while let tmpVC = vc {
            if conditionBlock(tmpVC) {
                return tmpVC
            }
            vc = tmpVC.presentingViewController
        }
        return nil
    }
}
