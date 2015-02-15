//
//  WordListTableViewController.swift
//  EcceRomaniLatinDictionary
//
//  Created by Josh Kallus on 2/14/15.
//  Copyright (c) 2015 JMKLABS. All rights reserved.
//

import UIKit
import Foundation
import SQLite

class WordListTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {

    var searchLanguage: String = "Latin"
    
    var WordsArray = [Word]()
    var FilteredWordsArray = [Word]()
    var sortedWordsArray = [Word]()
    var sortedFilteredWordsArray = [Word]()
    
    
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
        if searchLanguage == "Latin"{
            sortedWordsArray = WordsArray.sorted{ $0.latinSearchTerm.lowercaseString < $1.latinSearchTerm.lowercaseString}
            sortedFilteredWordsArray = FilteredWordsArray.sorted{ $0.latinSearchTerm.lowercaseString < $1.latinSearchTerm.lowercaseString}
        }
        else{
            sortedWordsArray = WordsArray.sorted{ $0.englishSearchTerm.lowercaseString < $1.englishSearchTerm.lowercaseString}
            sortedFilteredWordsArray = FilteredWordsArray.sorted{ $0.englishSearchTerm.lowercaseString < $1.englishSearchTerm.lowercaseString}
        }
        self.tableView.reloadData()
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All"){
        self.FilteredWordsArray = self.WordsArray.filter({(word: Word) -> Bool in
            var categoryMatch = (scope == "All") || (word.partOfSpeech == scope)
            var stringMatch: Bool
            if self.searchLanguage == "Latin"{
                stringMatch = word.latinSearchTerm.lowercaseString.hasPrefix(searchText.lowercaseString)
            }
            else{
                stringMatch = word.englishSearchTerm.lowercaseString.hasPrefix(searchText.lowercaseString)
            }
            println(word.latinSearchTerm)
            println(categoryMatch && (stringMatch))
            println()
            return categoryMatch && (stringMatch)
        })
        
