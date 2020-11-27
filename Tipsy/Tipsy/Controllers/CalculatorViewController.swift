//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var pct: Double = 0.0
    var people: Double = 2
    var result: String = ""
    let segueIdentifier = "goToResultVC"

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        pct = Double(sender.currentTitle!.dropLast())! / 100.0
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        self.splitNumberLabel.text = Int(sender.value).description
        people = sender.value
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        if bill != "" {
            result = String(format: "%.2f", (Double(bill)! * (1 + pct)) / Double(people))
            print(result)
        }
        
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == segueIdentifier{
            if let resultVC = segue.destination as? ResultViewController {
                resultVC.result = result
                resultVC.pct = Int(pct * 100)
                resultVC.people = people
            }
        }
        
    }
    

}

