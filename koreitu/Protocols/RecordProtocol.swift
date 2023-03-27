import Foundation

public protocol RecordWireframeProtocol {
    
}

public protocol RecordPresenterProtocol {
    func daialog(item: Item)
}

 protocol RecordViewProtocol {
    var presenter: RecordPresenter? { get set }
    func showDaialog(item: Item)
}
