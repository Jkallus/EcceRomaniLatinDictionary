//
//  AdjectiveDetailViewController.swift
//  EcceRomaniLatinDictionary
//
//  Created by Josh Kallus on 2/17/15.
//  Copyright (c) 2015 JMKLABS. All rights reserved.
//

//////////////////////////////////////////////////////////
// section_0[0] = titleLabel (latinSearchTerm)          //
// section_0[1] = subtitleLabel (englishSearchTerm)     //
//                                                      //
// section_1[0] = form                                  //
// section_1[1] = latin                                 //
// section_1[2] = english                               //
// section_1[3] = gender {not shown}                    //
// section_1[4] = case {not shown}                      //
// section_1[5] = number {not shown}                    //
// section_1[6] = degree {not shown}                    //
//////////////////////////////////////////////////////////

import UIKit

class AdjectiveDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {

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
    
    var adjective: Adjective!
    
    let genders = ["masculine", "feminine", "neuter"]
    let cases = ["nominative", "genitive", "dative", "accusative", "ablative", "vocative"]
    let numbers = ["singular", "plural"]
    let degrees = ["positive", "comparative", "superlative"]
    
    var section_0 = [String]()
    var section_1 = [String](count: 3, repeatedValue: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        section_0.insert(adjective.latinSearchTerm, atIndex: titleIndex)
        section_0.insert(adjective.englishSearchTerm, atIndex: subtitleIndex)
        
        section_1.insert("\(genders[0]) \(cases[0]) \(numbers[0]) \(degrees[0])", atIndex: formIndex)
        section_1.insert(adjective.masculine.nominative.singular.positive.latin, atIndex: latinIndex)
        section_1.insert(adjective.masculine.nominative.singular.positive.english, atIndex: englishIndex)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return genders.count
        }
        else if component == 1{
            return cases.count
        }
        else if component == 2{
            return numbers.count
        }
        else{
            return degrees.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if component == 0{
            return genders[row]
        }
        else if component == 1{
            return cases[row]
        }
        else if component == 2{
            return numbers[row]
        }
        else{
            return degrees[row]
        }
    }
    
    func setCustom(){
        
        section_1[genderIndex] = genders[formPicker.selectedRowInComponent(0)]
        section_1[caseIndex] = cases[formPicker.selectedRowInComponent(1)]
        section_1[numberIndex] = numbers[formPicker.selectedRowInComponent(2)]
        section_1[degreeIndex] = degrees[formPicker.selectedRowInComponent(3)]
        
        
        section_1[formIndex] = "\(section_1[genderIndex]) \(section_1[caseIndex]) \(section_1[numberIndex]) \(degreeIndex)"
        
        if section_1[genderIndex] == "masculine"{
            if section_1[caseIndex] == "nominative"{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        
                    }
                    else if section_1[degreeIndex] == "comparative"{
                    
                    }
                    else{
                        
                    }
                }
            }
            else if section_1[caseIndex] == "genitive"{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        
                    }
                    else{
                        
                    }
                }
            }
            else if section_1[caseIndex] == "dative"{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        
                    }
                    else{
                        
                    }
                }
            }
            else if section_1[caseIndex] == "accusative"{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        
                    }
                    if section_1[degreeIndex] == "comparative"{
                    
                    }
                }
            }
            else if section_1[caseIndex] == "ablative"{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                    
                    }
                }
            }
            else{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        
                    }
                }
                
            }
        }
//        else if section_1[genderIndex] = "feminine"{
//            
//        }
//        else{
//            
//        }
        
        
        
        
        self.propertyTableView.reloadData()
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
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
       if segue.identifier == "adjectiveWebSegue"{
        (segue.destinationViewController as! WebsiteTableViewController).word = self.adjective
        }
    }
}
