//
//  ViewController.swift
//  MAP18_CelsiusConverter
//
//  Created by David Svensson on 2019-03-01.
//  Copyright © 2019 David Svensson. All rights reserved.
//

import UIKit
//import Foundation

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var tempratureLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    private let userDefaultsRowKey = "defaultPickerRow"
    
    private var temperatureValues = (-100...100).map{$0 * -1} //[Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultRow = initialPickerRow() //temperatureValues.count / 2
        
        pickerView.selectRow(defaultRow, inComponent: 0, animated: false)
        pickerView(pickerView, didSelectRow: defaultRow, inComponent: 0)
        
//        for index in -100...100 {
//            temperatureValues.append(index)
//        }
        
    }
    
    func initialPickerRow() -> Int {
        let savedRow = UserDefaults.standard.object(forKey: userDefaultsRowKey) as? Int

        if let saved = savedRow {
            return saved
        }
        
        return temperatureValues.count / 2
        
//        if savedRow == nil {
//            return temperatureValues.count / 2
//        }
//
//        return savedRow
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
        
        tempratureLabel.text = String(Int(round(fahrenheit)))
        
        saveSelected(row: row)
        
    }
    
    func saveSelected(row: Int) {
        let defaults = UserDefaults.standard
        
        defaults.set(row, forKey: userDefaultsRowKey)
        defaults.synchronize()
    }
    
   
}

