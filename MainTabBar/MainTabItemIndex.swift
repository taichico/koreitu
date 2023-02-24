import Foundation

/// メインタブのタブ項目のインデックスを表す列挙型
public enum MainTabItemIndex: Int, CaseIterable {
    /// ホーム
    case record
    /// 予約確認
    case showData
    // 空席照会・予約
    case ideal
    // 運航状況
    case delete

    /// タブ項目のインデックス番号.
    public var index: Int { return rawValue }
}
