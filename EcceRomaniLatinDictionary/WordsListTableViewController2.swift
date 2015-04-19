//
//  WordsListTableViewController2.swift
//  EcceRomaniLatinDictionary
//
//  Created by Josh Kallus on 4/11/15.
//  Copyright (c) 2015 JMKLABS. All rights reserved.
//

import UIKit
import SQLite
import Foundation

class WordsListTableViewController2: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    
    var searchLanguage: String = "Latin"
    var wordsArray = [Word]()
    var filteredWordsArray = [Word]()
    
    func pathToDocsFolder() -> String {
        return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
    }
    
    
    @IBOutlet weak var WordsTable: UITableView!
    
    @IBOutlet weak var searchLanguageButton: UISegmentedControl!
    @IBAction func languageChanged(sender: UISegmentedControl) {
        switch searchLanguageButton.selectedSegmentIndex {
        case 0:
            searchLanguage = "Latin"
        case 1:
            searchLanguage = "English"
        default:
            searchLanguage = "Latin"
        }
        
        sortTable()

    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool{
        let scopes = self.searchDisplayController!.searchBar.scopeButtonTitles as! [String]
        let selectedScope = scopes[self.searchDisplayController!.searchBar.selectedScopeButtonIndex] as String
        self.filterContentForSearchText(searchString, scope: selectedScope)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchScope searchOption: Int) -> Bool{
        let scope = self.searchDisplayController!.searchBar.scopeButtonTitles as! [String]
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text, scope: scope[searchOption])
        return true
    }

    func filterContentForSearchText(searchText: String, scope: String = "All"){
        self.filteredWordsArray = self.wordsArray.filter({(word: Word) -> Bool in
            var categoryMatch = (scope == "All") || (word.partOfSpeech == scope)
            var stringMatch: Bool
            if self.searchLanguage == "Latin"{
                stringMatch = word.latinSearchTerm.lowercaseString.hasPrefix(searchText.lowercaseString)
            }
            else{
                stringMatch = word.englishSearchTerm.lowercaseString.hasPrefix(searchText.lowercaseString)
            }
            return categoryMatch && (stringMatch)
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        let theFileManager = NSFileManager.defaultManager()
        if theFileManager.fileExistsAtPath(pathToDocsFolder().stringByAppendingPathComponent("/StandardData.sqlite")){
            let db = Database(pathToDocsFolder().stringByAppendingPathComponent("/StandardData.sqlite"))
            
            let Nouns = db["Nouns"]
            let Verbs = db["Verbs"]
            let Adjectives = db["Adjectives"]
            let NonConjugatables = db["NonConjugatables"]
            
            //Nouns
            let NominativeSingular = Expression<String>("NominativeSingular")
            let GenitiveSingular = Expression<String>("GenitiveSingular")
            let Gender = Expression<String>("Gender")
            let Declension = Expression<Int>("Declension")
            
            //Verbs
            let FirstPrinciplePart = Expression<String>("FirstPrinciplePart")
            let SecondPrinciplePart = Expression<String>("SecondPrinciplePart")
            let ThirdPrinciplePart = Expression<String>("ThirdPrinciplePart")
            let FourthPrinciplePart = Expression<String>("FourthPrinciplePart")
            
            //NonConjugatables
            let Latin = Expression<String>("Latin")
            let Definition = Expression<String>("Definition")
            
            var i = 0
            for Word in Nouns{
                let incomingSimpleNoun: simpleNoun = simpleNoun(nominativeSingularInput: Word[NominativeSingular], genitiveSingularInput: Word[GenitiveSingular], genderInput: Word[Gender], definitionInput: Word[Definition], declensionInput: Word[Declension])
                wordsArray.insert(incomingSimpleNoun, atIndex: i)
                i++
            }
            
            for Word in Verbs{
                let incomingSimpleVerb: simpleVerb = simpleVerb(firstPrinciplePartInput: Word[FirstPrinciplePart], secondPrinciplePartInput: Word[SecondPrinciplePart], thirdPrinciplePartInput: Word[ThirdPrinciplePart], fourthPrinciplePartInput: Word[FourthPrinciplePart], definitionInput: Word[Definition])
                wordsArray.insert(incomingSimpleVerb, atIndex: i)
                i++
            }
            
            for Word in NonConjugatables{
                let incomingSimpleNonConjugatable: simpleNonConjugatable = simpleNonConjugatable(latinInput: Word[Latin], definitionInput: Word[Definition])
                wordsArray.insert(incomingSimpleNonConjugatable, atIndex: i)
            }
            
            
            sortTable()
        }
            
        else{
            let pathToBundledDB = NSBundle.mainBundle().pathForResource("StandardData", ofType: "sqlite")
            let pathToDevice = pathToDocsFolder().stringByAppendingPathComponent("/StandardData.sqlite")
            var error: NSError?
            if(theFileManager.copyItemAtPath(pathToBundledDB!, toPath: pathToDevice, error: &error)){
                let db = Database(pathToDocsFolder().stringByAppendingPathComponent("/StandardData.sqlite"))
                
                let Nouns = db["Nouns"]
                let Verbs = db["Verbs"]
                let Adjectives = db["Adjectives"]
                let NonConjugatables = db["NonConjugatables"]
                
                //Nouns
                let NominativeSingular = Expression<String>("NominativeSingular")
                let GenitiveSingular = Expression<String>("GenitiveSingular")
                let Gender = Expression<String>("Gender")
                let Declension = Expression<Int>("Declension")
                
                //Verbs
                let FirstPrinciplePart = Expression<String>("FirstPrinciplePart")
                let SecondPrinciplePart = Expression<String>("SecondPrinciplePart")
                let ThirdPrinciplePart = Expression<String>("ThirdPrinciplePart")
                let FourthPrinciplePart = Expression<String>("FourthPrinciplePart")
                
                //NonConjugatables
                let Latin = Expression<String>("Latin")
                let Definition = Expression<String>("Definition")
                var i = 0
                
                for Word in Nouns{
                    let incomingSimpleNoun: simpleNoun = simpleNoun(nominativeSingularInput: Word[NominativeSingular], genitiveSingularInput: Word[GenitiveSingular], genderInput: Word[Gender], definitionInput: Word[Definition], declensionInput: Word[Declension])
                    wordsArray.insert(incomingSimpleNoun, atIndex: i)
                    i++
                }
                
                for Word in Verbs{
                    let incomingSimpleVerb: simpleVerb = simpleVerb(firstPrinciplePartInput: Word[FirstPrinciplePart], secondPrinciplePartInput: Word[SecondPrinciplePart], thirdPrinciplePartInput: Word[ThirdPrinciplePart], fourthPrinciplePartInput: Word[FourthPrinciplePart], definitionInput: Word[Definition])
                    wordsArray.insert(incomingSimpleVerb, atIndex: i)
                    i++
                }
                
                for Word in NonConjugatables{
                    let incomingSimpleNonConjugatable: simpleNonConjugatable = simpleNonConjugatable(latinInput: Word[Latin], definitionInput: Word[Definition])
                }
                
                sortTable()
            }
            else{
                
            }
        }
    }
    
    
    func sortTable(){
        if searchLanguage == "Latin"{
            wordsArray = wordsArray.sorted{ $0.latinSearchTerm.lowercaseString < $1.latinSearchTerm.lowercaseString}
        }
        else{
            wordsArray = wordsArray.sorted{ $0.englishSearchTerm.lowercaseString < $1.englishSearchTerm.lowercaseString}
        }
        WordsTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.filteredWordsArray.count
        }
        else{
            return self.wordsArray.count
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if tableView == self.searchDisplayController?.searchResultsTableView{
            
            let word = filteredWordsArray[indexPath.row]
            if let simpleNoun:simpleNoun = word as? simpleNoun{
                let noun: Noun = Noun(NominativeSingularInput: simpleNoun.nominativeSingular, GenitiveSingularInput: simpleNoun.genitiveSingular, GenderInput: simpleNoun.gender, DefinitionInput: simpleNoun.definition, DeclensionInput: simpleNoun.declension)
                if searchLanguage == "Latin"{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("nounCell", forIndexPath: indexPath) as! LatinTableViewCell
                    cell.textLabel!.text = noun.nominative.singular.lowercaseString + ", " + noun.genitive.singular.lowercaseString
                    cell.detailTextLabel!.text = noun.Definition.lowercaseString
                    //println("Text Label: \(cell.textLabel!.text), Detail Text Label: \(cell.detailTextLabel!.text)")
                }
                else{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("nounCell", forIndexPath: indexPath) as! LatinTableViewCell
                    cell.textLabel!.text = noun.Definition.lowercaseString
                    cell.detailTextLabel!.text = noun.nominative.singular.lowercaseString + ", " + noun.genitive.singular.lowercaseString
                    //println("Text Label: \(cell.textLabel!.text), Detail Text Label: \(cell.detailTextLabel!.text)")
                }
            }
                
            else if let simpleNonConjugatable:simpleNonConjugatable = word as? simpleNonConjugatable{
                let NonConjugatable: nonConjugatable = nonConjugatable(latinFormInput: simpleNonConjugatable.latin, englishFormInput: simpleNonConjugatable.definition)
                if searchLanguage == "Latin"{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("nonConjugatableCell", forIndexPath: indexPath) as! LatinTableViewCell
                    cell.textLabel!.text = NonConjugatable.latinForm
                    cell.detailTextLabel!.text = NonConjugatable.englishForm
                }
                else{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("nonConjugatableCell", forIndexPath: indexPath) as! LatinTableViewCell
                    cell.textLabel!.text = NonConjugatable.englishForm
                    cell.detailTextLabel!.text = NonConjugatable.latinForm
                }
            }
                
            else{
                let SimpleVerb:simpleVerb = word as! simpleVerb
                let verb:Verb = Verb(firstPrinciplePart: SimpleVerb.firstPrinciplePart , secondPrinciplePart: SimpleVerb.secondPrinciplePart, thirdPrinciplePart: SimpleVerb.thirdPrinciplePart, fourthPrinciplePart: SimpleVerb.fourthPrinciplePart, definition: SimpleVerb.definition)
                if searchLanguage == "Latin"{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("verbCell", forIndexPath: indexPath) as! LatinTableViewCell
                    cell.textLabel!.text = verb.firstPrinciplePart.lowercaseString + ", " + verb.secondPrinciplePart.lowercaseString
                    cell.detailTextLabel!.text = verb.definition.lowercaseString
                    //println("Text Label: \(cell.textLabel!.text), Detail Text Label: \(cell.detailTextLabel!.text)")
                }
                else{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("verbCell", forIndexPath: indexPath) as! LatinTableViewCell
                    cell.textLabel!.text = verb.definition.lowercaseString
                    cell.detailTextLabel!.text = verb.firstPrinciplePart + ", " + verb.secondPrinciplePart.lowercaseString
                    //println("Text Label: \(cell.textLabel!.text), Detail Text Label: \(cell.detailTextLabel!.text)")
                }
            }
        }
            
        else{
            let word = wordsArray[indexPath.row]
            
            
            if let simpleNoun:simpleNoun = word as? simpleNoun{
                let noun: Noun = Noun(NominativeSingularInput: simpleNoun.nominativeSingular, GenitiveSingularInput: simpleNoun.genitiveSingular, GenderInput: simpleNoun.gender, DefinitionInput: simpleNoun.definition, DeclensionInput: simpleNoun.declension)
                if searchLanguage == "Latin"{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("nounCell", forIndexPath: indexPath) as! LatinTableViewCell
                    cell.textLabel!.text = noun.nominative.singular.lowercaseString + ", " + noun.genitive.singular.lowercaseString
                    cell.detailTextLabel!.text = noun.Definition.lowercaseString
                    //println("Text Label: \(cell.textLabel!.text), Detail Text Label: \(cell.detailTextLabel!.text)")
                }
                else{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("nounCell", forIndexPath: indexPath) as! LatinTableViewCell
                    cell.textLabel!.text = noun.Definition.lowercaseString
                    cell.detailTextLabel!.text = noun.nominative.singular.lowercaseString + ", " + noun.genitive.singular.lowercaseString
                    //println("Text Label: \(cell.textLabel!.text), Detail Text Label: \(cell.detailTextLabel!.text)")
                }
            }
                
            else if let simpleNonConjugatable:simpleNonConjugatable = word as? simpleNonConjugatable{
                let NonConjugatable: nonConjugatable = nonConjugatable(latinFormInput: simpleNonConjugatable.latin, englishFormInput: simpleNonConjugatable.definition)
                if searchLanguage == "Latin"{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("nonConjugatableCell", forIndexPath: indexPath) as! LatinTableViewCell
                    cell.textLabel!.text = NonConjugatable.latinForm
                    cell.detailTextLabel!.text = NonConjugatable.englishForm
                }
                else{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("nonConjugatableCell", forIndexPath: indexPath) as! LatinTableViewCell
                    cell.textLabel!.text = NonConjugatable.englishForm
                    cell.detailTextLabel!.text = NonConjugatable.latinForm
                }
            }
                
            else{
                let SimpleVerb:simpleVerb = word as! simpleVerb
                let verb:Verb = Verb(firstPrinciplePart: SimpleVerb.firstPrinciplePart , secondPrinciplePart: SimpleVerb.secondPrinciplePart, thirdPrinciplePart: SimpleVerb.thirdPrinciplePart, fourthPrinciplePart: SimpleVerb.fourthPrinciplePart, definition: SimpleVerb.definition)

                if searchLanguage == "Latin"{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("verbCell", forIndexPath: indexPath) as! LatinTableViewCell
                    cell.textLabel!.text = verb.firstPrinciplePart.lowercaseString + ", " + verb.secondPrinciplePart.lowercaseString
                    cell.detailTextLabel!.text = verb.definition.lowercaseString
                    //println("Text Label: \(cell.textLabel!.text), Detail Text Label: \(cell.detailTextLabel!.text)")
                }
                else{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("verbCell", forIndexPath: indexPath) as! LatinTableViewCell
                    cell.textLabel!.text =   verb.definition.lowercaseString
                    cell.detailTextLabel!.text =  verb.firstPrinciplePart.lowercaseString + ", " + verb.secondPrinciplePart.lowercaseString
                    //println("Text Label: \(cell.textLabel!.text), Detail Text Label: \(cell.detailTextLabel!.text)")
                }
            }
        }
        return cell
    }
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "nounDetailViewSegue"{
            if self.searchDisplayController!.active{
                let indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow()!
                let selectedSimpleNoun = filteredWordsArray[indexPath.row] as! simpleNoun
                let complexNoun: Noun = Noun(NominativeSingularInput: selectedSimpleNoun.nominativeSingular, GenitiveSingularInput: selectedSimpleNoun.genitiveSingular, GenderInput: selectedSimpleNoun.gender, DefinitionInput: selectedSimpleNoun.definition, DeclensionInput: selectedSimpleNoun.declension)
                (segue.destinationViewController as! NounDetailViewController).word = complexNoun
            }
            else{
                let indexPath = self.tableView.indexPathForSelectedRow()!
                let selectedSimpleNoun = wordsArray[indexPath.row] as! simpleNoun
                let complexNoun: Noun = Noun(NominativeSingularInput: selectedSimpleNoun.nominativeSingular, GenitiveSingularInput: selectedSimpleNoun.genitiveSingular, GenderInput: selectedSimpleNoun.gender, DefinitionInput: selectedSimpleNoun.definition, DeclensionInput: selectedSimpleNoun.declension)
                (segue.destinationViewController as! NounDetailViewController).word = complexNoun
            }
        }
            
            
            
            
        else if segue.identifier == "verbDetailViewSegue"{
            if self.searchDisplayController!.active{
                let indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow()!
                let selectedSimpleVerb = filteredWordsArray[indexPath.row] as! simpleVerb
                let complexVerb:Verb = Verb(firstPrinciplePart: selectedSimpleVerb.firstPrinciplePart, secondPrinciplePart: selectedSimpleVerb.secondPrinciplePart, thirdPrinciplePart: selectedSimpleVerb.thirdPrinciplePart, fourthPrinciplePart: selectedSimpleVerb.fourthPrinciplePart, definition: selectedSimpleVerb.definition)
                (segue.destinationViewController as! VerbDetailViewController).word = complexVerb
            }
            else{
                let indexPath = self.tableView.indexPathForSelectedRow()!
                let selectedSimpleVerb = wordsArray[indexPath.row] as! simpleVerb
                let complexVerb:Verb = Verb(firstPrinciplePart: selectedSimpleVerb.firstPrinciplePart, secondPrinciplePart: selectedSimpleVerb.secondPrinciplePart, thirdPrinciplePart: selectedSimpleVerb.thirdPrinciplePart, fourthPrinciplePart: selectedSimpleVerb.fourthPrinciplePart, definition: selectedSimpleVerb.definition)
                (segue.destinationViewController as! VerbDetailViewController).word = complexVerb
            }
        }
            
            
            
        else if segue.identifier == "adjectiveDetailViewSegue"{
            if self.searchDisplayController!.active{
                let indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow()!
            }
            else{
                let indexPath = self.tableView.indexPathForSelectedRow()!
            }
        }
            
            
        else if segue.identifier == "nonConjugatableDetailViewSegue"{
            if self.searchDisplayController!.active{
                let indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow()!
                let selectedSimpleNonConjugatable = filteredWordsArray[indexPath.row] as! simpleNonConjugatable
                let complexNonConjugatable: nonConjugatable = nonConjugatable(latinFormInput: selectedSimpleNonConjugatable.latin, englishFormInput: selectedSimpleNonConjugatable.definition)
                (segue.destinationViewController as! NonConjugatableDetailViewController).word = complexNonConjugatable
            }
            else{
                let indexPath = self.tableView.indexPathForSelectedRow()!
                let selectedSimpleNonConjugatable = wordsArray[indexPath.row] as! simpleNonConjugatable
                let complexNonConjugatable: nonConjugatable = nonConjugatable(latinFormInput: selectedSimpleNonConjugatable.latin, englishFormInput: selectedSimpleNonConjugatable.definition)
                (segue.destinationViewController as! NonConjugatableDetailViewController).word = complexNonConjugatable
            }
        }
            
        else if segue.identifier == "addWordSegue"{
            
            
            
        }
    }
    
}