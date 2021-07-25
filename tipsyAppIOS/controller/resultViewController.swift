//
//  resultViewController.swift
//  tipsyAppIOS
//
//  Created by chekir walid on 25/7/2021.
//

import UIKit

class resultViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var total:String?
    var setting:String?//optional value
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = total
        settingsLabel.text = setting
        // Do any additional setup after loading the view.
    }

    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
