//
//  addNounView.swift
//  LatinLanguageHelper
//
//  Created by Josh Kallus on 12/31/14.
//  Copyright (c) 2014 JMKLABS. All rights reserved.
//

import UIKit


protocol addNounViewDelegate: class {
    
}


class addNounView: UIView {
    
    @IBOutlet weak var nominativeSingularTextField: UITextField!
    @IBOutlet weak var genitiveSingularTextField: UITextField!
    @IBOutlet weak var genderController: UISegmentedControl!
    @IBOutlet weak var definitionTextField: UITextField!
    @IBOutlet weak var declensionController: UISegmentedControl!

    var delegate: addNounViewDelegate?
    
    
    @IBOutlet var view: addNounView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        NSBundle.mainBundle().loadNibNamed("addNounView", owner: self, options: nil)
        self.addSubview(self.view)
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        nominativeSingularTextField.endEditing(true)
        genitiveSingularTextField.endEditing(true)
        definitionTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        textField.resignFirstResponder()
        return true
    }

}
