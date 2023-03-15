import UIKit

class DeleteViewController: UIViewController, DeleteViewProtocol {
    var presenter: DeletePresenter?
    
    @IBOutlet weak var deleteTextFieild: UITextField!
    @IBOutlet weak var deleteTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
