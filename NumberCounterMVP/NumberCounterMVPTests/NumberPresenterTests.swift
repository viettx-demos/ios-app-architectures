//
//  NumberCounterMVPTests.swift
//  NumberCounterMVPTests
//
//  Created by Tran Viet on 10/15/17.
//  Copyright © 2017 Tran Viet. All rights reserved.
//

import XCTest
@testable import NumberCounterMVP

class NumberViewMock:NumberView {
    var textValue = ""
    var descreaseEnabled = true
    
    func setTextNumber(text: String) {
        self.textValue = text
    }
    
    func updateDecreaseControl(enabled: Bool) {
        self.descreaseEnabled = enabled
    }
}

class NumberPresenterTests: XCTestCase {
    
    var numberModel:NumberModel!
    var numberPresenter:NumberPresenter!
    var numberViewMock = NumberViewMock()
    
    override func setUp() {
        super.setUp()
        
        self.numberModel = NumberModel(value: 10)
        self.numberPresenter = NumberPresenter(model: numberModel)
        self.numberPresenter.attach(view: numberViewMock)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitValueMustBeTen() {
        XCTAssert(numberViewMock.textValue == "10", "Init number is not \"10\".")
    }
    
    func testIncreaseNumber() {
        self.numberPresenter.increaseNumber()
        
        XCTAssert(numberViewMock.textValue == "11", "Number is not \"11\" after increased.")
    }
    
    func testDecreaseNumber() {
        self.numberPresenter.decreaseNumber()
        
        XCTAssert(numberViewMock.textValue == "09", "Number is not \"09\" after decreased.")
    }
    
    func testDecreaseDisableWhenNumberIsZero() {
        for _ in 1...10 {
            self.numberPresenter.decreaseNumber()
        }
        
        XCTAssert(numberViewMock.descreaseEnabled == false, "Decrease control still enabled when number is 0.")
    }
}
