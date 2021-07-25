//
//  calculatorViewController.swift
//  tipsyAppIOS
//
//  Created by chekir walid on 25/7/2021.
//

import UIKit

class calculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var tip = 0.10
    var numberOfPeople = 2
    var finalResult = "0.0"
    var calculatorBrain = CalculatorBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        sender.tintColor = #colorLiteral(red: 0, green: 0.6836206317, blue: 0, alpha: 1)
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        tip = Double(buttonTitleMinusPercentSign)! / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if billTextField.text! != "" {
            let totalBill = Double(billTextField.text!)!
            let setting = "Split between 2 people, with \(Int(tip * 100))% tip."
            calculatorBrain.calculateTipsy(totalBill: totalBill, tip: tip, numberOfPeople: numberOfPeople, setting: setting)
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! resultViewController
            destinationVC.total = calculatorBrain.tipsy?.result
            destinationVC.setting = calculatorBrain.tipsy?.setting
        }
    }
}
