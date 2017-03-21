//
//  ViewController.swift
//  tippy
//
//  Created by Prashanth Janagama on 3/13/17.
//  Copyright © 2017 Prashanth Janagama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    
    
     let pref = UserDefaults.standard
    
    
    var tipPercentages: [Double] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
      }

    @IBAction func calculateTip(_ sender: Any) {
        
       
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        print(tipPercentages[tipControl.selectedSegmentIndex])
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pref.synchronize();
        print("view will appear")
        print("settings ", pref.dictionaryWithValues(forKeys: ["tip1setting","tip2setting", "tip3setting"]))
        let tip1Setting = (pref.double(forKey: "tip1setting"))
        let tip2Setting = (pref.double(forKey: "tip2setting"))
        let tip3Setting = (pref.double(forKey: "tip3setting"))
        tipPercentages = []
        tipPercentages.append(tip1Setting/100.0)
        tipPercentages.append(tip2Setting/100.0)
        tipPercentages.append(tip3Setting/100.0)
        tipControl.setTitle(String(tip1Setting)+"%", forSegmentAt: 0)
        tipControl.setTitle(String(tip2Setting)+"%", forSegmentAt: 1)
        tipControl.setTitle(String(tip3Setting)+"%", forSegmentAt: 2)
        
        calculateTip(billField)
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
}