        if searchLanguage == "Latin"{
            sortedWordsArray = WordsArray.sorted{ $0.latinSearchTerm.lowercaseString < $1.latinSearchTerm.lowercaseString}
            sortedFilteredWordsArray = FilteredWordsArray.sorted{ $0.latinSearchTerm.lowercaseString < $1.latinSearchTerm.lowercaseString}
        }
        else{
            sortedWordsArray = WordsArray.sorted{ $0.englishSearchTerm.lowercaseString < $1.englishSearchTerm.lowercaseString}
            sortedFilteredWordsArray = FilteredWordsArray.sorted{ $0.englishSearchTerm.lowercaseString < $1.englishSearchTerm.lowercaseString}
        }
        println()
        println()
        println()
        println()
        println()
    }

    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool{
        let scopes = self.searchDisplayController!.searchBar.scopeButtonTitles as [String]
        let selectedScope = scopes[self.searchDisplayController!.searchBar.selectedScopeButtonIndex] as String
        self.filterContentForSearchText(searchString, scope: selectedScope)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchScope searchOption: Int) -> Bool{
        let scope = self.searchDisplayController!.searchBar.scopeButtonTitles as [String]
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text, scope: scope[searchOption])
        return true
    }

    
    func pathToDocsFolder() -> String {
        let pathToDocumentsFolder = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        println(pathToDocumentsFolder)
        return pathToDocumentsFolder
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
                let incomingNoun: Noun = Noun(NominativeSingularInput: Word[NominativeSingular], GenitiveSingularInput: Word[GenitiveSingular], GenderInput: Word[Gender], DefinitionInput: Word[Definition], DeclensionInput: Word[Declension])
                WordsArray.insert(incomingNoun, atIndex: i)
                i++
            }
            
            for Word in Verbs{
                let incomingVerb: Verb = Verb(firstPrinciplePart: Word[FirstPrinciplePart], secondPrinciplePart: Word[SecondPrinciplePart], thirdPrinciplePart: Word[ThirdPrinciplePart], fourthPrinciplePart: Word[FourthPrinciplePart], definition: Word[Definition])
                WordsArray.insert(incomingVerb, atIndex: i)
                i++

            }
            
            for Word in NonConjugatables{
                let incomingNonConjugatable: nonConjugatable = nonConjugatable(latinFormInput: Word[Latin], englishFormInput: Word[Definition])
                WordsArray.insert(incomingNonConjugatable, atIndex: i)
                i++
            }

            sortedWordsArray = WordsArray.sorted{ $0.latinSearchTerm.lowercaseString < $1.latinSearchTerm.lowercaseString}
            for word in sortedWordsArray{
                println("Latin Search Term: \(word.latinSearchTerm), English Search Term: \(word.englishSearchTerm), Part of Speech: \(word.partOfSpeech)")
            }
        }
        
        
        else{
            let pathToBundledDB = NSBundle.mainBundle().pathForResource("StandardData", ofType: "sqlite")
            let pathToDevice = pathToDocsFolder().stringByAppendingPathComponent("/StandardData.sqlite")
            var error: NSError?
            if(theFileManager.copyItemAtPath(pathToBundledDB!, toPath: pathToDevice, error: &error)){
                println("File was copied from \(pathToBundledDB!) to \(pathToDevice)")
                let alertController = UIAlertController(title: "File Error", message: "Standard Library File was copied from \(pathToBundledDB!) to \(pathToDevice)", preferredStyle: .Alert)
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in }
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true) {}
            }
            else{
                println("Failure: File did not copy successfully")
            }
        }

        if theFileManager.fileExistsAtPath(pathToDocsFolder().stringByAppendingPathComponent("/UserData.sqlite")){
            let customDB = Database(pathToDocsFolder().stringByAppendingPathComponent("/UserData.sqlite"))
            
            let customNouns = customDB["Nouns"]
            let customVerbs = customDB["Verbs"]
            let customAdjectives = customDB["Adjectives"]
            let customNonConjugatables = customDB["NonConjugatables"]
            
            //Nouns
            let customNominativeSingular = Expression<String>("NominativeSingular")
            let customGenitiveSingular = Expression<String>("GenitiveSingular")
            let customDeclension = Expression<Int>("Declension")
            let customGender = Expression<String>("Gender")
            
            //Verbs
            let customFirstPrinciplePart = Expression<String>("FirstPrinciplePart")
            let customSecondPrinciplePart = Expression<String>("SecondPrinciplePart")
            let customThirdPrinciplePart = Expression<String>("ThirdPrinciplePart")
            let customFourthPrinciplePart = Expression<String>("FourthPrinciplePart")
            
            //NonConjugatables
            let customLatin = Expression<String>("Latin")
            
            let customDefinition = Expression<String>("Definition")
            
            var customI = 0
            
            
            
            for Word in customNouns{
                let customIncomingNoun: Noun = Noun(NominativeSingularInput: Word[customNominativeSingular], GenitiveSingularInput: Word[customGenitiveSingular], GenderInput: Word[customGender], DefinitionInput: Word[customDefinition], DeclensionInput: Word[customDeclension])
                WordsArray.insert(customIncomingNoun, atIndex: customI)
                customI++
            }
            
            for Word in customVerbs{
                let customIncomingVerb: Verb = Verb(firstPrinciplePart: Word[customFirstPrinciplePart], secondPrinciplePart: Word[customSecondPrinciplePart], thirdPrinciplePart: Word[customThirdPrinciplePart], fourthPrinciplePart: Word[customFourthPrinciplePart], definition: Word[customDefinition])
                WordsArray.insert(customIncomingVerb, atIndex: customI)
                customI++
            }
            
            for Word in customNonConjugatables{
                let customIncomingNonConjugatable: nonConjugatable = nonConjugatable(latinFormInput: Word[customLatin], englishFormInput: Word[customDefinition])
                WordsArray.insert(customIncomingNonConjugatable, atIndex: customI)
                customI++
            }
            
            sortedWordsArray = WordsArray.sorted{ $0.latinSearchTerm.lowercaseString < $1.latinSearchTerm.lowercaseString}
            for word in sortedWordsArray{
                println("Latin Search Term: \(word.latinSearchTerm), English Search Term: \(word.englishSearchTerm), Part of Speech: \(word.partOfSpeech)")
            }
            
            
        }
            
            
        else{
            let pathToBundledDB = NSBundle.mainBundle().pathForResource("UserData", ofType: "sqlite")
            let pathToDevice = pathToDocsFolder().stringByAppendingPathComponent("/UserData.sqlite")
            var error: NSError?
            if(theFileManager.copyItemAtPath(pathToBundledDB!, toPath: pathToDevice, error: &error)){
                println("File was copied from \(pathToBundledDB!) to \(pathToDevice)")
                let alertController = UIAlertController(title: "File Error", message: "User Library File was copied from \(pathToBundledDB!) to \(pathToDevice)", preferredStyle: .Alert)
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in }
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true) {}
            }
            else{
                println("Failure: File did not copy successfully")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.FilteredWordsArray.count
        }
        else{
            return self.WordsArray.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if tableView == self.searchDisplayController?.searchResultsTableView{
            let word = sortedFilteredWordsArray[indexPath.row]
            if let noun = word as? Noun{
                if searchLanguage == "Latin"{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("nounCell", forIndexPath: indexPath) as LatinTableViewCell
                    cell.textLabel!.text = noun.nominative.singular.lowercaseString + ", " + noun.genitive.singular.lowercaseString
                    cell.detailTextLabel!.text = noun.Definition.lowercaseString
                    println("Text Label: \(cell.textLabel!.text), Detail Text Label: \(cell.detailTextLabel!.text)")
                }
                else{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("nounCell", forIndexPath: indexPath) as LatinTableViewCell
                    cell.textLabel!.text = noun.Definition.lowercaseString
                    cell.detailTextLabel!.text = noun.nominative.singular.lowercaseString + ", " + noun.genitive.singular.lowercaseString
                    println("Text Label: \(cell.textLabel!.text), Detail Text Label: \(cell.detailTextLabel!.text)")
                }
            }
                
            else if let nonConjugatable = word as? nonConjugatable{
                if searchLanguage == "Latin"{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("nonConjugatableCell", forIndexPath: indexPath) as LatinTableViewCell
                    cell.textLabel!.text = nonConjugatable.latinForm
                    cell.detailTextLabel!.text = nonConjugatable.englishForm
                }
                else{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("nonConjugatableCell", forIndexPath: indexPath) as LatinTableViewCell
                    cell.textLabel!.text = nonConjugatable.englishForm
                    cell.detailTextLabel!.text = nonConjugatable.latinForm
                }
            }
                
            else{
                let verb = word as Verb
                if searchLanguage == "Latin"{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("verbCell", forIndexPath: indexPath) as LatinTableViewCell
                    cell.textLabel!.text = verb.firstPrinciplePart.lowercaseString + ", " + verb.secondPrinciplePart.lowercaseString
                    cell.detailTextLabel!.text = verb.definition.lowercaseString
                    println("Text Label: \(cell.textLabel!.text), Detail Text Label: \(cell.detailTextLabel!.text)")
                }
                else{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("verbCell", forIndexPath: indexPath) as LatinTableViewCell
                    cell.textLabel!.text = verb.definition.lowercaseString
                    cell.detailTextLabel!.text = verb.firstPrinciplePart + ", " + verb.secondPrinciplePart.lowercaseString
                    println("Text Label: \(cell.textLabel!.text), Detail Text Label: \(cell.detailTextLabel!.text)")
                }
            }
        }
        
        else{
            let word = sortedWordsArray[indexPath.row]
            if let noun = word as? Noun{
                if searchLanguage == "Latin"{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("nounCell", forIndexPath: indexPath) as LatinTableViewCell
                    cell.textLabel!.text = noun.nominative.singular.lowercaseString + ", " + noun.genitive.singular.lowercaseString
                    cell.detailTextLabel!.text = noun.Definition.lowercaseString
                    println("Text Label: \(cell.textLabel!.text), Detail Text Label: \(cell.detailTextLabel!.text)")
                }
                else{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("nounCell", forIndexPath: indexPath) as LatinTableViewCell
                    cell.textLabel!.text = noun.Definition.lowercaseString
                    cell.detailTextLabel!.text = noun.nominative.singular.lowercaseString + ", " + noun.genitive.singular.lowercaseString
                    println("Text Label: \(cell.textLabel!.text), Detail Text Label: \(cell.detailTextLabel!.text)")
                }
            }
                
            else if let nonConjugatable = word as? nonConjugatable{
                if searchLanguage == "Latin"{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("nonConjugatableCell", forIndexPath: indexPath) as LatinTableViewCell
                    cell.textLabel!.text = nonConjugatable.latinForm
                    cell.detailTextLabel!.text = nonConjugatable.englishForm
                }
                else{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("nonConjugatableCell", forIndexPath: indexPath) as LatinTableViewCell
                    cell.textLabel!.text = nonConjugatable.englishForm
                    cell.detailTextLabel!.text = nonConjugatable.latinForm
                }
            }
                
            else{
                let verb = word as Verb
                if searchLanguage == "Latin"{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("verbCell", forIndexPath: indexPath) as LatinTableViewCell
                    cell.textLabel!.text = verb.firstPrinciplePart.lowercaseString + ", " + verb.secondPrinciplePart.lowercaseString
                    cell.detailTextLabel!.text = verb.definition.lowercaseString
                    println("Text Label: \(cell.textLabel!.text), Detail Text Label: \(cell.detailTextLabel!.text)")
                }
                else{
                    cell = self.tableView.dequeueReusableCellWithIdentifier("verbCell", forIndexPath: indexPath) as LatinTableViewCell
                    cell.textLabel!.text =   verb.definition.lowercaseString
                    cell.detailTextLabel!.text =  verb.firstPrinciplePart.lowercaseString + ", " + verb.secondPrinciplePart.lowercaseString
                    println("Text Label: \(cell.textLabel!.text), Detail Text Label: \(cell.detailTextLabel!.text)")
                }
            }
        }
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

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

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
