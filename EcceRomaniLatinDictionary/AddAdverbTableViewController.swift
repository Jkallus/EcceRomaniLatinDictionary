//
//  AddAdverbTableViewController.swift
//  EcceRomaniLatinDictionary
//
//  Created by Josh Kallus on 2/19/15.
//  Copyright (c) 2015 JMKLABS. All rights reserved.
//

import UIKit

protocol AddAdverbDelegate: class{
    func adverbInfoEntered(NonConjugatable: nonConjugatable)
}

class AddAdverbTableViewController: UITableViewController {
    
    @IBOutlet weak var latinTextField: UITextField!
    @IBOutlet weak var englishTextField: UITextField!
    
    var newNonConjugatable: nonConjugatable?
    
    var delegate: AddAdverbDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = ((self.presentingViewController as UITabBarController).viewControllers![0] as UINavigationController).viewControllers[0] as WordListTableViewController
        //self.delegate = self.presentingViewController! as WordListTableViewController
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        var shouldReturn: Bool
        if identifier == "advebSaveSegue"{
            if latinTextField.text.isEmpty || englishTextField.text.isEmpty {
                shouldReturn = false
            }
            else{
                shouldReturn = true
            }
        }
        else{
            shouldReturn = true
        }
        
        return shouldReturn
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "adverbSaveSegue"{
            newNonConjugatable = nonConjugatable(latinFormInput: latinTextField.text, englishFormInput: englishTextField.text)
            if delegate != nil{
                delegate!.adverbInfoEntered(newNonConjugatable!)
            }
        }
        
    }
}