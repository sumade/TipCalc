//
//  ViewController.swift
//  tips
//
//  Created by Sumeet Shendrikar on 9/13/15.
//  Copyright (c) 2015 Sumeet Shendrikar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
//        tipPctSliderLabel.text = "\(Int(round(tipPctSlider.value)))%"
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultPct = defaults.integerForKey("TipCalculator.DefaultPercentage");
        tipPctSliderLabel.text = "\(defaultPct)%"
        tipPctSlider.value = Float(defaultPct)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var tipAmountSelector: UISegmentedControl!
    
    var tipAmountPct:Double = 0.18
    
    @IBAction func tipAmountChanged(sender: AnyObject) {
//        println("tipAmount selector \(tipAmountSelector.selectedSegmentIndex)")
        switch tipAmountSelector.selectedSegmentIndex {
        case 0:
            tipAmountPct = 0.18
        case 1:
            tipAmountPct = 0.20
        case 2:
            tipAmountPct = 0.25
        case UISegmentedControlNoSegment:
            println("no segment selected!")
            fallthrough
        default:
            tipAmountPct = 0.18
        }
        updateFieldsOld()
    }
    
    func updateFieldsOld() {
        var billAmount = (billField.text as NSString).doubleValue
        //        println("user entered \(billAmount)")
        var tipAmount = billAmount * tipAmountPct
        tipLabel.text = String(format: "$%.2f",
            tipAmount)
        totalLabel.text = String(format: "$%.2f", (billAmount + tipAmount))
    }
    
    
    @IBOutlet weak var tipPctSliderLabel: UILabel!
    
    @IBOutlet weak var tipPctSlider: UISlider!
    
    @IBAction func onTipPctSliderChanged(sender: AnyObject) {
            tipPctSliderLabel.text = "\(Int(round(tipPctSlider.value)))%"
        updateFields()
    }
    
    func updateFields() {
        var billAmount = (billField.text as NSString).doubleValue
        var tipAmount = billAmount * (Double)(round(tipPctSlider.value)/100.0)
        tipLabel.text = String(format: "$%.2f",
            tipAmount)
        totalLabel.text = String(format: "$%.2f", (billAmount + tipAmount))
    }
    
    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
 //       println("user editing bill")
        updateFields()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    
    @IBAction func defaultButtonPushed(sender: AnyObject) {
//        println("default button pushed")
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultPct = defaults.integerForKey("TipCalculator.DefaultPercentage");
        tipPctSliderLabel.text = "\(defaultPct)%"
        tipPctSlider.value = Float(defaultPct)
        updateFields()
    }
}

