import UIKit

class RecordViewController: UIViewController, RecordViewProtocol {
    
    public var presenter: RecordPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func hairButtonTapped(_ sender: UIButton) {
        Common.Utility.showAlert(title: Item(rawValue: 0)?.word, isDestructive: true, completion: nil)
    }
    
    @IBAction func beardButtonTapped(_ sender: UIButton) {
        Common.Utility.showAlert(title: Item(rawValue: 1)?.word, isDestructive: true, completion: nil)
    }
    
    @IBAction func nosehairButtonTappped(_ sender: UIButton) {
        Common.Utility.showAlert(title: Item(rawValue: 2)?.word, isDestructive: true, completion: nil)
    }
    
    @IBAction func nailButtonTapped(_ sender: UIButton) {
        Common.Utility.showAlert(title: Item(rawValue: 3)?.word, isDestructive: true, completion: nil)
    }
    
    @IBAction func eyebrowsButtonTapped(_ sender: UIButton) {
        Common.Utility.showAlert(title: Item(rawValue: 4)?.word, isDestructive: true, completion: nil)
    }
    
    @IBAction func roomCleanButtonTapped(_ sender: UIButton) {
        Common.Utility.showAlert(title: Item(rawValue: 5)?.word, isDestructive: true, completion: nil)
    }
    @IBAction func futonButtonTapped(_ sender: UIButton) {
        Common.Utility.showAlert(title: Item(rawValue: 6)?.word, isDestructive: true, completion: nil)
    }
    @IBAction func toiletButtonTapped(_ sender: UIButton) {
        Common.Utility.showAlert(title: Item(rawValue: 7)?.word, isDestructive: true, completion: nil)
    }
}
