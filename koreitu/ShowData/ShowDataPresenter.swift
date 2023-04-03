import Foundation

public final class ShowDataPresenter: ShowDataPresenterProtocol {
    private var view: ShowDataViewProtocol?
    private let router: ShowDataWireframeProtocol
    
    var memoryManager: MemoryManagerProtocol!
    
    public init(interface: ShowDataViewProtocol, router: ShowDataWireframeProtocol) {
        self.view = interface
        self.router = router
    }
    
    func hoge() {
        memoryManager.isGuest = true
    }
}
