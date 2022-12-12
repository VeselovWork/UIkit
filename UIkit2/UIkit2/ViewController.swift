//
//  ViewController.swift
//  UIkit2
//
//  Created by Andrey on 13.12.2022.
//

import UIKit

class ViewController: UIViewController {

    let myPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create MyPicker
        myPicker.center = view.center
        
        myPicker.dataSource = self
        
        self.view.addSubview(myPicker)
    }


}

extension ViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView)-> Int {
        return 1
    }
    
   
}
