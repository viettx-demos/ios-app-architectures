//
//  NumberVC.swift
//  NumberCounterMVVM
//
//  Created by Tran Viet on 10/15/17.
//  Copyright © 2017 Tran Viet. All rights reserved.
//

import UIKit

class NumberVC: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var decreaseButton: UIButton!
    
    private let numberViewModel = NumberViewModel(number: 3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Listen data stream from View Model
        numberViewModel.numberString?.bindAndFire(hdl: { [weak self] (text) in
            guard let `self` = self else { return }
            self.numberLabel.text = text
        })
        
        numberViewModel.decreaseEnabled?.bindAndFire(hdl: { [weak self] (enabled) in
            guard let `self` = self else { return }
            self.decreaseButton.isEnabled = enabled
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func decreaseAction(_ sender: UIButton) {
        self.numberViewModel.decreaseNumber()
    }
    
    @IBAction func increaseAction(_ sender: UIButton) {
        self.numberViewModel.increaseNumber()
    }
}

