//
//  SettingsViewController.swift
//  tippy
//
//  Created by Prashanth Janagama on 3/13/17.
//  Copyright © 2017 Prashanth Janagama. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var tip1Label: UILabel!
    @IBOutlet weak var tip2Label: UILabel!
   
    @IBOutlet weak var tip3Label: UILabel!
    
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var slider3: UISlider!
    
    
    let pref = UserDefaults.standard
    
    

    
    @IBAction func slider1ValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        tip1Label.text = "\(currentValue)"
        pref.set(currentValue, forKey: "tip1setting")
        slider1.value = Float(currentValue)
        pref.synchronize()
    }
    
    
    @IBAction func slider2ValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        tip2Label.text = "\(currentValue)"
        pref.set(currentValue, forKey: "tip2setting")
        slider2.value = Float(currentValue)
        pref.synchronize()
    }

    @IBAction func slider3ValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        tip3Label.text = "\(currentValue)"
        pref.set(currentValue, forKey: "tip3setting")
        slider3.value = Float(currentValue)
        pref.synchronize()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        slider1.value = pref.float(forKey: "tip1setting")
        slider2.value = pref.float(forKey: "tip2setting")
        slider3.value = pref.float(forKey: "tip3setting")
        
        tip1Label.text = String(slider1.value)
        tip2Label.text = String(slider2.value)
        tip3Label.text = String(slider3.value)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

  





}
