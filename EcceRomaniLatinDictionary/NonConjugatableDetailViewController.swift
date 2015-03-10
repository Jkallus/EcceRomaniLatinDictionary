//
//  NonConjugatableViewController.swift
//  EcceRomaniLatinDictionary
//
//  Created by Josh Kallus on 2/17/15.
//  Copyright (c) 2015 JMKLABS. All rights reserved.
//

import UIKit

class NonConjugatableDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var word: Word?
    
    var section_0 = [String]()
    var section_1 = [String]()
    
    @IBOutlet weak var propertiesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nonConjugatableWord = word as nonConjugatable
        
        section_0.insert(nonConjugatableWord.latinForm, atIndex: 0)
        section_0.insert(nonConjugatableWord.englishForm, atIndex: 1)
        
        section_1.insert("nonConjugatable", atIndex: 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Word"
        }
        else{
            return "Word Info"
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 2
        }
        else{
            return 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("propertyIdentifier", forIndexPath: indexPath) as UITableViewCell
        if indexPath.section == 0{
            cell.textLabel!.text = section_0[indexPath.row]
        }
        else{
            cell.textLabel!.text = section_1[indexPath.row]
        }
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "nonConjugatableWebSegue"{
            (segue.destinationViewController as WebsiteTableViewController).word = self.word!
        }
    }
}
