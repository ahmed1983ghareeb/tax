//
//  ViewController.swift
//  tax
//
//  Created by Ahmed Ghareeb on 2019-06-06.
//  Copyright © 2019 Ahmed Ghareeb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var provincePicker: UIPickerView!
    @IBOutlet weak var provienceTextField: SalaryText!
    @IBOutlet weak var salaryTextField: SalaryText!
    
    @IBOutlet weak var taxLabel: TaxLabel!
    
    var provinces = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textButton = TaxButton(frame: CGRect(x: 0, y: 0, width: view!.frame.size.width, height: 50 ))
        textButton.addTarget(self, action: #selector(ViewController.calculateTax), for: .touchUpInside)
        textButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        textButton.setTitle("Calculate Tax", for: .normal)
        
        salaryTextField.inputAccessoryView = textButton
        provienceTextField.inputAccessoryView = textButton
        
        provinces = ["Quebec","Ontario","Fedral"]
        
        provincePicker.dataSource = self
        provincePicker.delegate = self
    }

    @objc func calculateTax(){
        let salary  = Double(salaryTextField.text ?? "0.0")
        
        switch provienceTextField.text?.lowercased(){
        case "quebec":
             taxLabel.text = "Total tax = \(String( quebecTaxCalculator(salary: salary!) ))$"
            break
       
        case "ontario":
           taxLabel.text = "Total tax = \(String ( ontarioTaxCalculator(salary: salary!) ))$"
            break
        // Set the enum
        default:
            break
            // Set the enum
        }
        
        view.endEditing(true)
    }
    
    func quebecTaxCalculator(salary: Double) -> Double{
        switch salary {
        case 0 ... 43055:
            return  salary * 0.15
        case 43055.01 ... 86105:
            return salary * 0.20
        case 86105.01 ... 104765:
            return salary * 0.24
        case 104765.01... :
            return salary * 0.2575
        default:
            return 0
        }
    }
    
    func ontarioTaxCalculator(salary: Double) -> Double{
        switch salary {
            //10 582,01$ to 43 906$
        case 10582  ... 43906:
            return  salary * 0.0505
            //43 906.01$ to 87 813$
        case 43906.01 ... 87813:
            return salary * 0.0915
            //87 813.01$ to 150 000$
        case 87813.01 ... 150000:
            return salary * 0.1116
            //150 000,01$ to 220 000$
        case 150000.01 ... 220000 :
            return salary * 0.1216
        case 220000.01... :
            return salary * 0.1316
        default:
            return 0
        }
    }
    
    

}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //number of columns = numberOfComponents
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return provinces.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return provinces[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //action when user select something
        
        provienceTextField.text = provinces[row]
    }
    
    
}

