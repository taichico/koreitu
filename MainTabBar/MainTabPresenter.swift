import UIKit

public final class MainTabPresenter: MainTabPresenterProtocol {
    private var view: MainTabViewProtocol?
    private let router: MainTabWireframeProtocol
    
    /// コンストラクタ
    public init(interface: MainTabViewProtocol, router: MainTabWireframeProtocol) {
        self.view = interface
        self.router = router
    }
    
    public func showRecord() {
        router.showRecord()
    }
    
    public func showData() {
        router.showData()
    }
    
    public func showIdeal() {
        router.showIdeal()
    }
    
    public func showDelete() {
        router.showDelete()
    }
}
