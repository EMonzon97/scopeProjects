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
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
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
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
}

