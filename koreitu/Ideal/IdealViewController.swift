import UIKit

class IdealViewController: UIViewController, IdealViewProtocol {

    @IBOutlet weak var idealNavigationBar: UINavigationBar!
    @IBOutlet weak var idealTextField: UITextField!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var periodTextField: UITextField!
    var idealPickerView: UIPickerView = UIPickerView()
    
    let dataList = ["髪", "髭", "鼻毛", "爪", "眉毛", "部屋の掃除", "布団", "トイレ掃除"]
    
    public var presenter: IdealPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        idealPickerView.delegate = self
        idealPickerView.dataSource = self

        setupPicker()
    }
    
    // 決定ボタン押下
    @objc func idealDone() {
        presenter?.idealDoneButtonTap()
    }
    
    // 決定ボタン押下
    @objc func periodDone() {
        presenter?.periodDoneButtonTap()
    }
    
    func idealDoneButtonTap() {
        idealTextField.endEditing(true)
        idealTextField.text = "\(dataList[idealPickerView.selectedRow(inComponent: 0)])"
    }
    
    func periodDoneButtonTap() {
        periodTextField.endEditing(true)
    }
    
    
    @IBAction func decideButtonAction(_ sender: Any) {
        presenter?.decideButtonAction()
    }
}


extension IdealViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func setupPicker() {
        let idealtoolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let idealspacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let idealdoneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(idealDone))
        idealtoolbar.setItems([idealspacelItem, idealdoneItem], animated: true)
        
        let periodtoolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let periodspacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let perioddoneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(periodDone))
        periodtoolbar.setItems([periodspacelItem, perioddoneItem], animated: true)
        
        idealTextField.inputView = idealPickerView
        idealTextField.inputAccessoryView = idealtoolbar
        
        periodTextField.keyboardType = UIKeyboardType.numberPad
        periodTextField.inputAccessoryView = periodtoolbar
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
