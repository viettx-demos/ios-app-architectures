//
//  NumberPresenter.swift
//  NumberCounterMVP
//
//  Created by Tran Viet on 10/14/17.
//  Copyright © 2017 Tran Viet. All rights reserved.
//

import Foundation

class NumberPresenter {
    private var numberModel:NumberModel?
    private weak var numberView:NumberView?
    
    init(model:NumberModel) {
        self.numberModel = model
    }
    
    func attach(view:NumberView) {
        self.numberView = view
        
        updateView()
    }
    
    func increaseNumber() {
        guard let numberModel = self.numberModel else { return }
        numberModel.setValue(value: numberModel.getValue() + 1)
        
        self.updateView()
    }
    
    func decreaseNumber() {
        guard let numberModel = self.numberModel else { return }
        
        let currentValue = numberModel.getValue()
        if currentValue <= 0 { return }
        
        numberModel.setValue(value: currentValue - 1)
        
        self.updateView()
    }
    
    private func updateView() {
        guard   let numberModel = self.numberModel,
                let numberView = self.numberView
        else { return }
        
        let text = String(format: "%02d", arguments: [numberModel.getValue()])
        numberView.setTextNumber(text: text)
        
        numberView.updateDecreaseControl(enabled: numberModel.getValue() > 0)
    }
}
