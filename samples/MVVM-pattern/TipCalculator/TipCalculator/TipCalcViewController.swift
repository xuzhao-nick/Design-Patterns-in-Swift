//
//  TipCalcViewController.swift
//  TipCalculator
//
//  Created by Nick Xu on 17/10/20.
//  Copyright © 2020 Nick Xu. All rights reserved.
//

import UIKit

class TipCalcViewController: UIViewController {

    @IBOutlet weak var totalAmount:UITextField!
    @IBOutlet weak var tipPercent: UISegmentedControl!
    @IBOutlet weak var numberOfPeople: UITextField!
    
    // result labels
    @IBOutlet weak var newTotalLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!

    var viewModel = TipCalcViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newTotalLabel.text = ""
        tipAmountLabel.text = ""
        
        totalAmount.keyboardType = .decimalPad
        numberOfPeople.keyboardType = .numberPad
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnScreen(_:)))
        view.addGestureRecognizer(tapGesture)
     
    }
    
    @objc func didTapOnScreen(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        let tipModel = Tip(totalAmount: totalAmount.text?.toDouble ?? 0.0, tipPercentage: tipPercent.titleForSegment(at: tipPercent.selectedSegmentIndex)?.toDouble ?? 0.0, numberOfPeople: numberOfPeople.text?.toDouble ?? 1.0)
        let (tipAmount, newTotal) = viewModel.calculateTip(tip: tipModel)
        newTotalLabel.text = "Total amount: \(newTotal)" +
            (tipModel.numberOfPeople > 1.0 ? " per person" : "")
        tipAmountLabel.text = "Tip amount: \(tipAmount)" +
            (tipModel.numberOfPeople > 1.0 ? " per person" : "")
    }


}
