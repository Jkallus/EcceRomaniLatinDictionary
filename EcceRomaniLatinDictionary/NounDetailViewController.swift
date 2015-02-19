//
//  NounDetailViewController.swift
//  EcceRomaniLatinDictionary
//
//  Created by Josh Kallus on 2/17/15.
//  Copyright (c) 2015 JMKLABS. All rights reserved.
//

//////////////////////////////////////////////////
//  section_0[0] = titleLabel                   //
//  section_0[1] = subtitleLabel                //
//                                              //
//  section_1[0] = gender                       //
//  section_1[1] = declension                   //
//  section_1[2] = form                         //
//  section_1[3] = latin                        //
//  section_1[4] = english                      //
//  section_1[5] = case    {not in tableview}   //
//  section_1[6] = number  {not in tableview}   //
//////////////////////////////////////////////////

import UIKit

class NounDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var propertyTableView: UITableView!
    
    let titleIndex: Int = 0
    let subtitleIndex: Int = 1
    
    let genderIndex: Int = 0
    let declensionIndex: Int = 1
    let formIndex: Int = 2
    let latinIndex: Int = 3
    let englishIndex: Int = 4
    let caseIndex: Int = 5
    let numberIndex: Int = 6
    
    
    

    var word: Word?
    
    let cases = ["nominative", "genitive", "dative", "accusative", "ablative", "vocative"]
    let numbers = ["singular", "plural"]
    
    var form:String?
    var latin: String?
    var english: String?
    
    var section_0 = [String]()
    var section_1 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let noun = word as Noun
        
        section_1 = [String](count: 7, repeatedValue: "")
        
        
        section_0.insert(noun.nominative.singular + ", " + noun.genitive.singular, atIndex: titleIndex)
        section_0.insert(noun.Definition, atIndex: subtitleIndex)
        
        section_1.insert("Gender: \(noun.Gender)", atIndex: genderIndex)
        section_1.insert( "Declension: \(noun.Declension)", atIndex: declensionIndex)
        
        section_1.insert(cases[0], atIndex: caseIndex)
        section_1.insert(numbers[0], atIndex: numberIndex)
        
        setCustom()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
        if component == 0{
            //Case component. 6 possible cases
            return cases.count
        }
        else{
            //Number component. 2 possible numbers
            return numbers.count
        }
    }
    
    func pickerView(UIPickerView!, titleForRow row: Int, forComponent component: Int) ->String!{
        if component == 0{
            return cases[row]
        }
        else{
            return numbers[row]
        }
    }
    
    func setCustom(){
        let noun = word as Noun
        
        if (section_1[caseIndex] == "nominative" && section_1[numberIndex] == "singular"){
            section_1[formIndex] = "\(cases[0]) \(numbers[0])"
            section_1[latinIndex] = noun.nominative.singular
            //section_1[englishIndex] = noun.nominative.singular.english
        }
            
            
        else if(section_1[caseIndex] == "nominative" && section_1[numberIndex] == "plural"){
            section_1[formIndex] = "\(cases[0]) \(numbers[1])"
            section_1[latinIndex] = noun.nominative.plural
            //section_1[englishIndex] = noun.nominative.plural.english
        }

        else if(section_1[caseIndex] == "genitive" && section_1[numberIndex] == "singular"){
            section_1[formIndex] = "\(cases[1]) \(numbers[0])"
            section_1[latinIndex] = noun.genitive.singular
            //section_1[englishIndex] = noun.genitive.singular.english
        }
    
        else if(section_1[caseIndex] == "genitive" && section_1[numberIndex] == "plural"){
            section_1[formIndex] = "\(cases[1]) \(numbers[1])"
            section_1[latinIndex] = noun.genitive.plural
            //section_1[englishIndex] = noun.genitive.plural.english
        }
    
        else if(section_1[caseIndex] == "dative" && section_1[numberIndex] == "singular"){
            section_1[formIndex] = "\(cases[2]) \(numbers[0])"
            section_1[latinIndex] = noun.dative.singular
            //section_1[englishIndex] = noun.dative.singular.english
        }


        else if(section_1[caseIndex] == "dative" && section_1[numberIndex] == "plural"){
            section_1[formIndex] = "\(cases[2]) \(numbers[1])"
            section_1[latinIndex] = noun.dative.plural
            //section_1[englishIndex] = noun.dative.plural.english
        }
            
        else if(section_1[caseIndex] == "accusative" && section_1[numberIndex] == "singular"){
            section_1[formIndex] = "\(cases[3]) \(numbers[0])"
            section_1[latinIndex] = noun.accusative.singular
            //section_1[englishIndex] = noun.accuative.singular.english
        }
            
        else if(section_1[caseIndex] == "accusative" && section_1[numberIndex] == "plural"){
            section_1[formIndex] = "\(cases[3]) \(numbers[1])"
            section_1[latinIndex] = noun.accusative.plural
            //section_1[englishIndex] = noun.accusative.plural.english
        }
            
        else if(section_1[caseIndex] == "ablative" && section_1[numberIndex] == "singular"){
            section_1[formIndex] = "\(cases[4]) \(numbers[0])"
            section_1[latinIndex] = noun.ablative.singular
            //section_1[englishIndex] = noun.ablative.singular.english
        }
            
        else if(section_1[caseIndex] == "ablative" && section_1[numberIndex] == "plural"){
            section_1[formIndex] = "\(cases[4]) \(numbers[1])"
            section_1[latinIndex] = noun.ablative.plural
            //section_1[englishIndex] = noun.ablative.plural.english
        }
            
        else if(section_1[caseIndex] == "vocative" && section_1[numberIndex] == "singular"){
            section_1[formIndex] = "\(cases[5]) \(numbers[0])"
            section_1[latinIndex] = noun.vocative.singular
            //section_1[englishIndex] = noun.vocative.singular.english
        }
            
        else{
            section_1[formIndex] = "\(cases[5]) \(numbers[1])"
            section_1[latinIndex] = noun.vocative.plural
            //section_1[englishIndex] = noun.vocative.plural.english
        }
        
            section_1[formIndex] = "Form: " + section_1[formIndex]
            section_1[latinIndex] = "Latin: " + section_1[latinIndex]
            section_1[englishIndex] = ""
            section_1[englishIndex] = "English: " + section_1[englishIndex]
        
        self.propertyTableView.reloadData()
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            section_1[caseIndex] = cases[row]
        }
        else{
            section_1[numberIndex] = numbers[row]
        }
        
        setCustom()
        
        self.propertyTableView.reloadData()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            return 2
        }
        else{
            return 5
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
        let cell = tableView.dequeueReusableCellWithIdentifier("propertyIdentifier", forIndexPath: indexPath) as UITableViewCell
        if indexPath.section == 0{
            cell.textLabel!.text = section_0[indexPath.row]
        }
        else{
            cell.textLabel!.text = section_1[indexPath.row]
            println(section_1[indexPath.row])
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
}