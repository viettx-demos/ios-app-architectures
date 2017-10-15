//
//  NumberViewModel.swift
//  NumberCounterMVVM
//
//  Created by Tran Viet on 10/15/17.
//  Copyright © 2017 Tran Viet. All rights reserved.
//

import Foundation

class NumberViewModel {
    private var numberModel:NumberModel?
    var numberString:DataBinding<String>?
    var decreaseEnabled:DataBinding<Bool>?
    
    init(number:Int) {
        self.numberModel = NumberModel(value: number)
        
        self.numberString = DataBinding(value: formatNumber(number: number))
        self.decreaseEnabled = DataBinding(value: number > 0)
    }
    
    func increaseNumber() {
        guard let numberModel = self.numberModel else { return }
        numberModel.setValue(value: numberModel.getValue() + 1)
        
        self.updateViewWithFireEvents()
    }
    
    func decreaseNumber() {
        guard let numberModel = self.numberModel else { return }
        
        let currentValue = numberModel.getValue()
        if currentValue <= 0 { return }
        
        numberModel.setValue(value: currentValue - 1)
        
        self.updateViewWithFireEvents()
    }
    
    private func formatNumber(number:Int) -> String {
        return String(format: "%02d", arguments: [number])
    }
    
    private func updateViewWithFireEvents() {
        guard   let numberModel = self.numberModel else { return }
        
        let currentValue = numberModel.getValue()
        let text = formatNumber(number: currentValue)
        
        // Fire event
        self.numberString?.value = text
        self.decreaseEnabled?.value = currentValue > 0
    }
}
