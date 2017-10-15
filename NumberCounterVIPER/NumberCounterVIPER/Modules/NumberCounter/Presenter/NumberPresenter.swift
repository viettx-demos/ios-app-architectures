//
//  NumberPresenter.swift
//  NumberCounterVIPER
//
//  Created by Tran Viet on 10/15/17.
//  Copyright © 2017 Tran Viet. All rights reserved.
//

import Foundation

class NumberPresenter: NumberPresenterProtocol, NumberInteractorOutput {
    
    weak var numberView:NumberView?
    weak var numberInteractor:NumberInteractorInput?
    var numberWireframe:NumberWireframe? // not use in this project
    
    // Adopt NumberPresenterProtocol
    func increase() {
        self.numberInteractor?.increase()
    }
    
    func decrease() {
        self.numberInteractor?.decrease()
    }
    
    func getNumber() {
        self.numberInteractor?.getCurrentValue()
    }
    
    private func format(number:Int) -> String {
        return String(format: "%02d", arguments: [number])
    }
    
    // Adopt NumberInteractorOutput
    func setNumber(number: Int) {
        let text = format(number: number)
        
        self.numberView?.setTextNumber(text: text)
        self.numberView?.updateDecreaseControl(enabled: number > 0)
    }
}
