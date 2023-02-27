import Foundation

public protocol MainTabWireframeProtocol {
    /// ホーム画面を表示する.
    func showRecord()
    /// 予約確認画面を表示する.
    func showData()
    /// 空席照会画面を表示する.
    func showIdeal()
    /// 運航状況画面を表示する.
    func showDelete()
}

public protocol MainTabPresenterProtocol {
    /// ホーム画面を表示する.
//    func showRecord()
//    /// 予約確認画面を表示する.
//    func showData()
//    /// 空席照会画面を表示する.
//    func showIdeal()
//    /// 運航状況画面を表示する.
//    func showDelete()
//    func viewDidLoad()
//    func viewWillAppear(_ animated: Bool)
//    func viewDidAppear(_ animated: Bool)
//    func viewWillDisappear(_ animated: Bool)
//    func viewDidDisappear(_ animated: Bool)
//    /// 強制ログアウト時のエラーアラートが閉じられたとき
//    func onForceLogoutAlertClose(isLogin: Bool)
}

public protocol MainTabViewProtocol {
    var presenter: MainTabPresenterProtocol? { get set }
}
