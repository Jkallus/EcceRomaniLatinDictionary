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
        
        section_1.insert(genders[0], atIndex: genderIndex)
        section_1.insert(cases[0], atIndex: caseIndex)
        section_1.insert(numbers[0], atIndex: numberIndex)
        section_1.insert(degrees[0], atIndex: degreeIndex)

        
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
        
        
        
        
        section_1[formIndex] = "\(section_1[genderIndex]) \(section_1[caseIndex]) \(section_1[numberIndex]) \(section_1[degreeIndex])"
        
        if section_1[genderIndex] == "masculine"{
            if section_1[caseIndex] == "nominative"{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.masculine.nominative.singular.positive.latin
                        section_1[englishIndex] = adjective.masculine.nominative.singular.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.masculine.nominative.singular.comparative.latin
                        section_1[englishIndex] = adjective.masculine.nominative.singular.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.masculine.nominative.singular.superlative.latin
                        section_1[englishIndex] = adjective.masculine.nominative.singular.superlative.english
                    }
                }
                else if section_1[numberIndex] == "plural"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.masculine.nominative.plural.positive.latin
                        section_1[englishIndex] = adjective.masculine.nominative.plural.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.masculine.nominative.plural.comparative.latin
                        section_1[englishIndex] = adjective.masculine.nominative.plural.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.masculine.nominative.plural.superlative.latin
                        section_1[englishIndex] = adjective.masculine.nominative.plural.superlative.english
                    }
                }
            }
            else if section_1[caseIndex] == "genitive"{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.masculine.genitive.singular.positive.latin
                        section_1[englishIndex] = adjective.masculine.genitive.singular.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.masculine.genitive.singular.comparative.latin
                        section_1[englishIndex] = adjective.masculine.genitive.singular.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.masculine.genitive.singular.superlative.latin
                        section_1[englishIndex] = adjective.masculine.genitive.singular.superlative.english
                    }
                }
                else if section_1[numberIndex] == "plural"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.masculine.genitive.plural.positive.latin
                        section_1[englishIndex] = adjective.masculine.genitive.plural.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.masculine.genitive.plural.comparative.latin
                        section_1[englishIndex] = adjective.masculine.genitive.plural.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.masculine.genitive.plural.superlative.latin
                        section_1[englishIndex] = adjective.masculine.genitive.plural.superlative.english
                    }
                }
            }
            else if section_1[caseIndex] == "dative"{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.masculine.dative.singular.positive.latin
                        section_1[englishIndex] = adjective.masculine.dative.singular.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.masculine.dative.singular.comparative.latin
                        section_1[englishIndex] = adjective.masculine.dative.singular.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.masculine.dative.singular.superlative.latin
                        section_1[englishIndex] = adjective.masculine.dative.singular.superlative.english
                    }
                }
                else if section_1[numberIndex] == "plural"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.masculine.dative.plural.positive.latin
                        section_1[englishIndex] = adjective.masculine.dative.plural.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.masculine.dative.plural.comparative.latin
                        section_1[englishIndex] = adjective.masculine.dative.plural.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.masculine.dative.plural.superlative.latin
                        section_1[englishIndex] = adjective.masculine.dative.plural.superlative.english
                    }
                }
            }
            else if section_1[caseIndex] == "accusative"{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.masculine.accusative.singular.positive.latin
                        section_1[englishIndex] = adjective.masculine.accusative.singular.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.masculine.accusative.singular.comparative.latin
                        section_1[englishIndex] = adjective.masculine.accusative.singular.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.masculine.accusative.singular.superlative.latin
                        section_1[englishIndex] = adjective.masculine.accusative.singular.superlative.english
                    }
                }
                else if section_1[numberIndex] == "plural"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.masculine.accusative.plural.positive.latin
                        section_1[englishIndex] = adjective.masculine.accusative.plural.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.masculine.accusative.plural.comparative.latin
                        section_1[englishIndex] = adjective.masculine.accusative.plural.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.masculine.accusative.plural.superlative.latin
                        section_1[englishIndex] = adjective.masculine.accusative.plural.superlative.english
                    }
                }
            }
            else if section_1[caseIndex] == "ablative"{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.masculine.ablative.singular.positive.latin
                        section_1[englishIndex] = adjective.masculine.ablative.singular.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.masculine.ablative.singular.comparative.latin
                        section_1[englishIndex] = adjective.masculine.ablative.singular.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.masculine.ablative.singular.superlative.latin
                        section_1[englishIndex] = adjective.masculine.ablative.singular.superlative.english
                    }
                }
                else if section_1[numberIndex] == "plural"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.masculine.ablative.plural.positive.latin
                        section_1[englishIndex] = adjective.masculine.ablative.plural.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.masculine.ablative.plural.comparative.latin
                        section_1[englishIndex] = adjective.masculine.ablative.plural.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.masculine.ablative.plural.superlative.latin
                        section_1[englishIndex] = adjective.masculine.ablative.plural.superlative.english
                    }
                }
            }
            else{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.masculine.vocative.singular.positive.latin
                        section_1[englishIndex] = adjective.masculine.vocative.singular.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.masculine.vocative.singular.comparative.latin
                        section_1[englishIndex] = adjective.masculine.vocative.singular.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.masculine.vocative.singular.superlative.latin
                        section_1[englishIndex] = adjective.masculine.vocative.singular.superlative.english
                    }
                }
                else if section_1[numberIndex] == "plural"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.masculine.vocative.plural.positive.latin
                        section_1[englishIndex] = adjective.masculine.vocative.plural.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.masculine.vocative.plural.comparative.latin
                        section_1[englishIndex] = adjective.masculine.vocative.plural.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.masculine.vocative.plural.superlative.latin
                        section_1[englishIndex] = adjective.masculine.vocative.plural.superlative.english
                    }
                }
            }
        }
        
        else if section_1[genderIndex] == "feminine"{
            if section_1[caseIndex] == "nominative"{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.feminine.nominative.singular.positive.latin
                        section_1[englishIndex] = adjective.feminine.nominative.singular.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.feminine.nominative.singular.comparative.latin
                        section_1[englishIndex] = adjective.feminine.nominative.singular.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.feminine.nominative.singular.superlative.latin
                        section_1[englishIndex] = adjective.feminine.nominative.singular.superlative.english
                    }
                }
            
                else if section_1[numberIndex] == "plural"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.feminine.nominative.plural.positive.latin
                        section_1[englishIndex] = adjective.feminine.nominative.plural.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.feminine.nominative.plural.comparative.latin
                        section_1[englishIndex] = adjective.feminine.nominative.plural.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.feminine.nominative.plural.superlative.latin
                        section_1[englishIndex] = adjective.feminine.nominative.plural.superlative.english
                    }
                }
            }
            else if section_1[caseIndex] == "genitive"{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.feminine.genitive.singular.positive.latin
                        section_1[englishIndex] = adjective.feminine.genitive.singular.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.feminine.genitive.singular.comparative.latin
                        section_1[englishIndex] = adjective.feminine.genitive.singular.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.feminine.genitive.singular.superlative.latin
                        section_1[englishIndex] = adjective.feminine.genitive.singular.superlative.english
                    }
                }
                else if section_1[numberIndex] == "plural"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.feminine.genitive.plural.positive.latin
                        section_1[englishIndex] = adjective.feminine.genitive.plural.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.feminine.genitive.plural.comparative.latin
                        section_1[englishIndex] = adjective.feminine.genitive.plural.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.feminine.genitive.plural.superlative.latin
                        section_1[englishIndex] = adjective.feminine.genitive.plural.superlative.english
                    }
                }
            }
            else if section_1[caseIndex] == "dative"{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.feminine.dative.singular.positive.latin
                        section_1[englishIndex] = adjective.feminine.dative.singular.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.feminine.dative.singular.comparative.latin
                        section_1[englishIndex] = adjective.feminine.dative.singular.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.feminine.dative.singular.superlative.latin
                        section_1[englishIndex] = adjective.feminine.dative.singular.superlative.english
                    }
                }
                else if section_1[numberIndex] == "plural"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.feminine.dative.plural.positive.latin
                        section_1[englishIndex] = adjective.feminine.dative.plural.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.feminine.dative.plural.comparative.latin
                        section_1[englishIndex] = adjective.feminine.dative.plural.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.feminine.dative.plural.superlative.latin
                        section_1[englishIndex] = adjective.feminine.dative.plural.superlative.english
                    }
                }
            }
            else if section_1[caseIndex] == "accusative"{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.feminine.accusative.singular.positive.latin
                        section_1[englishIndex] = adjective.feminine.accusative.singular.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.feminine.accusative.singular.comparative.latin
                        section_1[englishIndex] = adjective.feminine.accusative.singular.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.feminine.accusative.singular.superlative.latin
                        section_1[englishIndex] = adjective.feminine.accusative.singular.superlative.english
                    }
                }
                else if section_1[numberIndex] == "plural"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.feminine.accusative.plural.positive.latin
                        section_1[englishIndex] = adjective.feminine.accusative.plural.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.feminine.accusative.plural.comparative.latin
                        section_1[englishIndex] = adjective.feminine.accusative.plural.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.feminine.accusative.plural.superlative.latin
                        section_1[englishIndex] = adjective.feminine.accusative.plural.superlative.english
                    }
                }
            }
            else if section_1[caseIndex] == "ablative"{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.feminine.ablative.singular.positive.latin
                        section_1[englishIndex] = adjective.feminine.ablative.singular.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.feminine.ablative.singular.comparative.latin
                        section_1[englishIndex] = adjective.feminine.ablative.singular.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.feminine.ablative.singular.superlative.latin
                        section_1[englishIndex] = adjective.feminine.ablative.singular.superlative.english
                    }
                }
                else if section_1[numberIndex] == "plural"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.feminine.ablative.plural.positive.latin
                        section_1[englishIndex] = adjective.feminine.ablative.plural.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.feminine.ablative.plural.comparative.latin
                        section_1[englishIndex] = adjective.feminine.ablative.plural.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.feminine.ablative.plural.superlative.latin
                        section_1[englishIndex] = adjective.feminine.ablative.plural.superlative.english
                    }
                }
            }
            else{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.feminine.vocative.singular.positive.latin
                        section_1[englishIndex] = adjective.feminine.vocative.singular.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.feminine.vocative.singular.comparative.latin
                        section_1[englishIndex] = adjective.feminine.vocative.singular.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.feminine.vocative.singular.superlative.latin
                        section_1[englishIndex] = adjective.feminine.vocative.singular.superlative.english
                    }
                }
                else if section_1[numberIndex] == "plural"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.feminine.vocative.plural.positive.latin
                        section_1[englishIndex] = adjective.feminine.vocative.plural.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.feminine.vocative.plural.comparative.latin
                        section_1[englishIndex] = adjective.feminine.vocative.plural.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.feminine.vocative.plural.superlative.latin
                        section_1[englishIndex] = adjective.feminine.vocative.plural.superlative.english
                    }
                }
            }
        }
        
        if section_1[genderIndex] == "neuter"{
            if section_1[caseIndex] == "nominative"{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.neuter.nominative.singular.positive.latin
                        section_1[englishIndex] = adjective.neuter.nominative.singular.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.neuter.nominative.singular.comparative.latin
                        section_1[englishIndex] = adjective.neuter.nominative.singular.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.neuter.nominative.singular.superlative.latin
                        section_1[englishIndex] = adjective.neuter.nominative.singular.superlative.english
                    }
                }
                else if section_1[numberIndex] == "plural"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.neuter.nominative.plural.positive.latin
                        section_1[englishIndex] = adjective.neuter.nominative.plural.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.neuter.nominative.plural.comparative.latin
                        section_1[englishIndex] = adjective.neuter.nominative.plural.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.neuter.nominative.plural.superlative.latin
                        section_1[englishIndex] = adjective.neuter.nominative.plural.superlative.english
                    }
                }
            }
            else if section_1[caseIndex] == "genitive"{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.neuter.genitive.singular.positive.latin
                        section_1[englishIndex] = adjective.neuter.genitive.singular.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.neuter.genitive.singular.comparative.latin
                        section_1[englishIndex] = adjective.neuter.genitive.singular.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.neuter.genitive.singular.superlative.latin
                        section_1[englishIndex] = adjective.neuter.genitive.singular.superlative.english
                    }
                }
                else if section_1[numberIndex] == "plural"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.neuter.genitive.plural.positive.latin
                        section_1[englishIndex] = adjective.neuter.genitive.plural.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.neuter.genitive.plural.comparative.latin
                        section_1[englishIndex] = adjective.neuter.genitive.plural.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.neuter.genitive.plural.superlative.latin
                        section_1[englishIndex] = adjective.neuter.genitive.plural.superlative.english
                    }
                }
            }
            else if section_1[caseIndex] == "dative"{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.neuter.dative.singular.positive.latin
                        section_1[englishIndex] = adjective.neuter.dative.singular.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.neuter.dative.singular.comparative.latin
                        section_1[englishIndex] = adjective.neuter.dative.singular.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.neuter.dative.singular.superlative.latin
                        section_1[englishIndex] = adjective.neuter.dative.singular.superlative.english
                    }
                }
                else if section_1[numberIndex] == "plural"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.neuter.dative.plural.positive.latin
                        section_1[englishIndex] = adjective.neuter.dative.plural.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.neuter.dative.plural.comparative.latin
                        section_1[englishIndex] = adjective.neuter.dative.plural.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.neuter.dative.plural.superlative.latin
                        section_1[englishIndex] = adjective.neuter.dative.plural.superlative.english
                    }
                }
            }
            else if section_1[caseIndex] == "accusative"{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.neuter.accusative.singular.positive.latin
                        section_1[englishIndex] = adjective.neuter.accusative.singular.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.neuter.accusative.singular.comparative.latin
                        section_1[englishIndex] = adjective.neuter.accusative.singular.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.neuter.accusative.singular.superlative.latin
                        section_1[englishIndex] = adjective.neuter.accusative.singular.superlative.english
                    }
                }
                else if section_1[numberIndex] == "plural"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.neuter.accusative.plural.positive.latin
                        section_1[englishIndex] = adjective.neuter.accusative.plural.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.neuter.accusative.plural.comparative.latin
                        section_1[englishIndex] = adjective.neuter.accusative.plural.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.neuter.accusative.plural.superlative.latin
                        section_1[englishIndex] = adjective.neuter.accusative.plural.superlative.english
                    }
                }
            }
            else if section_1[caseIndex] == "ablative"{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.neuter.ablative.singular.positive.latin
                        section_1[englishIndex] = adjective.neuter.ablative.singular.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.neuter.ablative.singular.comparative.latin
                        section_1[englishIndex] = adjective.neuter.ablative.singular.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.neuter.ablative.singular.superlative.latin
                        section_1[englishIndex] = adjective.neuter.ablative.singular.superlative.english
                    }
                }
                else if section_1[numberIndex] == "plural"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.neuter.ablative.plural.positive.latin
                        section_1[englishIndex] = adjective.neuter.ablative.plural.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.neuter.ablative.plural.comparative.latin
                        section_1[englishIndex] = adjective.neuter.ablative.plural.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.neuter.ablative.plural.superlative.latin
                        section_1[englishIndex] = adjective.neuter.ablative.plural.superlative.english
                    }
                }
            }
            else{
                if section_1[numberIndex] == "singular"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.neuter.vocative.singular.positive.latin
                        section_1[englishIndex] = adjective.neuter.vocative.singular.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.neuter.vocative.singular.comparative.latin
                        section_1[englishIndex] = adjective.neuter.vocative.singular.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.neuter.vocative.singular.superlative.latin
                        section_1[englishIndex] = adjective.neuter.vocative.singular.superlative.english
                    }
                }
                else if section_1[numberIndex] == "plural"{
                    if section_1[degreeIndex] == "positive"{
                        section_1[latinIndex] = adjective.neuter.vocative.plural.positive.latin
                        section_1[englishIndex] = adjective.neuter.vocative.plural.positive.english
                    }
                    else if section_1[degreeIndex] == "comparative"{
                        section_1[latinIndex] = adjective.neuter.vocative.plural.comparative.latin
                        section_1[englishIndex] = adjective.neuter.vocative.plural.comparative.english
                    }
                    else{
                        section_1[latinIndex] = adjective.neuter.vocative.plural.superlative.latin
                        section_1[englishIndex] = adjective.neuter.vocative.plural.superlative.english
                    }
                }
            }
        }
        self.propertyTableView.reloadData()
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        section_1[genderIndex] = genders[pickerView.selectedRowInComponent(0)]
        section_1[caseIndex] = cases[pickerView.selectedRowInComponent(1)]
        section_1[degreeIndex] = degrees[pickerView.selectedRowInComponent(3)]
        section_1[numberIndex] = numbers[pickerView.selectedRowInComponent(2)]
        
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
