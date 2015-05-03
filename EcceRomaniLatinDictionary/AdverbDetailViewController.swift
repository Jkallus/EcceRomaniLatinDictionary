//
//  AdverbDetailViewController.swift
//  EcceRomaniLatinDictionary
//
//  Created by Josh Kallus on 4/24/15.
//  Copyright (c) 2015 JMKLABS. All rights reserved.
//

//////////////////////////////////////////////////
//  section_0[0] = titleLabel                   //
//  section_0[1] = subtitleLabel                //
//                                              //
//  section_1[0] = form                         //
//  section_1[1] = latin                        //
//  section_1[2] = english                      //
//////////////////////////////////////////////////
import UIKit

class AdverbDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var propertyTableView: UITableView!
    @IBOutlet weak var formPicker: UIPickerView!
    
    let titleIndex: Int = 0
    let subtitleIndex: Int = 1
    
    let formIndex: Int = 0
    let latinIndex: Int = 1
    let englishIndex: Int = 2
    
    let genderIndex: Int = 3
    let caseIndex: Int = 4
    let numberIndex: Int = 5
    let degreeIndex: Int = 6
    
    var adverb: Adverb!
    
    let degrees = ["positive", "comparative", "superlative"]
    
    
    var section_0  = [String]()
    var section_1 = [String](count: 3, repeatedValue: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        section_0.insert(adverb.latinSearchTerm, atIndex: titleIndex)
        section_0.insert(adverb.englishSearchTerm, atIndex: subtitleIndex)
        
        section_1.insert(degrees[0], atIndex: formIndex)
        section_1.insert(adverb.positive.latin, atIndex: latinIndex)
        section_1.insert(adverb.positive.english, atIndex: englishIndex)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setCustom(){
        if(section_1[formIndex] == "positive")
        {
            section_1[latinIndex] = adverb.positive.latin
            section_1[englishIndex] = adverb.positive.english
        }
        else if(section_1[formIndex] == "comparative")
        {
            section_1[latinIndex] = adverb.comparative.latin
            section_1[englishIndex] = adverb.comparative.english
        }
        else{
            section_1[latinIndex] = adverb.superlative.latin
            section_1[englishIndex] = adverb.superlative.english
        }
        
        section_1[formIndex] += "Form: "
        section_1[latinIndex] += "Latin: "
        section_1[englishIndex] += "English: "

        self.propertyTableView.reloadData()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return degrees.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return degrees[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        section_1[formIndex] = degrees[row]
        setCustom()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 2
        }
        else{
            return 3
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Word"
        }
        else{
            return "Word Info"
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("propertyIdentifier", forIndexPath: indexPath) as! UITableViewCell
        if indexPath.section == 0{
            cell.textLabel!.text = section_0[indexPath.row]
        }
        else{
            cell.textLabel!.text = section_1[indexPath.row]
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "adverbWebSegue"{
            (segue.destinationViewController as! WebsiteTableViewController).word = self.adverb
        }
    }
    

}
