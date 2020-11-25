//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by 김태훈 on 2020/11/25.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "더 먹어~!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if bmiValue >= 18.5, bmiValue <= 24.9{
            bmi = BMI(value: bmiValue, advice: "유지하자!!", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "적당히 먹자..", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        }
    }
    
    func getBMIValue() -> String {
//        if let bmiValue = bmiValue{
//            return String(format: "%.1f", bmiValue.value)
//        } else {
//            return "0.0"
//        }
        let bmiValue = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiValue
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? " "
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.clear
    }
}
