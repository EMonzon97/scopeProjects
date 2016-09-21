//
//  ViewController.swift
//  TipCalculator
//
//  Created by Student on 9/13/16.
//  Copyright © 2016 Eliseo Monzon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tLabel: UILabel!
    @IBOutlet weak var t2Label: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var t3Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func OnTap(sender: AnyObject) {
        
        view.endEditing(true)
        
    
        
    }
    
    
    
    @IBAction func CalcTip(sender: AnyObject) {
        
        let tipPercent = [0.18 , 0.22, 0.25]
    
        
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercent[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        let tip2 = formatter.stringFromNumber(tip)
        let total2 = formatter.stringFromNumber(total)
        
        
        
        tipLabel.text = tip2
        totalLabel.text = total2
        
    }
    
    func CalcTipHelper() {
        let tipPercent = [0.18 , 0.22, 0.25]
        
        
        
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercent[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
    
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        let tip2 = formatter.stringFromNumber(tip)
        let total2 = formatter.stringFromNumber(total)
        
        
        
        tipLabel.text = tip2
        totalLabel.text = total2
    }
    
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    
        billField.becomeFirstResponder()
        
        
        let defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("default_tip_percentage")
        
        let saved = NSUserDefaults.standardUserDefaults()
        billField.text = String(saved.integerForKey("savedBill"))
        
        CalcTipHelper()
        
        self.view.alpha = 0
        UIView.animateWithDuration(0.4, animations: {
            // This causes first view to fade in and second view to fade out
            self.view.alpha = 1
        })
        
        //Color Switch
        
        let theme = NSUserDefaults.standardUserDefaults()
        let selectedTheme = theme.integerForKey("scheme")
        
        if(selectedTheme == 0){
            self.view.backgroundColor = UIColor.whiteColor()
            tLabel.textColor = UIColor.blackColor()
            t2Label.textColor = UIColor.blackColor()
            t3Label.textColor = UIColor.blackColor()
            tipLabel.textColor = UIColor.blackColor()
            totalLabel.textColor = UIColor.blackColor()
        }
        if(selectedTheme == 1){
            self.view.backgroundColor = UIColor.darkGrayColor()
            tLabel.textColor = UIColor.whiteColor()
            t2Label.textColor = UIColor.whiteColor()
            t3Label.textColor = UIColor.whiteColor()
            tipLabel.textColor = UIColor.whiteColor()
            totalLabel.textColor = UIColor.whiteColor()
        }
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        
        let saved = NSUserDefaults.standardUserDefaults()
        saved.setDouble( Double(billField.text!) ?? 0 , forKey: "savedBill")
        saved.synchronize()
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
        
        
    }
    
    
    
}

