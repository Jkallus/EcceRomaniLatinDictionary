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
            let Adverbs = db["Adverbs"]
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
            
            //Adverbs
            let Positive = Expression<String>("Positive")
            let Comparitive = Expression<String>("Comparative")
            let Superlative = Expression<String>("Superlative")
            
            //NonConjugatables
            let Latin = Expression<String>("Latin")
            let Definition = Expression<String>("Definition")
            
            //Adjectives
            let MasculineNominativeSingularPositive = Expression<String>("MasculineNominativeSingularPositive")
            let FeminineNominativeSingularPositive = Expression<String>("FeminineNominativeSingularPositive")
            let NeuterNominativeSingularPositive = Expression<String>("NeuterNominativeSingularPositive")
            
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
            
            for Word in Adverbs{
                let incomingAdverb: Adverb = Adverb(positiveInput: Word[Positive], comparativeInput: Word[Comparitive], superlativeInput: Word[Superlative], englishInput: Word[Definition])
                wordsArray.insert(incomingAdverb, atIndex: i)
                i++
            }
            
            for Word in NonConjugatables{
                let incomingNonConjugatable: nonConjugatable = nonConjugatable(latinFormInput: Word[Latin], englishFormInput: Word[Definition])
                wordsArray.insert(incomingNonConjugatable, atIndex: i)
                i++
            }
            
            for Word in Adjectives{
                let incomingAdjective: simpleAdjective = simpleAdjective(masculineNominativeSingularPositiveInput: Word[MasculineNominativeSingularPositive], feminineNominativeSingularPositiveInput: Word[FeminineNominativeSingularPositive], neuterNominativeSingularPositiveInput: Word[NeuterNominativeSingularPositive], definitionInput: Word[Definition])
                wordsArray.insert(incomingAdjective, atIndex: i)
                i++
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
                let Adverbs = db["Adverbs"]
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
                
                //Adverbs
                let Positive = Expression<String>("Positive")
                let Comparitive = Expression<String>("Comparative")
                let Superlative = Expression<String>("Superlative")
                
                //NonConjugatables
                let Latin = Expression<String>("Latin")
                let Definition = Expression<String>("Definition")
                
                //Adjectives
                let MasculineNominativeSingularPositive = Expression<String>("MasculineNominativeSingularPositive")
                let FeminineNominativeSingularPositive = Expression<String>("FeminineNominativeSingularPositive")
                let NeuterNominativeSingularPositive = Expression<String>("NeuterNominativeSingularPositive")
                
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
                
                for Word in Adverbs{
                    let incomingAdverb: Adverb = Adverb(positiveInput: Word[Positive], comparativeInput: Word[Comparitive], superlativeInput: Word[Superlative], englishInput: Word[Definition])
                    wordsArray.insert(incomingAdverb, atIndex: i)
                    i++
                }
                
                for Word in NonConjugatables{
                    let incomingNonConjugatable: nonConjugatable = nonConjugatable(latinFormInput: Word[Latin], englishFormInput: Word[Definition])
                    wordsArray.insert(incomingNonConjugatable, atIndex: i)
                    i++
                }
                
                for Word in Adjectives{
                    let incomingAdjective: simpleAdjective = simpleAdjective(masculineNominativeSingularPositiveInput: Word[MasculineNominativeSingularPositive], feminineNominativeSingularPositiveInput: Word[FeminineNominativeSingularPositive], neuterNominativeSingularPositiveInput: Word[NeuterNominativeSingularPositive], definitionInput: Word[Definition])
                    wordsArray.insert(incomingAdjective, atIndex: i)
                    i++
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
            
            //Noun
            if let SimpleNoun:simpleNoun = word as? simpleNoun{
                cell = self.tableView.dequeueReusableCellWithIdentifier("nounCell", forIndexPath: indexPath) as! LatinTableViewCell
                if searchLanguage == "Latin"{
                    cell.textLabel!.text = SimpleNoun.latinSearchTerm.lowercaseString
                    cell.detailTextLabel!.text = SimpleNoun.englishSearchTerm.lowercaseString
                }
                else{
                    cell.textLabel!.text = SimpleNoun.englishSearchTerm.lowercaseString
                    cell.detailTextLabel!.text = SimpleNoun.latinSearchTerm.lowercaseString                }
            }
            
            //Adverb
            else if (word is Adverb){
                let adverb = word as! Adverb
                cell = self.tableView.dequeueReusableCellWithIdentifier("adverbCell", forIndexPath: indexPath) as! LatinTableViewCell
                if searchLanguage == "Latin"{
                    cell.textLabel!.text = adverb.latinSearchTerm.lowercaseString
                    cell.detailTextLabel!.text = adverb.englishSearchTerm.lowercaseString
                }
                else{
                    cell.textLabel!.text = adverb.englishSearchTerm.lowercaseString
                    cell.detailTextLabel!.text = adverb.latinSearchTerm.lowercaseString
                }
            }
            
            //NonConjugatable
            else if (word is nonConjugatable){
                let NonConjugatable: nonConjugatable = word as! nonConjugatable
                cell = self.tableView.dequeueReusableCellWithIdentifier("nonConjugatableCell", forIndexPath: indexPath) as! LatinTableViewCell
                if searchLanguage == "Latin"{
                    cell.textLabel!.text = NonConjugatable.latinSearchTerm.lowercaseString
                    cell.detailTextLabel!.text = NonConjugatable.englishSearchTerm.lowercaseString
                }
                else{
                    cell.textLabel!.text = NonConjugatable.englishSearchTerm.lowercaseString
                    cell.detailTextLabel!.text = NonConjugatable.latinSearchTerm.lowercaseString
                }
            }
            
            //Adjective
            else if (word is simpleAdjective){
                let SimpleAdjective = word as! simpleAdjective
                cell = self.tableView.dequeueReusableCellWithIdentifier("adjectiveCell", forIndexPath: indexPath) as! LatinTableViewCell
                if searchLanguage == "Latin"{
                    cell.textLabel!.text = SimpleAdjective.latinSearchTerm.lowercaseString
                    cell.detailTextLabel!.text = SimpleAdjective.englishSearchTerm.lowercaseString
                }
                else{
                    cell.textLabel!.text = SimpleAdjective.englishSearchTerm.lowercaseString
                    cell.detailTextLabel!.text = SimpleAdjective.latinSearchTerm.lowercaseString
                }
            }
    
            //Verb
            else{
                let SimpleVerb:simpleVerb = word as! simpleVerb
                cell = self.tableView.dequeueReusableCellWithIdentifier("verbCell", forIndexPath: indexPath) as! LatinTableViewCell
                if searchLanguage == "Latin"{
                    cell.textLabel!.text = SimpleVerb.latinSearchTerm.lowercaseString
                    cell.detailTextLabel!.text = SimpleVerb.englishSearchTerm.lowercaseString
                }
                else{
                    cell.textLabel!.text = SimpleVerb.englishSearchTerm.lowercaseString
                    cell.detailTextLabel!.text = SimpleVerb.latinSearchTerm.lowercaseString
                }
            }
        }
            
        else{
            let word = wordsArray[indexPath.row]
            
            //Noun
            if let SimpleNoun:simpleNoun = word as? simpleNoun{
                cell = self.tableView.dequeueReusableCellWithIdentifier("nounCell", forIndexPath: indexPath) as! LatinTableViewCell
                if searchLanguage == "Latin"{
                    cell.textLabel!.text = SimpleNoun.latinSearchTerm.lowercaseString
                    cell.detailTextLabel!.text = SimpleNoun.englishSearchTerm.lowercaseString
                }
                else{
                    cell.textLabel!.text = SimpleNoun.englishSearchTerm.lowercaseString
                    cell.detailTextLabel!.text = SimpleNoun.latinSearchTerm.lowercaseString
                }
            }
            
            //Adverb
            else if word is Adverb{
                let adverb = word as! Adverb
                cell = self.tableView.dequeueReusableCellWithIdentifier("adverbCell", forIndexPath: indexPath) as! LatinTableViewCell
                if searchLanguage == "Latin"{
                    cell.textLabel!.text = adverb.latinSearchTerm.lowercaseString
                    cell.detailTextLabel!.text = adverb.englishSearchTerm.lowercaseString
                }
                else{
                    cell.textLabel!.text = adverb.englishSearchTerm.lowercaseString
                    cell.detailTextLabel!.text = adverb.latinSearchTerm.lowercaseString
                }
            }
            
            //NonConjugatable
            else if (word is nonConjugatable){
                let NonConjugatable: nonConjugatable = word as! nonConjugatable
                cell = self.tableView.dequeueReusableCellWithIdentifier("nonConjugatableCell", forIndexPath: indexPath) as! LatinTableViewCell
                if searchLanguage == "Latin"{
                    cell.textLabel!.text = NonConjugatable.latinSearchTerm.lowercaseString
                    cell.detailTextLabel!.text = NonConjugatable.englishSearchTerm.lowercaseString
                }
                else{
                    cell.textLabel!.text = NonConjugatable.englishSearchTerm.lowercaseString
                    cell.detailTextLabel!.text = NonConjugatable.latinSearchTerm.lowercaseString
                }
                
            }
                
            //Adjective
            else if (word is simpleAdjective){
                let SimpleAdjective = word as! simpleAdjective
                cell = self.tableView.dequeueReusableCellWithIdentifier("adjectiveCell", forIndexPath: indexPath) as! LatinTableViewCell
                if searchLanguage == "Latin"{
                    cell.textLabel!.text = SimpleAdjective.latinSearchTerm.lowercaseString
                    cell.detailTextLabel!.text = SimpleAdjective.englishSearchTerm.lowercaseString
                }
                else{
                    cell.textLabel!.text = SimpleAdjective.englishSearchTerm.lowercaseString
                    cell.detailTextLabel!.text = SimpleAdjective.latinSearchTerm.lowercaseString
                }
            }
                
            //Verb
            else{
                let SimpleVerb:simpleVerb = word as! simpleVerb
                cell = self.tableView.dequeueReusableCellWithIdentifier("verbCell", forIndexPath: indexPath) as! LatinTableViewCell
                if searchLanguage == "Latin"{
                    cell.textLabel!.text = SimpleVerb.latinSearchTerm.lowercaseString
                    cell.detailTextLabel!.text = SimpleVerb.englishSearchTerm.lowercaseString
                }
                else{
                    cell.textLabel!.text =   SimpleVerb.englishSearchTerm.lowercaseString
                    cell.detailTextLabel!.text =  SimpleVerb.latinSearchTerm.lowercaseString
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
            
        else if segue.identifier == "adverbDetailViewSegue"{
            if self.searchDisplayController!.active{
                let indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow()!
                let selectedAdverb = filteredWordsArray[indexPath.row] as! Adverb
                (segue.destinationViewController as! AdverbDetailViewController).adverb = selectedAdverb
            }
            else{
                let indexPath = self.tableView.indexPathForSelectedRow()!
                let selectedAdverb = wordsArray[indexPath.row] as! Adverb
                (segue.destinationViewController as! AdverbDetailViewController).adverb = selectedAdverb
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
            
        else if segue.identifier == "nonConjugatableDetailViewSegue"{
            if self.searchDisplayController!.active{
                let indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow()!
                let selectedNonConjugatable = filteredWordsArray[indexPath.row] as! nonConjugatable
                (segue.destinationViewController as? NonConjugatableDetailViewController)!.nonConjugatableWord = selectedNonConjugatable
            }
            else{
                let indexPath = self.tableView.indexPathForSelectedRow()!
                let selectedNonConjugatable = wordsArray[indexPath.row] as! nonConjugatable
                (segue.destinationViewController as? NonConjugatableDetailViewController)!.nonConjugatableWord = selectedNonConjugatable
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
            
        else if segue.identifier == "addWordSegue"{
            
        }
    }
}