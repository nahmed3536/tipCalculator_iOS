//
//  ViewController.swift
//  tips
//
//  Created by Nabib Ahmed on 9/11/20.
//  Copyright © 2020 CodePath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var currencyControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        // print("Hello")
        view.endEditing(true)
    }
    
    @IBAction func convertCurrency(_ sender: Any) {
        // Get the bill amount
        let bill = Double(billField.text!) ?? 0
        let tipAmount = tipControl.selectedSegmentIndex
        
        // Calculate the conversion
        let conversion = [1.25, 0.80]
        let tipPercentage = [0.15, 0.18, 0.20]
        
        let convertedBill = bill * conversion[currencyControl.selectedSegmentIndex]
        let converedTip = convertedBill * tipPercentage[tipAmount]
        let convertedTotal = convertedBill + converedTip
        
        // Update the tip and total labels
        billField.text = String(format: "%.2f", convertedBill)
        tipLabel.text = String(format: "$%.2f", converedTip)
        totalLabel.text = String(format: "$%.2f", convertedTotal)
        
    }
    @IBAction func calculateTip(_ sender: Any) {
        // Get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        // Calculate the tip and total
        let tipPercentage = [0.15, 0.18, 0.20]
        
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
}

