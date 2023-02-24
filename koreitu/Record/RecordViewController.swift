import UIKit

class RecordViewController: UIViewController, RecordViewProtocol {
    
    public var presenter: RecordPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func hairButtonTapped(_ sender: Any) {
        presenter?.printInfo()
    }
}
