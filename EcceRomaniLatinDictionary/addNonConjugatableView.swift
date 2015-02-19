//
//  addNonConjugatableView.swift
//  LatinLanguageHelper
//
//  Created by Josh Kallus on 12/31/14.
//  Copyright (c) 2014 JMKLABS. All rights reserved.
//

import UIKit

protocol addNonConjugatableViewDelegate: class {
    
}

class addNonConjugatableView: UIView, UITextFieldDelegate {

    @IBOutlet weak var latinTextField: UITextField!
    @IBOutlet weak var englishTextField: UITextField!
    
    @IBOutlet var view: UIView!
 
    var delegate: addVerbViewDelegate?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NSBundle.mainBundle().loadNibNamed("addNonConjugatableView", owner: self, options: nil)
        self.addSubview(self.view)
    }

    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        latinTextField.endEditing(true)
        englishTextField.endEditing(true)
    }
    
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        textField.resignFirstResponder()
        return true
    }
}
