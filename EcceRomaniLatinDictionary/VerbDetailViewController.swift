//
//  VerbDetailViewController.swift
//  EcceRomaniLatinDictionary
//
//  Created by Josh Kallus on 2/17/15.
//  Copyright (c) 2015 JMKLABS. All rights reserved.
//

//////////////////////////////////////////////////
// section_0[0] = title                         //
// section_0[1] = subtitle                      //
//                                              //
// section_1[0] = conjugation                   //
// section_1[1] = first principle part          //
// section_1[2] = second principle part         //
// section_1[3] = third principle part          //
// section_1[4] = fourth principle part         //
// seciton_1[5] = form                          //
// section_1[6] = latin                         //
// section_1[7] = english                       //
// section_1[8] = tense                         //
// section_1[9] = person                        //
// section_1[10] = number                       //
//////////////////////////////////////////////////

import UIKit

class VerbDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate  {
    
    @IBOutlet weak var propertyTableView: UITableView!
    
    let titleIndex = 0
    let subtitleIndex = 1
    
    let conjugationIndex = 0
    let firstPrinciplePartIndex = 1
    let secondPrinciplePartIndex = 2
    let thirdPrinciplePartIndex = 3
    let fourthPrinciplePartIndex = 4
    let formIndex = 5
    let latinIndex = 6
    let englishIndex = 7
    let tenseIndex = 8
    let personIndex = 9
    let numberIndex = 10
    
    var word: Word?
    
    let tenses = ["present", "imperfect", "future", "perfect", "pluperfect", "future perfect"]
    let persons = ["first person", "second person", "third person"]
    let numbers = ["singular", "plural"]
    
    var section_0 = [String]()
    var section_1 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let verb = word as! Verb
        
        section_1 = [String](count: 11, repeatedValue: "")
        
        section_0.insert(verb.firstPrinciplePart + ", " + verb.secondPrinciplePart, atIndex: titleIndex)
        section_0.insert(verb.definition, atIndex: subtitleIndex)
        
        section_1.insert("Conjugation: \(verb.conjugation)", atIndex: conjugationIndex)
        section_1.insert("First Principle Part: \(verb.firstPrinciplePart)", atIndex: firstPrinciplePartIndex)
        section_1.insert("Second Principle Part: \(verb.secondPrinciplePart)", atIndex: secondPrinciplePartIndex)
        section_1.insert("Third Principle Part: \(verb.thirdPrinciplePart)", atIndex: thirdPrinciplePartIndex)
        section_1.insert("Fourth Principle Part: \(verb.fourthPrinciplePart)", atIndex: fourthPrinciplePartIndex)
        
        section_1[tenseIndex] = tenses[0]
        section_1[personIndex] = persons[0]
        section_1[numberIndex] = numbers[0]
        
