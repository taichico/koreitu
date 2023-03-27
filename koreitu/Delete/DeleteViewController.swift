import UIKit

class DeleteViewController: UIViewController, DeleteViewProtocol {
    var presenter: DeletePresenter?
    
    @IBOutlet weak var deleteTextFieild: UITextField!
    @IBOutlet weak var deleteTableView: UITableView!
    var deletePickerView: UIPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        deletePickerView.delegate = self
        deletePickerView.dataSource = self
        
        setupPicker()
    }
    
    // 決定ボタン押下
    @objc func deleteDone() {
        presenter?.deleteDoneButtonTap()
    }
    
    func deleteDoneButtonTap() {
        deleteTextFieild.endEditing(true)
        deleteTextFieild.text = Item(rawValue: deletePickerView.selectedRow(inComponent: 0))?.name
    }
}

extension DeleteViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func setupPicker() {
        let deletetoolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let deletespacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let deletedoneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(deleteDone))
        deletetoolbar.setItems([deletespacelItem, deletedoneItem], animated: true)
        
        deleteTextFieild.inputView = deletePickerView
        deleteTextFieild.inputAccessoryView = deletetoolbar
    }
    
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Item(rawValue: row)?.name
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Item.allCases.count
    }
    
    

}
