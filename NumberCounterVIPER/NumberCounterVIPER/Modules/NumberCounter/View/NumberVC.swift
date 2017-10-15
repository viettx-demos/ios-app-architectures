//
//  NumberVC.swift
//  NumberCounterVIPER
//
//  Created by Tran Viet on 10/15/17.
//  Copyright © 2017 Tran Viet. All rights reserved.
//

import UIKit

class NumberVC: UIViewController, NumberView {

    static let identifier = "numberVC"
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var decreaseButton: UIButton!
    
    var numberPresenter:NumberPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.numberPresenter?.getNumber()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func decreaseAction(_ sender: UIButton) {
        self.numberPresenter?.decrease()
    }
    
    @IBAction func increaseAction(_ sender: UIButton) {
        self.numberPresenter?.increase()
    }
    
    // Adopt NumberView
    func setTextNumber(text: String) {
        self.numberLabel.text = text
    }
    
    func updateDecreaseControl(enabled: Bool) {
        self.decreaseButton.isEnabled = enabled
    }
}

