import UIKit

class RecordViewController: UIViewController, RecordViewProtocol {
    
    public var presenter: RecordPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func hairButtonTapped(_ sender: Any) {
        presenter?.printInfo()
    }
    @IBAction func recordButtonTapped(_ sender: Any) {
        presenter?.printInfo()
    }
    @IBAction func showDataButtonTapped(_ sender: Any) {
        presenter?.printInfo()
    }
    
    @IBAction func idealButtonTapped(_ sender: Any) {
        presenter?.printInfo()
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        presenter?.printInfo()
    }
}
