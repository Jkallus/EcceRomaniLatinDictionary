//
//  addVerbView.swift
//  LatinLanguageHelper
//
//  Created by Josh Kallus on 12/31/14.
//  Copyright (c) 2014 JMKLABS. All rights reserved.
//

import UIKit

protocol addVerbViewDelegate: class {
    
}


class addVerbView: UIView {
    @IBOutlet weak var firstPrinciplePartTextField: UITextField!
    @IBOutlet weak var secondPrinciplePartTextField: UITextField!
    @IBOutlet weak var thirdPrinciplePartTextField: UITextField!
    @IBOutlet weak var fourthPrinciplePartTextField: UITextField!
    @IBOutlet weak var definitionTextField: UITextField!

    @IBOutlet var view: UIView!
    
    var delegate: addNounViewDelegate?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        NSBundle.mainBundle().loadNibNamed("addVerbView", owner: self, options: nil)
        self.addSubview(self.view)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        firstPrinciplePartTextField.endEditing(true)
        secondPrinciplePartTextField.endEditing(true)
        thirdPrinciplePartTextField.endEditing(true)
        fourthPrinciplePartTextField.endEditing(true)
        definitionTextField.endEditing(true)
    }
    
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        textField.resignFirstResponder()
        return true
    }

}
