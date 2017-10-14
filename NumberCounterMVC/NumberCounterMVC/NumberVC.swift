//
//  ViewController.swift
//  NumberCounterMVC
//
//  Created by Tran Viet on 10/14/17.
//  Copyright © 2017 Tran Viet. All rights reserved.
//

import UIKit
class NumberVC: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var decreaseButton: UIButton!
    
    var number:NumberModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initDataWith(val: 3)
        self.updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initDataWith(val:Int) {
        self.number = NumberModel(value: val)
    }
    
    func updateUI() {
        self.numberLabel.text = String(format: "%02d", arguments: [number.getValue()])
        self.decreaseButton.isEnabled = number.getValue() > 0
    }

    @IBAction func decreaseAction(_ sender: UIButton) {
        self.number.setValue(value: self.number.getValue() - 1)
        self.updateUI()
    }
    
    @IBAction func increaseAction(_ sender: UIButton) {
        self.number.setValue(value: self.number.getValue() + 1)
        self.updateUI()
    }
}

