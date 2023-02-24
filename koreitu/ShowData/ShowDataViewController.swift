import UIKit

class ShowDataViewController: UIViewController, ShowDataViewProtocol {

    public var presenter: ShowDataPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .brown
    }
}
