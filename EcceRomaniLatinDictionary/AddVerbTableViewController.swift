////
////  AddVerbTableViewController.swift
////  EcceRomaniLatinDictionary
////
////  Created by Josh Kallus on 2/19/15.
////  Copyright (c) 2015 JMKLABS. All rights reserved.
////
//
//import UIKit
//
//protocol AddVerbDelegate: class{
//    func verbInfoEntered(verb: Verb)
//}
//
//class AddVerbTableViewController: UITableViewController {
//
//    @IBOutlet weak var firstPrinciplePartTextField: UITextField!
//    @IBOutlet weak var secondPrinciplePartTextField: UITextField!
//    @IBOutlet weak var thirdPrinciplePartTextField: UITextField!
//    @IBOutlet weak var fourthPrinciplePartTextField: UITextField!
//    @IBOutlet weak var definitionTextField: UITextField!
//    
//    var newVerb: Verb?
//    
//    var delegate:AddVerbDelegate? = nil
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        
//        self.delegate = ((self.presentingViewController as! UITabBarController).viewControllers![0] as! UINavigationController).viewControllers[0] as! WordListTableViewController
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
//        var shouldReturn: Bool
//        if identifier == "verbSaveSegue"{
//            if firstPrinciplePartTextField.text.isEmpty || secondPrinciplePartTextField.text.isEmpty || thirdPrinciplePartTextField.text.isEmpty || fourthPrinciplePartTextField.text.isEmpty || definitionTextField.text.isEmpty{
//                shouldReturn = false
//            }
//            else{
//                shouldReturn = true
//            }
//        }
//        else{
//            shouldReturn = true
//        }
//        
//        return shouldReturn
//    }
//    
//    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "verbSaveSegue"{
//            newVerb = Verb(firstPrinciplePart: firstPrinciplePartTextField.text, secondPrinciplePart: secondPrinciplePartTextField.text, thirdPrinciplePart: thirdPrinciplePartTextField.text, fourthPrinciplePart: fourthPrinciplePartTextField.text, definition: definitionTextField.text)
//            if delegate != nil{
//                delegate!.verbInfoEntered(newVerb!)
//            }
//        }
//    }
//}