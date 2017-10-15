//
//  NumberInteractorIO.swift
//  NumberCounterVIPER
//
//  Created by Tran Viet on 10/15/17.
//  Copyright © 2017 Tran Viet. All rights reserved.
//

import Foundation

protocol NumberInteractorInput:class {
    func increase()
    func decrease()
    func getCurrentValue()
}

protocol NumberInteractorOutput:class {
    func setNumber(number:Int)
}
