//
//  AddNounTableViewController.swift
//  EcceRomaniLatinDictionary
//
//  Created by Josh Kallus on 2/19/15.
//  Copyright (c) 2015 JMKLABS. All rights reserved.
//

import UIKit

protocol AddNounDelegate: class{
    func nounInfoEntered(noun: Noun)
}


class AddNounTableViewController: UITableViewController {

    var newNoun: Noun?
    
    var delegate:AddNounDelegate? = nil
    
    var gender: String?
    var declension: Int?
    
    @IBOutlet weak var nominativeSingularTextField: UITextField!
    @IBOutlet weak var genitiveSingularTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBAction func genderChanged(sender: UISegmentedControl) {
        setGender()
    }
    @IBOutlet weak var definitionTextField: UITextField!
    @IBOutlet weak var declensionSegmentedControl: UISegmentedControl!
    @IBAction func declensionChanged(sender: UISegmentedControl) {
        setDeclension()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGender()
        setDeclension()
        
        self.delegate = ((self.presentingViewController as UITabBarController).viewControllers![0] as UINavigationController).viewControllers[0] as WordListTableViewController

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setGender(){
        gender = genderSegmentedControl.titleForSegmentAtIndex(genderSegmentedControl.selectedSegmentIndex)
    }
    
    func setDeclension(){
        declension = declensionSegmentedControl.titleForSegmentAtIndex(declensionSegmentedControl.selectedSegmentIndex)!.toInt()
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        var shouldReturn: Bool
        if identifier == "nounSaveSegue"{
            if nominativeSingularTextField.text.isEmpty  || genitiveSingularTextField.text.isEmpty || definitionTextField.text.isEmpty{
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
        if segue.identifier == "nounSaveSegue"{
            newNoun = Noun(NominativeSingularInput: nominativeSingularTextField.text, GenitiveSingularInput: genitiveSingularTextField.text, GenderInput: gender!, DefinitionInput: definitionTextField.text, DeclensionInput: declension!)
            if delegate != nil{
                delegate!.nounInfoEntered(newNoun!)
            }
        }
    }
}