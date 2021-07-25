//
//  CalculatorBrain.swift
//  tipsyAppIOS
//
//  Created by chekir walid on 25/7/2021.
//

import Foundation

struct  CalculatorBrain{
    var tipsy: Tipsy?
    mutating func calculateTipsy(totalBill: Double, tip: Double,numberOfPeople: Int,setting: String){
        let result = totalBill * (1 + tip) / Double(numberOfPeople)
        tipsy = Tipsy(result: String(format: "%.2f", result), setting: setting)
    }
    
    func getTipsyResult() -> String {
        return tipsy?.result ?? "0.0"
        //? if tipsy not null continue to result
        // ?? if result tipsy is nil so default value is 0.0.
    }
    
    func getTispySetting() -> String {
        return tipsy?.setting ?? ""
    }
}
