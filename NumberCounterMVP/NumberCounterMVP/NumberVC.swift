//
//  ViewController.swift
//  NumberCounterMVC
//
//  Created by Tran Viet on 10/14/17.
//  Copyright © 2017 Tran Viet. All rights reserved.
//

import UIKit

class NumberVC: UIViewController, NumberView {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var decreaseButton: UIButton!
    
    private let numberPresenter = NumberPresenter(model: NumberModel(value: 3))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.numberPresenter.attach(view: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func decreaseAction(_ sender: UIButton) {
        self.numberPresenter.decreaseNumber()
    }
    
    @IBAction func increaseAction(_ sender: UIButton) {
        self.numberPresenter.increaseNumber()
    }
    
    // Implement methods from NumberView
    func setTextNumber(text: String) {
        self.numberLabel.text = text
    }
    
    func updateDecreaseControl(enabled: Bool) {
        self.decreaseButton.isEnabled = enabled
    }
}

