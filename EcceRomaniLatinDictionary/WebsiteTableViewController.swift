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
                println("Pre:  \(webViewController.url)")
                println("String: http://en.wiktionary.org/wiki/\(noun.nominative.singular.normalString())#latin")
                webViewController.url = NSURL(string: ("http://en.wiktionary.org/wiki/\(noun.nominative.singular.normalString())#latin"))
                println("Post:  \(webViewController.url)")
            }
            else if let verb = word as? Verb{
                println("Pre:  \(webViewController.url)")
                webViewController.url = NSURL(string: "http://en.wiktionary.org/wiki/\(verb.active.present.firstPerson.singular.latin.normalString())#latin")
                println("String: http://en.wiktionary.org/wiki/\(verb.firstPrinciplePart)#latin")
                println("Post:  \(webViewController.url)")
            }
            else{
                let nonConjugatableWord = word as! nonConjugatable
                println("Pre:  \(webViewController.url)")
                webViewController.url = NSURL(string: "http://en.wiktionary.org/wiki/\(nonConjugatableWord.latinForm.normalString())#latin")
                println("String: http://en.wiktionary.org/wiki/\(nonConjugatableWord.latinForm.normalString())#latin")
                println("Post:  \(webViewController.url)")
            }
            
            (segue.destinationViewController as! WebViewController).title = "Wiktionary"
        }
        else if segue.identifier == "whitakerSegue"{
            if let noun = word as? Noun{
                println("Pre:  \(webViewController.url)")
                webViewController.url = NSURL(string: "http://www.archives.nd.edu/cgi-bin/wordz.pl?keyword=\(noun.nominative.singular.normalString())")
                println(" String: http://www.archives.nd.edu/cgi-bin/wordz.pl?keyword=\(noun.nominative.singular.normalString())")
                println("Post:  \(webViewController.url)")
            }
            else if let verb = word as? Verb{
                println("Pre:  \(webViewController.url)")
                webViewController.url = NSURL(string: "http://www.archives.nd.edu/cgi-bin/wordz.pl?keyword=\(verb.active.present.firstPerson.singular.latin.normalString())")
                println("String: http://www.archives.nd.edu/cgi-bin/wordz.pl?keyword=\(verb.firstPrinciplePart)")
                println("Post:  \(webViewController.url)")
            }
            else{
                let nonConjugatableWord = word as! nonConjugatable
                println("Pre:  \(webViewController.url)")
                webViewController.url = NSURL(string: "http://www.archives.nd.edu/cgi-bin/wordz.pl?keyword=\(nonConjugatableWord.latinForm.normalString())")
                println("String: http://www.archives.nd.edu/cgi-bin/wordz.pl?keyword=\(nonConjugatableWord.latinForm.normalString())")
                println("Post:  \(webViewController.url)")
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