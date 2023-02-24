import UIKit

class IdealViewController: UIViewController, IdealViewProtocol {

    @IBOutlet weak var idealNavigationBar: UINavigationBar!
    @IBOutlet weak var idealTextField: UITextField!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var periodTextField: UITextField!
    
    var pickerView: UIPickerView = UIPickerView()
    
    let dataList = ["髪", "髭", "鼻毛", "爪", "眉毛", "部屋の掃除", "布団", "トイレ掃除"]
    
    public var presenter: IdealPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        
        setupPicker()
    }
    
    // 決定ボタン押下
    @objc func done() {
        presenter?.doneButtonTap()
        print("done")
    }
    
    func doneButtonTapped() {
        idealTextField.endEditing(true)
        idealTextField.text = "\(dataList[pickerView.selectedRow(inComponent: 0)])"
    }
}


extension IdealViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    

    
    func setupPicker() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        idealTextField.inputView = pickerView
        idealTextField.inputAccessoryView = toolbar
    }
    
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }
    
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return dataList[row]
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,didSelectRow row: Int, inComponent component: Int) {
        
    }
}
