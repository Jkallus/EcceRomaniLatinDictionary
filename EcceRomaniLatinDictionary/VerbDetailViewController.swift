//
//  VerbDetailViewController.swift
//  EcceRomaniLatinDictionary
//
//  Created by Josh Kallus on 2/17/15.
//  Copyright (c) 2015 JMKLABS. All rights reserved.
//

import UIKit

class VerbDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate  {
    
    @IBOutlet weak var propertyTableView: UITableView!
    
    var word: Word?
    
    let tenses = ["present", "imperfect", "future", "perfect", "pluperfect", "future perfect"]
    let persons = ["first person", "second person", "third person"]
    let numbers = ["singular", "plural"]
    
    var selectedTense: String?
    var selectedPerson: String?
    var selectedNumber: String?
    
    var Section_0 = [String]()
    var Section_1 = [String]()
    
    var form: String?
    var latin: String?
    var english: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        selectedTense = tenses[0]
        selectedPerson = persons[0]
        selectedNumber = numbers[0]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func pickerView(UIPickerView!, titleForRow row: Int, forComponent component: Int) ->String!{
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
        let verb = word as Verb
        if component == 0{
            selectedTense = tenses[row]
        }
        else if component == 1{
            selectedPerson = persons[row]
        }
        else{
            selectedNumber = numbers[row]
        }
        
        if selectedTense == tenses[0]{
            if selectedPerson == persons[0]{
                if selectedNumber == numbers[0]{
                    form = "\(tenses[0]) \(persons[0]) \(numbers[0])"
                    latin = verb.active.present.firstPerson.singular.latin
                    english = verb.active.present.firstPerson.singular.english
                }
                else{
                    form = "\(tenses[0]) \(persons[0]) \(numbers[1])"
                    latin = verb.active.present.firstPerson.plural.latin
                    english = verb.active.present.firstPerson.plural.english
                }
            }
            else if selectedPerson == persons[1]{
                if selectedNumber == numbers[0]{
                    form = "\(tenses[0]) \(persons[1]) \(numbers[0])"
                    latin = verb.active.present.secondPerson.singular.latin
                    english = verb.active.present.secondPerson.singular.english
                }
                else{
                    form = "\(tenses[0]) \(persons[1]) \(numbers[1])"
                    latin = verb.active.present.secondPerson.plural.latin
                    english = verb.active.present.secondPerson.plural.english
                }
            }
            else{
                if selectedNumber == numbers[0]{
                    form = "\(tenses[0]) \(persons[2]) \(numbers[0])"
                    latin = verb.active.present.thirdPerson.singular.latin
                    english = verb.active.present.thirdPerson.singular.english
                }
                else{
                    form = "\(tenses[0]) \(persons[2]) \(numbers[1])"
                    latin = verb.active.present.thirdPerson.plural.latin
                    english = verb.active.present.thirdPerson.plural.english
                }
            }
        }
        else if selectedTense == tenses[1]{
            if selectedPerson == persons[0]{
                if selectedNumber == numbers[0]{
                    form = "\(tenses[1]) \(persons[0]) \(numbers[0])"
                    latin = verb.active.imperfect.firstPerson.singular.latin
                    english = verb.active.imperfect.firstPerson.singular.english
                }
                else{
                    form = "\(tenses[1]) \(persons[0]) \(numbers[1])"
                    latin = verb.active.imperfect.firstPerson.plural.latin
                    english = verb.active.imperfect.firstPerson.plural.english
                }
            }
            else if selectedPerson == persons[1]{
                if selectedNumber == numbers[0]{
                    form = "\(tenses[1]) \(persons[1]) \(numbers[0])"
                    latin = verb.active.imperfect.secondPerson.singular.latin
                    english = verb.active.imperfect.secondPerson.singular.english
                }
                else{
                    form = "\(tenses[1]) \(persons[1]) \(numbers[1])"
                    latin = verb.active.imperfect.secondPerson.plural.latin
                    english = verb.active.imperfect.secondPerson.plural.english
                }
            }
            else{
                if selectedNumber == numbers[0]{
                    form = "\(tenses[1]) \(persons[2]) \(numbers[0])"
                    latin = verb.active.imperfect.thirdPerson.singular.latin
                    english = verb.active.imperfect.thirdPerson.singular.english
                }
                else{
                    form = "\(tenses[1]) \(persons[2]) \(numbers[1])"
                    latin = verb.active.imperfect.thirdPerson.plural.latin
                    english = verb.active.imperfect.thirdPerson.plural.english
                }
            }
        }
        else if selectedTense == tenses[2]{
            if selectedPerson == persons[0]{
                if selectedNumber == numbers[0]{
                    form = "\(tenses[2]) \(persons[0]) \(numbers[0])"
                    latin = verb.active.future.firstPerson.singular.latin
                    english = verb.active.future.firstPerson.singular.english
                }
                else{
                    form = "\(tenses[2]) \(persons[0]) \(numbers[1])"
                    latin = verb.active.future.firstPerson.plural.latin
                    english = verb.active.future.firstPerson.plural.english
                }
            }
            else if selectedPerson == persons[1]{
                if selectedNumber == numbers[0]{
                    form = "\(tenses[2]) \(persons[1]) \(numbers[0])"
                    latin = verb.active.future.secondPerson.singular.latin
                    english = verb.active.future.secondPerson.singular.english
                }
                else{
                    form = "\(tenses[2]) \(persons[1]) \(numbers[1])"
                    latin = verb.active.future.secondPerson.plural.latin
                    english = verb.active.future.secondPerson.plural.english
                }
            }
            else{
                if selectedNumber == numbers[0]{
                    form = "\(tenses[2]) \(persons[2]) \(numbers[0])"
                    latin = verb.active.future.thirdPerson.singular.latin
                    english = verb.active.future.thirdPerson.singular.english
                }
                else{
                    form = "\(tenses[2]) \(persons[2]) \(numbers[1])"
                    latin = verb.active.future.thirdPerson.plural.latin
                    english = verb.active.future.thirdPerson.plural.english
                }
            }
        }
        else if selectedTense == tenses[3]{
            if selectedPerson == persons[0]{
                if selectedNumber == numbers[0]{
                    form = "\(tenses[3]) \(persons[0]) \(numbers[0])"
                    latin = verb.active.perfect.firstPerson.singular.latin
                    english = verb.active.perfect.firstPerson.singular.english
                }
                else{
                    form = "\(tenses[3]) \(persons[0]) \(numbers[1])"
                    latin = verb.active.perfect.firstPerson.plural.latin
                    english = verb.active.perfect.firstPerson.plural.english
                }
            }
            else if selectedPerson == persons[1]{
                if selectedNumber == numbers[0]{
                    form = "\(tenses[3]) \(persons[1]) \(numbers[0])"
                    latin = verb.active.perfect.secondPerson.singular.latin
                    english = verb.active.perfect.secondPerson.singular.english
                }
                else{
                    form = "\(tenses[3]) \(persons[1]) \(numbers[1])"
                    latin = verb.active.perfect.secondPerson.plural.latin
                    english = verb.active.perfect.secondPerson.plural.english
                }
            }
            else{
                if selectedNumber == numbers[0]{
                    form = "\(tenses[3]) \(persons[2]) \(numbers[0])"
                    latin = verb.active.perfect.thirdPerson.singular.latin
                    english = verb.active.perfect.thirdPerson.singular.english
                }
                else{
                    form = "\(tenses[3]) \(persons[2]) \(numbers[1])"
                    latin = verb.active.perfect.thirdPerson.plural.latin
                    english = verb.active.perfect.thirdPerson.plural.english
                }
            }
        }
        else if selectedTense == tenses[4]{
            if selectedPerson == persons[0]{
                if selectedNumber == numbers[0]{
                    form = "\(tenses[4]) \(persons[0]) \(numbers[0])"
                    latin = verb.active.pluperfect.firstPerson.singular.latin
                    english = verb.active.pluperfect.firstPerson.singular.english
                }
                else{
                    form = "\(tenses[4]) \(persons[0]) \(numbers[1])"
                    latin = verb.active.pluperfect.firstPerson.plural.latin
                    english = verb.active.pluperfect.firstPerson.plural.english
                }
            }
            else if selectedPerson == persons[1]{
                if selectedNumber == numbers[0]{
                    form = "\(tenses[4]) \(persons[1]) \(numbers[0])"
                    latin = verb.active.pluperfect.secondPerson.singular.latin
                    english = verb.active.pluperfect.secondPerson.singular.english
                }
                else{
                    form = "\(tenses[4]) \(persons[1]) \(numbers[1])"
                    latin = verb.active.pluperfect.secondPerson.plural.latin
                    english = verb.active.pluperfect.secondPerson.plural.english
                }
            }
            else{
                if selectedNumber == numbers[0]{
                    form = "\(tenses[4]) \(persons[2]) \(numbers[0])"
                    latin = verb.active.pluperfect.thirdPerson.singular.latin
                    english = verb.active.pluperfect.thirdPerson.singular.english
                }
                else{
                    form = "\(tenses[4]) \(persons[2]) \(numbers[1])"
                    latin = verb.active.pluperfect.thirdPerson.plural.latin
                    english = verb.active.pluperfect.thirdPerson.plural.english
                }
            }
        }
        else{
            if selectedPerson == persons[0]{
                if selectedNumber == numbers[0]{
                    form = "\(tenses[5]) \(persons[0]) \(numbers[0])"
                    latin = verb.active.futurePerfect.firstPerson.singular.latin
                    english = verb.active.futurePerfect.firstPerson.singular.english
                }
                else{
                    form = "\(tenses[5]) \(persons[0]) \(numbers[1])"
                    latin = verb.active.futurePerfect.firstPerson.plural.latin
                    english = verb.active.futurePerfect.firstPerson.plural.english
                }
            }
            else if selectedPerson == persons[1]{
                if selectedNumber == numbers[0]{
                    form = "\(tenses[5]) \(persons[1]) \(numbers[0])"
                    latin = verb.active.futurePerfect.secondPerson.singular.latin
                    english = verb.active.futurePerfect.secondPerson.singular.english
                }
                else{
                    form = "\(tenses[5]) \(persons[1]) \(numbers[1])"
                    latin = verb.active.futurePerfect.secondPerson.plural.latin
                    english = verb.active.futurePerfect.secondPerson.plural.english
                }
            }
            else{
                if selectedNumber == numbers[0]{
                    form = "\(tenses[5]) \(persons[2]) \(numbers[0])"
                    latin = verb.active.futurePerfect.thirdPerson.singular.latin
                    english = verb.active.futurePerfect.thirdPerson.singular.english
                }
                else{
                    form = "\(tenses[5]) \(persons[2]) \(numbers[1])"
                    latin = verb.active.futurePerfect.thirdPerson.plural.latin
                    english = verb.active.futurePerfect.thirdPerson.plural.english
                }
            }
        }
        
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
            return 8
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("propertyIdentifier", forIndexPath: indexPath) as UITableViewCell
        let verb = word as Verb
        
        Section_0.insert(verb.firstPrinciplePart + ", " + verb.secondPrinciplePart, atIndex: 0)
        Section_0.insert("To \(verb.definition)", atIndex: 1)
        
        Section_1.insert("Conjugation: \(verb.conjugation)", atIndex: 0)
        Section_1.insert("First Principle Part: \(verb.firstPrinciplePart)", atIndex: 1)
        Section_1.insert("Second Principle Part: \(verb.secondPrinciplePart)", atIndex: 2)
        Section_1.insert("Third Principle Part: \(verb.thirdPrinciplePart)", atIndex: 3)
        Section_1.insert("Fourth Principle Part: \(verb.fourthPrinciplePart)", atIndex: 4)
        
        Section_1.insert("Form: \(form)", atIndex: 5)
        Section_1.insert("Latin: \(latin)", atIndex: 6)
        Section_1.insert("English: \(english)", atIndex: 7)
        
        
                if indexPath.section == 0{
            cell.textLabel!.text = Section_0[indexPath.row]
        }
        else{
            cell.textLabel!.text = Section_1[indexPath.row]
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
}
