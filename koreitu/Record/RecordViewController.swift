import UIKit

class RecordViewController: UIViewController, RecordViewProtocol {
    
    public var presenter: RecordPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func hairButtonTapped(_ sender: UIButton) {
        presenter?.daialog(item: .hair)
        
    }
    
    @IBAction func beardButtonTapped(_ sender: UIButton) {
        presenter?.daialog(item: .beard)
    }
    
    @IBAction func nosehairButtonTappped(_ sender: UIButton) {
        presenter?.daialog(item: .nosehair)
    }
    
    @IBAction func nailButtonTapped(_ sender: UIButton) {
        presenter?.daialog(item: .nail)
    }
    
    @IBAction func eyebrowsButtonTapped(_ sender: UIButton) {
        presenter?.daialog(item: .eyebrows)
    }
    
    @IBAction func roomCleanButtonTapped(_ sender: UIButton) {
        presenter?.daialog(item: .roomClean)
    }
    @IBAction func futonButtonTapped(_ sender: UIButton) {
        presenter?.daialog(item: .futon)
    }
    @IBAction func toiletButtonTapped(_ sender: UIButton) {
        presenter?.daialog(item: .toilet)
    }
    
   public func showDaialog(item: Item) {
       let alert: UIAlertController = UIAlertController(title: item.word, message:  "", preferredStyle:  UIAlertController.Style.alert)
        let confirmAction: UIAlertAction = UIAlertAction(title: "確定", style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            FileManager.default.createFile(item: item)
            FileManager.default.dateAppendText(item: item)
            print(FileManager.default.readingFile(item: item))
        })
        // キャンセルボタンの処理
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
            (action: UIAlertAction!) -> Void in
            
        })
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        present(alert, animated: true, completion: nil)
    }
}
