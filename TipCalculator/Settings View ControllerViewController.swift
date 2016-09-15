//
//  Settings View ControllerViewController.swift
//  TipCalculator
//
//  Created by Student on 9/15/16.
//  Copyright © 2016 Eliseo Monzon. All rights reserved.
//

import UIKit

class Settings_View_ControllerViewController: UIViewController {

    @IBOutlet weak var defaultTipSetter: UISegmentedControl!
    
    
    
    @IBOutlet weak var schemeSetter: UISegmentedControl!
    
    
    @IBOutlet weak var DTALabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func ChangeDefaultTip(sender: AnyObject) {
        
        //Record and Save Tip!
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger( defaultTipSetter.selectedSegmentIndex , forKey: "default_tip_percentage")
        defaults.synchronize()
        
        
    }
    
    @IBAction func changeTheme(sender: AnyObject) {
        
        //Record and Save Theme!
        let theme = NSUserDefaults.standardUserDefaults()
        theme.setInteger( schemeSetter.selectedSegmentIndex , forKey: "scheme")
        theme.synchronize()
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount
        
        self.view.alpha = 0
        UIView.animateWithDuration(0.4, animations: {
            // This causes first view to fade in and second view to fade out
            self.view.alpha = 1
        })
        
        //read saved selection for Tip
        let defaults = NSUserDefaults.standardUserDefaults()
        defaultTipSetter.selectedSegmentIndex = defaults.integerForKey("default_tip_percentage")
        
        //read saved selection for Theme
        let theme = NSUserDefaults.standardUserDefaults()
        schemeSetter.selectedSegmentIndex = theme.integerForKey("scheme")
        
        //Color Switch
        
        let selectedTheme = theme.integerForKey("scheme")
        
        if(selectedTheme == 0){
            self.view.backgroundColor = UIColor.whiteColor()
            DTALabel.textColor = UIColor.blackColor()
            
        }
        if(selectedTheme == 1){
            self.view.backgroundColor = UIColor.darkGrayColor()
            DTALabel.textColor = UIColor.whiteColor()
        }
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    
    
    

}
