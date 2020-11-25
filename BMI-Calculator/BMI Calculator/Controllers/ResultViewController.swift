//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by 김태훈 on 2020/11/25.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var value: String?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        if let bmiValue = value, let bmiAdvice = advice, let bmiColor = color {
            bmiLabel.text = value
            adviceLabel.text = advice
            self.view.backgroundColor = color
//        }
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   
    */

}
