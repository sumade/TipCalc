//
//  SettingsViewController.swift
//  tips
//
//  Created by Sumeet Shendrikar on 9/13/15.
//  Copyright (c) 2015 Sumeet Shendrikar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var defaults = NSUserDefaults.standardUserDefaults()
        let defaultPct = defaults.integerForKey("TipCalculator.DefaultPercentage")
        defaultPctField.text = "\(defaultPct)"
        
        closeButton.layer.borderColor = UIColor.blackColor().CGColor
        closeButton.layer.borderWidth = 1
        closeButton.layer.cornerRadius = 2
        closeButton.titleEdgeInsets  = UIEdgeInsetsMake(0.5, 0.5, 0.5, 0.5)
        closeButton.layer.backgroundColor = UIColor.darkGrayColor().CGColor
        closeButton.setTitleColor(UIColor.whiteColor(),
            forState: UIControlState.Normal)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var defaultPctField: UITextField!
    
    @IBOutlet weak var closeButton: UIButton!
    
    @IBAction func pctFieldChanged(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        var tipPct = (defaultPctField.text as NSString).integerValue
        defaults.setInteger(tipPct, forKey: "TipCalculator.DefaultPercentage")
        defaults.synchronize()
    }
    
    
    @IBAction func saveSettingsAction(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
