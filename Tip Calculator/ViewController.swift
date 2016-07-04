//
//  ViewController.swift
//  Tip Calculator
//
//  Created by harshal agrawal on 7/4/16.
//  Copyright © 2016 harshal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var taxArray = ["", "", ""]
    var tipArray = [0.0, 0.1, 0.2]
    @IBOutlet weak var BillText: UITextField!
    @IBAction func SliderTaxPercent(sender: AnyObject) {
        TaxPercentageLabel.text = "Tax Percentage (\(Int(TaxSlider.value))) %"
        if BillText.text != nil {
            let amount = Double(BillText.text!)!
          //  let tip = amount/100*(Double(TaxSlider.value))
            
            
            for var i = 0; i<=2; i++ {
                let tip = amount/100*(Double(TaxSlider.value) + Double(i))
                tipArray[i] = amount + tip
            }
            var j = 0
            for var tips in tipArray {
                taxArray[j] = "\(Int(TaxSlider.value) + j)" + "%: Total:" + "\(tips)"
                j++
            }
            tableView.reloadData()
        } else {
            print("Enter a value")
        }
        
    }
    @IBOutlet weak var TaxSlider: UISlider!
    @IBOutlet weak var TaxPercentageLabel: UILabel!
   
    @IBOutlet weak var tableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        // Do any additional setup after loading the view, typically from a nib.
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return taxArray.count
    }

    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
           
           let cell = tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath)
            cell.textLabel?.text = taxArray[indexPath.row]
            print(cell.textLabel?.text)
            return cell
            
    }
  
 
    

}

