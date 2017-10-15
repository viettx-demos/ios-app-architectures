//
//  WireFrame.swift
//  NumberCounterVIPER
//
//  Created by Tran Viet on 10/15/17.
//  Copyright © 2017 Tran Viet. All rights reserved.
//

import UIKit

class NumberWireframe {
    
    var interactor:NumberInteractor!
    var presenter:NumberPresenter!
    
    func getModule(initNumber numb:Int) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: NumberVC.identifier) as! NumberVC
        let entity = NumberEntity(value: 3)
        let presenter = NumberPresenter()
        let interactor = NumberInteractor(entity: entity)
        
        view.numberPresenter = presenter
        presenter.numberView = view
        interactor.numberPresenter = presenter
        presenter.numberInteractor = interactor
        presenter.numberWireframe = self
        
        self.interactor = interactor
        self.presenter = presenter
        
        return view
    }
}
