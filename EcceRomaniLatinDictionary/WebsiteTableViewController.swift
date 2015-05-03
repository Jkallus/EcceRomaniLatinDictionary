//
//  WebsiteTableViewController.swift
//  EcceRomaniLatinDictionary
//
//  Created by Josh Kallus on 2/21/15.
//  Copyright (c) 2015 JMKLABS. All rights reserved.
//

import UIKit

class WebsiteTableViewController: UITableViewController {

    
    var word: Word?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //http://www.archives.nd.edu/cgi-bin/wordz.pl?keyword=puer
        //http://www.archives.nd.edu/cgi-bin/wordz.pl?keyword=malus
        //http://www.archives.nd.edu/cgi-bin/wordz.pl?keyword=amo
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let webViewController :WebViewController = segue.destinationViewController as! WebViewController
        if segue.identifier == "wiktionarySegue"{

            if let noun = word as? Noun{
                webViewController.url = NSURL(string: ("http://en.wiktionary.org/wiki/\(noun.singular.nominative.latin.normalString())#latin"))
            }
            else if let verb = word as? Verb{
                webViewController.url = NSURL(string: "http://en.wiktionary.org/wiki/\(verb.active.present.firstPerson.singular.latin.normalString())#latin")
            }
                
            else if word is Adverb{
                let adverb = word as! Adverb
                webViewController.url = NSURL(string: "http://en.wiktionary.org/wiki/\(adverb.positive.latin.normalString())#latin")
            }
            
            else if word is Adjective{
                let adjective:Adjective = word as! Adjective
                webViewController.url = NSURL(string: "http://en.wiktionary.org/wiki/\(adjective.masculine.nominative.singular.positive.latin.normalString())#latin")
            }
            
            
            else{
                let nonConjugatableWord = word as! nonConjugatable
                webViewController.url = NSURL(string: "http://en.wiktionary.org/wiki/\(nonConjugatableWord.latinForm.normalString())#latin")
            }
            
            (segue.destinationViewController as! WebViewController).title = "Wiktionary"
        }
        else if segue.identifier == "whitakerSegue"{
            if let noun = word as? Noun{
                webViewController.url = NSURL(string: "http://www.archives.nd.edu/cgi-bin/wordz.pl?keyword=\(noun.singular.nominative.latin.normalString())")
            }
            else if let verb = word as? Verb{
                webViewController.url = NSURL(string: "http://www.archives.nd.edu/cgi-bin/wordz.pl?keyword=\(verb.active.present.firstPerson.singular.latin.normalString())")
            }
                
            else if word is Adverb{
                let adverb = word as! Adverb
                webViewController.url = NSURL(string: "http://www.archives.nd.edu/cgi-bin/wordz.pl?keyword=\(adverb.positive.latin.normalString())")
            }
                
            else if word is Adjective{
                let adjective: Adjective = word as! Adjective
                webViewController.url = NSURL(string: "http://www.archives.nd.edu/cgi-bin/wordz.pl?keyword=\(adjective.masculine.nominative.singular.positive.latin.normalString())")
            }
                
            else{
                let nonConjugatableWord = word as! nonConjugatable
                webViewController.url = NSURL(string: "http://www.archives.nd.edu/cgi-bin/wordz.pl?keyword=\(nonConjugatableWord.latinForm.normalString())")
            }

            webViewController.title = "William Whitaker's Words"
        }
    }
}


extension String{
    func normalString() -> String{
        let characterString = String(self)
        var returnString: String = ""
        for letter: Character in characterString{
            switch letter{
            case "ā":
                returnString.append(UnicodeScalar("a"))
            case "ē":
                returnString.append(UnicodeScalar("e"))
            case "ī":
                returnString.append(UnicodeScalar("i"))
            case "ō":
                returnString.append(UnicodeScalar("o"))
            case "ū":
                returnString.append(UnicodeScalar("u"))
            case "Ā":
                returnString.append(UnicodeScalar("A"))
            case "Ē":
                returnString.append(UnicodeScalar("E"))
            case "Ī":
                returnString.append(UnicodeScalar("I"))
            case "Ō":
                returnString.append(UnicodeScalar("O"))
            case "Ū":
                returnString.append(UnicodeScalar("U"))
            default:
                returnString.append(letter)
            }
        }
        return returnString
    }
}