//
//  NounDetailViewController.swift
//  EcceRomaniLatinDictionary
//
//  Created by Josh Kallus on 2/17/15.
//  Copyright (c) 2015 JMKLABS. All rights reserved.
//

import UIKit

class NounDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var propertyTableView: UITableView!
    
    var word: Word?
    
    let cases = ["nominative", "genitive", "dative", "accusative", "ablative", "vocative"]
    let numbers = ["singular", "plural"]
    
    var Case: String?
    var Number: String?
    var form:String?
    var latin: String?
    var english: String?
    
    var section_0 = [String]()
    var section_1 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let noun = word as Noun
        
        section_0.insert(noun.nominative.singular + ", " + noun.genitive.singular, atIndex: 0)
        section_0.insert(noun.Definition, atIndex: 1)
        
        section_1.insert("Gender: \(noun.Gender)", atIndex: 0)
        section_1.insert( "Declension: \(noun.Declension)", atIndex: 1)
        
        Case = cases[0]
        Number = numbers[0]
        
        setCustom()
        
        section_1.insert("Form: \(form!)", atIndex: 2)
        section_1.insert("Latin: \(latin!)", atIndex: 3)
        section_1.insert("English: \(english)", atIndex: 4)

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
        if (Case! == "nominative" && Number! == "singular"){
            form = "\(cases[0]) \(numbers[0])"
            latin = noun.nominative.singular
            //english = "English: \(noun.nominative.singular.english)"
        }
        else if (Case! == "nominative" && Number! == "plural"){
            form = "\(cases[0]) \(numbers[1])"
            latin = noun.nominative.plural
            //english = "English: \(noun.nominative.plural.english)"
        }
        else if (Case! == "genitive" && Number! == "singular"){
            form = "\(cases[1]) \(numbers[0])"
            latin = noun.genitive.singular
            //english = "English: \(noun.genitive.singular.english)"
        }
        else if (Case! == "genitive" && Number! == "plural"){
            form = "\(cases[1]) \(numbers[1])"
            latin = noun.genitive.plural
            //english = "English: \(noun.genitive.plural.english)"
        }
        else if (Case! == "dative" && Number! == "singular"){
            form = "\(cases[2]) \(numbers[0])"
            latin = noun.dative.singular
            //english = "English: \(noun.dative.singular.english)"
        }
        else if (Case! == "dative" && Number! == "plural"){
            form = "\(cases[2]) \(numbers[1])"
            latin = noun.dative.plural
            //english = "English: \(noun.dative.plural.english)"
        }
        else if (Case! == "accusative" && Number! == "singular"){
            form = "\(cases[3]) \(numbers[0])"
            latin = noun.accusative.singular
            //english = "English: \(noun.accusative.singular.english)"
        }
        else if (Case! == "accusative" && Number! == "plural"){
            form = "\(cases[3]) \(numbers[1])"
            latin = noun.accusative.plural
            //english = "English: \(noun.accusative.plural.english)"
        }
        else if (Case! == "ablative" && Number! == "singular"){
            form = "\(cases[4]) \(numbers[0])"
            latin = noun.ablative.singular
            //english = "English: \(noun.ablative.singular.english)"
        }
        else if (Case! == "ablative" && Number! == "plural"){
            form = "\(cases[4]) \(numbers[1])"
            latin = noun.ablative.plural
            //english = "English: \(noun.ablative.plural.english)"
        }
        else if (Case! == "vocative" && Number! == "singular"){
            form = "\(cases[5]) \(numbers[0])"
            latin = noun.vocative.singular
            //english = "English: \(noun.vocative.singular.english)"
        }
        else{
            form = "\(cases[5]) \(numbers[1])"
            latin = noun.vocative.plural
            //english = "English: \(noun.vocative.plural.english)"
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
               if component == 0{
            if row == 0{
                Case = "nominative"
            }
            else if row == 1{
                Case = "genitive"
            }
            else if row == 2{
                Case = "dative"
            }
            else if row == 3{
                Case = "accusative"
            }
            else if row == 4{
                Case = "ablative"
            }
            else{
                Case = "vocative"
            }
        }
        else{
            if row == 0{
                Number = "singular"
            }
            else{
                Number = "plural"
            }
        }
        
        setCustom()
        
        self.propertyTableView!.reloadData()
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
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
}