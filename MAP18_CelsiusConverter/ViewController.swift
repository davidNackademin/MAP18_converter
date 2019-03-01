//
//  ViewController.swift
//  MAP18_CelsiusConverter
//
//  Created by David Svensson on 2019-03-01.
//  Copyright © 2019 David Svensson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    private var temperatureValues = (-100...100).map{$0} //[Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        for index in -100...100 {
//            temperatureValues.append(index)
//        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
       // print("row: \(row)")
        return "\(temperatureValues[row]) C"
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return temperatureValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let celsius = Double(temperatureValues[row])
        
        let fahrenheit = celsius * 1.8 + 32.0
        
        print("celsius: \(celsius)  = fahrenheit: \(fahrenheit) ")
    }
   
}

