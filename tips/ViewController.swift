//
//  ViewController.swift
//  tips
//
//  Created by Sam Huskins on 1/21/16.
//  Copyright © 2016 Sam Huskins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        /*for family: String in UIFont.familyNames()
        {
            print("\(family)")
            for names: String in UIFont.fontNamesForFamilyName(family)
            {
                print("== \(names)")
            }
        }*/
        
        //focus on input at launch
        [billField .becomeFirstResponder()]

        //set custom fonts
        tipLabel.font = UIFont(name: "Gotham-Book", size: 17)
        billField.font = UIFont(name: "Gotham-Book", size: 17)
        totalLabel.font = UIFont(name: "Gotham-Bold", size: 30)


        

    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        print("User editing bill")
        var tipPercentages = [0.1, 0.15, 0.2]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

        
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