        setCustom()
    }
    
    func setCustom(){
        let verb = word as! Verb
        
        if section_1[tenseIndex] == tenses[0]{
            if section_1[personIndex] == persons[0]{
                if section_1[numberIndex] == numbers[0]{
                    section_1[formIndex] = "\(tenses[0]) \(persons[0]) \(numbers[0])"
                    section_1[latinIndex] = verb.active.present.firstPerson.singular.latin
                    section_1[englishIndex] = verb.active.present.firstPerson.singular.english
                }
                else{
                    section_1[formIndex] = "\(tenses[0]) \(persons[0]) \(numbers[1])"
                    section_1[latinIndex] = verb.active.present.firstPerson.plural.latin
                    section_1[englishIndex] = verb.active.present.firstPerson.plural.english
                }
            }
            else if section_1[personIndex] == persons[1]{
                if section_1[numberIndex] == numbers[0]{
                    section_1[formIndex] = "\(tenses[0]) \(persons[1]) \(numbers[0])"
                    section_1[latinIndex] = verb.active.present.secondPerson.singular.latin
                    section_1[englishIndex] = verb.active.present.secondPerson.singular.english
                }
                else{
                    section_1[formIndex] = "\(tenses[0]) \(persons[1]) \(numbers[1])"
                    section_1[latinIndex] = verb.active.present.secondPerson.plural.latin
                    section_1[englishIndex] = verb.active.present.secondPerson.plural.english
                }
            }
            else{
                if section_1[numberIndex] == numbers[0]{
                    section_1[formIndex] = "\(tenses[0]) \(persons[2]) \(numbers[0])"
                    section_1[latinIndex] = verb.active.present.thirdPerson.singular.latin
                    section_1[englishIndex] = verb.active.present.thirdPerson.singular.english
                }
                else{
                    section_1[formIndex] = "\(tenses[0]) \(persons[2]) \(numbers[1])"
                    section_1[latinIndex] = verb.active.present.thirdPerson.plural.latin
                    section_1[englishIndex] = verb.active.present.thirdPerson.plural.english
                }
            }
        }
        else if section_1[tenseIndex] == tenses[1]{
            if section_1[personIndex] == persons[0]{
                if section_1[numberIndex] == numbers[0]{
                    section_1[formIndex] = "\(tenses[1]) \(persons[0]) \(numbers[0])"
                    section_1[latinIndex] = verb.active.imperfect.firstPerson.singular.latin
                    section_1[englishIndex] = verb.active.imperfect.firstPerson.singular.english
                }
                else{
                    section_1[formIndex] = "\(tenses[1]) \(persons[0]) \(numbers[1])"
                    section_1[latinIndex] = verb.active.imperfect.firstPerson.plural.latin
                    section_1[englishIndex] = verb.active.imperfect.firstPerson.plural.english
                }
            }
            else if section_1[personIndex] == persons[1]{
                if section_1[numberIndex] == numbers[0]{
                    section_1[formIndex] = "\(tenses[1]) \(persons[1]) \(numbers[0])"
                    section_1[latinIndex] = verb.active.imperfect.secondPerson.singular.latin
                    section_1[englishIndex] = verb.active.imperfect.secondPerson.singular.english
                }
                else{
                    section_1[formIndex] = "\(tenses[1]) \(persons[1]) \(numbers[1])"
                    section_1[latinIndex] = verb.active.imperfect.secondPerson.plural.latin
                    section_1[englishIndex] = verb.active.imperfect.secondPerson.plural.english
                }
            }
            else{
                if section_1[numberIndex] == numbers[0]{
                    section_1[formIndex] = "\(tenses[1]) \(persons[2]) \(numbers[0])"
                    section_1[latinIndex] = verb.active.imperfect.thirdPerson.singular.latin
                    section_1[englishIndex] = verb.active.imperfect.thirdPerson.singular.english
                }
                else{
                    section_1[formIndex] = "\(tenses[1]) \(persons[2]) \(numbers[1])"
                    section_1[latinIndex] = verb.active.imperfect.thirdPerson.plural.latin
                    section_1[englishIndex] = verb.active.imperfect.thirdPerson.plural.english
                }
            }
        }
        else if section_1[tenseIndex] == tenses[2]{
            if section_1[personIndex] == persons[0]{
                if section_1[numberIndex] == numbers[0]{
                    section_1[formIndex] = "\(tenses[2]) \(persons[0]) \(numbers[0])"
                    section_1[latinIndex] = verb.active.future.firstPerson.singular.latin
                    section_1[englishIndex] = verb.active.future.firstPerson.singular.english
                }
                else{
                    section_1[formIndex] = "\(tenses[2]) \(persons[0]) \(numbers[1])"
                    section_1[latinIndex] = verb.active.future.firstPerson.plural.latin
                    section_1[englishIndex] = verb.active.future.firstPerson.plural.english
                }
            }
            else if section_1[personIndex] == persons[1]{
                if section_1[numberIndex] == numbers[0]{
                    section_1[formIndex] = "\(tenses[2]) \(persons[1]) \(numbers[0])"
                    section_1[latinIndex] = verb.active.future.secondPerson.singular.latin
                    section_1[englishIndex] = verb.active.future.secondPerson.singular.english
                }
                else{
                    section_1[formIndex] = "\(tenses[2]) \(persons[1]) \(numbers[1])"
                    section_1[latinIndex] = verb.active.future.secondPerson.plural.latin
                    section_1[englishIndex] = verb.active.future.secondPerson.plural.english
                }
            }
            else{
                if section_1[numberIndex] == numbers[0]{
                    section_1[formIndex] = "\(tenses[2]) \(persons[2]) \(numbers[0])"
                    section_1[latinIndex] = verb.active.future.thirdPerson.singular.latin
                    section_1[englishIndex] = verb.active.future.thirdPerson.singular.english
                }
                else{
                    section_1[formIndex] = "\(tenses[2]) \(persons[2]) \(numbers[1])"
                    section_1[latinIndex] = verb.active.future.thirdPerson.plural.latin
                    section_1[englishIndex] = verb.active.future.thirdPerson.plural.english
                }
            }
        }
        else if section_1[tenseIndex] == tenses[3]{
            if section_1[personIndex] == persons[0]{
                if section_1[numberIndex] == numbers[0]{
                    section_1[formIndex] = "\(tenses[3]) \(persons[0]) \(numbers[0])"
                    section_1[latinIndex] = verb.active.perfect.firstPerson.singular.latin
                    section_1[englishIndex] = verb.active.perfect.firstPerson.singular.english
                }
                else{
                    section_1[formIndex] = "\(tenses[3]) \(persons[0]) \(numbers[1])"
                    section_1[latinIndex] = verb.active.perfect.firstPerson.plural.latin
                    section_1[englishIndex] = verb.active.perfect.firstPerson.plural.english
                }
            }
            else if section_1[personIndex] == persons[1]{
                if section_1[numberIndex] == numbers[0]{
                    section_1[formIndex] = "\(tenses[3]) \(persons[1]) \(numbers[0])"
                    section_1[latinIndex] = verb.active.perfect.secondPerson.singular.latin
                    section_1[englishIndex] = verb.active.perfect.secondPerson.singular.english
                }
                else{
                    section_1[formIndex] = "\(tenses[3]) \(persons[1]) \(numbers[1])"
                    section_1[latinIndex] = verb.active.perfect.secondPerson.plural.latin
                    section_1[englishIndex] = verb.active.perfect.secondPerson.plural.english
                }
            }
            else{
                if section_1[numberIndex] == numbers[0]{
                    section_1[formIndex] = "\(tenses[3]) \(persons[2]) \(numbers[0])"
                    section_1[latinIndex] = verb.active.perfect.thirdPerson.singular.latin
                    section_1[englishIndex] = verb.active.perfect.thirdPerson.singular.english
                }
                else{
                    section_1[formIndex] = "\(tenses[3]) \(persons[2]) \(numbers[1])"
                    section_1[latinIndex] = verb.active.perfect.thirdPerson.plural.latin
                    section_1[englishIndex] = verb.active.perfect.thirdPerson.plural.english
                }
            }
        }
        else if section_1[tenseIndex] == tenses[4]{
            if section_1[personIndex] == persons[0]{
                if section_1[numberIndex] == numbers[0]{
                    section_1[formIndex] = "\(tenses[4]) \(persons[0]) \(numbers[0])"
                    section_1[latinIndex] = verb.active.pluperfect.firstPerson.singular.latin
                    section_1[englishIndex] = verb.active.pluperfect.firstPerson.singular.english
                }
                else{
                    section_1[formIndex] = "\(tenses[4]) \(persons[0]) \(numbers[1])"
                    section_1[latinIndex] = verb.active.pluperfect.firstPerson.plural.latin
                    section_1[englishIndex] = verb.active.pluperfect.firstPerson.plural.english
                }
            }
            else if section_1[personIndex] == persons[1]{
                if section_1[numberIndex] == numbers[0]{
                    section_1[formIndex] = "\(tenses[4]) \(persons[1]) \(numbers[0])"
                    section_1[latinIndex] = verb.active.pluperfect.secondPerson.singular.latin
                    section_1[englishIndex] = verb.active.pluperfect.secondPerson.singular.english
                }
                else{
                    section_1[formIndex] = "\(tenses[4]) \(persons[1]) \(numbers[1])"
                    section_1[latinIndex] = verb.active.pluperfect.secondPerson.plural.latin
                    section_1[englishIndex] = verb.active.pluperfect.secondPerson.plural.english
                }
            }
            else{
                if section_1[numberIndex] == numbers[0]{
                    section_1[formIndex] = "\(tenses[4]) \(persons[2]) \(numbers[0])"
                    section_1[latinIndex] = verb.active.pluperfect.thirdPerson.singular.latin
                    section_1[englishIndex] = verb.active.pluperfect.thirdPerson.singular.english
                }
                else{
                    section_1[formIndex] = "\(tenses[4]) \(persons[2]) \(numbers[1])"
                    section_1[latinIndex] = verb.active.pluperfect.thirdPerson.plural.latin
                    section_1[englishIndex] = verb.active.pluperfect.thirdPerson.plural.english
                }
            }
        }
        else{
            if section_1[personIndex] == persons[0]{
                if section_1[numberIndex] == numbers[0]{
                    section_1[formIndex] = "\(tenses[5]) \(persons[0]) \(numbers[0])"
                    section_1[latinIndex] = verb.active.futurePerfect.firstPerson.singular.latin
                    section_1[englishIndex] = verb.active.futurePerfect.firstPerson.singular.english
                }
                else{
                    section_1[formIndex] = "\(tenses[5]) \(persons[0]) \(numbers[1])"
                    section_1[latinIndex] = verb.active.futurePerfect.firstPerson.plural.latin
                    section_1[englishIndex] = verb.active.futurePerfect.firstPerson.plural.english
                }
            }
            else if section_1[personIndex] == persons[1]{
                if section_1[numberIndex] == numbers[0]{
                    section_1[formIndex] = "\(tenses[5]) \(persons[1]) \(numbers[0])"
                    section_1[latinIndex] = verb.active.futurePerfect.secondPerson.singular.latin
                    section_1[englishIndex] = verb.active.futurePerfect.secondPerson.singular.english
                }
                else{
                    section_1[formIndex] = "\(tenses[5]) \(persons[1]) \(numbers[1])"
                    section_1[latinIndex] = verb.active.futurePerfect.secondPerson.plural.latin
                    section_1[englishIndex] = verb.active.futurePerfect.secondPerson.plural.english
                }
            }
            else{
                if section_1[numberIndex] == numbers[0]{
                    section_1[formIndex] = "\(tenses[5]) \(persons[2]) \(numbers[0])"
                    section_1[latinIndex] = verb.active.futurePerfect.thirdPerson.singular.latin
                    section_1[englishIndex] = verb.active.futurePerfect.thirdPerson.singular.english
                }
                else{
                    section_1[formIndex] = "\(tenses[5]) \(persons[2]) \(numbers[1])"
                    section_1[latinIndex] = verb.active.futurePerfect.thirdPerson.plural.latin
                    section_1[englishIndex] = verb.active.futurePerfect.thirdPerson.plural.english
                }
            }
        }
        
        section_1[formIndex] = "Form: " + section_1[formIndex]
        section_1[latinIndex] = "Latin: " + section_1[latinIndex]
        section_1[englishIndex] = "English: " + section_1[englishIndex]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
        if component == 0{
            return tenses.count
        }
        else if component == 1{
            return persons.count
        }
        else{
            return numbers.count
        }
    }
    
    func pickerView(UIPickerView, titleForRow row: Int, forComponent component: Int) ->String!{
        if component == 0{
            return tenses[row]
        }
        else if component == 1{
            return persons[row]
        }
        else{
            return numbers[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let verb = word as! Verb
        if component == 0{
            section_1[tenseIndex] = tenses[row]
        }
        else if component == 1{
            section_1[personIndex] = persons[row]
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
            return 8
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
       if segue.identifier == "verbWebSegue"{
            (segue.destinationViewController as! WebsiteTableViewController).word = self.word!
       }
    }
}
