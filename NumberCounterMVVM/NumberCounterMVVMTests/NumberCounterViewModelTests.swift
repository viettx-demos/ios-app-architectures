//
//  NumberCounterViewModelTests.swift
//  NumberCounterViewModelTests
//
//  Created by Tran Viet on 10/15/17.
//  Copyright © 2017 Tran Viet. All rights reserved.
//

import XCTest
@testable import NumberCounterMVVM

class NumberViewMock {
    var textValue = ""
    var descreaseEnabled = true
    
    init(viewModel:NumberViewModel) {
        viewModel.numberString?.bindAndFire(hdl: { [unowned self] (text) in
            self.textValue = text
        })
        
        viewModel.decreaseEnabled?.bindAndFire(hdl: { [unowned self] (enabled) in
            self.descreaseEnabled = enabled
        })
    }
}

class NumberCounterViewModelTests: XCTestCase {
    
    var numberViewModel:NumberViewModel!
    var numberViewMock:NumberViewMock!
    
    override func setUp() {
        super.setUp()
        
        self.numberViewModel = NumberViewModel(number: 10)
        self.numberViewMock = NumberViewMock(viewModel: self.numberViewModel)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitValueMustBeTen() {
        XCTAssert(numberViewMock.textValue == "10", "Init number is not \"10\".")
    }
    
    func testIncreaseNumber() {
        self.numberViewModel.increaseNumber()
        
        XCTAssert(numberViewMock.textValue == "11", "Number is not \"11\" after increased.")
    }
    
    func testDecreaseNumber() {
        self.numberViewModel.decreaseNumber()
        
        XCTAssert(numberViewMock.textValue == "09", "Number is not \"09\" after decreased.")
    }
    
    func testDecreaseDisableWhenNumberIsZero() {
        for _ in 1...10 {
            self.numberViewModel.decreaseNumber()
        }
        
        XCTAssert(numberViewMock.descreaseEnabled == false, "Decrease control still enabled when number is 0.")
    }
}
