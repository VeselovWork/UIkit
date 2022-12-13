//
//  ViewController.swift
//  UIkit
//
//  Created by Andrey on 03.12.2022.
//
//
import UIKit

class ViewController: UIViewController, UITextViewDelegate{
    
    var segmentControll = UISegmentedControl()
    var imageView = UIImageView()
    var errorButton = UIButton()
    let textFild = UITextField()
    let mySwitch = UISwitch()
    let myPicker = UIPickerView()
    var myModel = ModelData()
    var selectedMarka: Marka?
    var selectedModel: Model?
    let lebleData = UILabel()
    
    
    
    
    
    var menuArrey = ["One", "two", "thee"]
    let imagArrey = [ UIImage (named: "foto1.jpeg"),
                      UIImage (named: "foto2.jpeg"),
                      UIImage (named: "foto3.jpeg")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add Lable
        self.view.addSubview(lebleData)
        self.lebleData.text = "TEST_TEST"
        self.lebleData.frame = CGRect(x: 150, y: 600, width: 200, height: 30)
        
        
        // Add Done Button
        
        let tooBar: UIToolbar = UIToolbar()
        tooBar.barStyle = .black
        tooBar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(donePressed)),
        ]
        tooBar.sizeToFit()
        textFild.inputAccessoryView = tooBar
        
        // Create MyPickerView
        myPicker.frame = CGRect(x: 50, y: 650, width: 300, height: 100)
        myPicker.delegate = self
//        myPicker.center = view.center
        myPicker.dataSource = self
        self.view.addSubview(myPicker)
        
        
        // Create mySwitch
        self.mySwitch.frame = CGRect(x: 20, y: 350, width: 0, height: 0)
        self.view.addSubview(mySwitch)
        self.mySwitch.setOn(true, animated: true)
        if self.mySwitch.isOn {
            textFild.frame = CGRect(x: 100, y: 450, width: 200, height: 50)
        }else {
            textFild.frame = CGRect(x: 100, y: 450, width: 200, height: 0)
        }
        
        view.backgroundColor = .darkGray
        
        
        self.imageView.image = self.imagArrey[0]
        self.imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        self.view.addSubview(self.imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let topAnchor = imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        let bottomAnchor = imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -500)
        let leftAnchor = imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        let rightAnchor = imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        
        topAnchor.isActive = true
        bottomAnchor.isActive = true
        leftAnchor.isActive = true
        rightAnchor.isActive = true
        
        
        self.segmentControll = UISegmentedControl(items: self.menuArrey)
        self.segmentControll.frame = CGRect(x: 100, y: 350, width: 200, height: 30)
        self.view.addSubview(self.segmentControll)
        
        
        
        errorButton.setTitle("Error", for: .normal)
        errorButton.layer.cornerRadius = 10
        errorButton.backgroundColor = .black
        self.errorButton.frame = CGRect(x: 100, y: 400, width: 200, height: 30)
        self.view.addSubview(errorButton)
        errorButton.setImage(UIImage(systemName: "folder"), for: .normal)
        
        
        //        Add textFild parameters
        //        textFild.frame = CGRect(x: 100, y: 450, width: 200, height: 50)
        textFild.layer.cornerRadius = 10
        textFild.backgroundColor = .white
        textFild.placeholder = "hello"
        textFild.clearButtonMode = UITextField.ViewMode.whileEditing
        textFild.textAlignment = .center
        self.textFild.resignFirstResponder()
        textFild.keyboardType = .phonePad
        
        
        
        //        textFild.UITextInputTraits =
        
        self.view.addSubview(self.textFild)
        
        errorButton.addTarget(self, action: #selector(showButton), for: .touchUpInside)
        
        segmentControll.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
        
        self.mySwitch.addTarget(self, action: #selector(changeMySwith), for: .valueChanged)
        
        
    }
    @objc func changeMySwith(){
        if self.mySwitch.isOn {
            textFild.frame = CGRect(x: 100, y: 450, width: 200, height: 50)
            textFild.textColor = .black
            
        }else {
            textFild.frame = CGRect(x: 100, y: 450, width: 200, height: 0)
            textFild.textColor = view.backgroundColor
        }
    }
    
    @objc func donePressed () {
        textFild.resignFirstResponder()
    }
    
    @objc func showButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Error", message: "Hello, it's error", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .cancel ) { (action) in
            //            self.view.backgroundColor = .white
            
            let text = alertController.textFields?.first?.text
            self.textFild.text = text
            print(text ?? "nil text !")
        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @objc func selectedValue(target: UISegmentedControl){
        if target == self.segmentControll{
            
            let segmentedIndex = target.selectedSegmentIndex
            self.imageView.image = self.imagArrey[segmentedIndex]
            self.imageView.layer.cornerRadius = 30
            imageView.clipsToBounds = true
            
        }
        
        switch segmentControll.selectedSegmentIndex {
        case 0:
            view.backgroundColor = .red
        case 1:
            view.backgroundColor = .green
        case 2:
            view.backgroundColor = .blue
        default:
            view.backgroundColor = .purple
            
        }
    }
}


extension   ViewController: UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return myModel.marks.count
        case 1:
            return myModel.modelsByMark.count
        default:
            return 0;
        }
    }
    
 
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            let marka = myModel.marks[row]
            return marka.name
        } else {
            let model = myModel.modelsByMark[row]
            return model.name
            
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            
            let marka = myModel.marks[row]
            selectedMarka = marka
            myModel.modelsByMark = myModel.getModels(markaId: marka.id)
            pickerView.reloadComponent(1)
            pickerView.selectRow(0, inComponent: 1, animated: true)
            
            let model = self.myModel.modelsByMark[0]
            selectedModel = model
            
            if let marka = selectedMarka, let model = selectedModel {
                lebleData.text = "\(marka.name) \(model.name)"
            }
        } else {
            let model =  self.myModel.modelsByMark[row]
            selectedModel = model
            if let marka = selectedMarka, let model = selectedModel {
                lebleData.text = "\(marka.name) \(model.name)"
            }
        }
    }
}
