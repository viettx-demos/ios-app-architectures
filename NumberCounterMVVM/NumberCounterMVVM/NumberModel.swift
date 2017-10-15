//
//  NumberModel.swift
//  NumberCounterMVVM
//
//  Created by Tran Viet on 10/15/17.
//  Copyright © 2017 Tran Viet. All rights reserved.
//

import Foundation

class NumberModel {
    private var value:Int = 0
    
    init(value:Int) {
        self.value = value
    }
    
    func getValue() -> Int {
        return self.value
    }
    
    func setValue(value:Int) {
        self.value = value
    }
}
