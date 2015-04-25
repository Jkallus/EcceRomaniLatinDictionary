//
//  Adverb.swift
//  EcceRomaniLatinDictionary
//
//  Created by Josh Kallus on 4/24/15.
//  Copyright (c) 2015 JMKLABS. All rights reserved.
//

import Foundation

struct adverbForm {
    var latin:String = ""
    var english:String = ""
    
    init(latinInput: String, englishInput: String){
        self.latin = latinInput
        self.english = englishInput
    }
    
    init(){}
}



class Adverb: Word{
    var positive: adverbForm
    var comparative: adverbForm
    var superlative: adverbForm
    init(positiveInput: String, comparativeInput: String, superlativeInput: String, englishInput:String){
        self.positive = derivePositive(positiveInput, englishInput)
        self.comparative = deriveComparative(comparativeInput, englishInput)
        self.superlative = deriveSuperlative(superlativeInput, englishInput)
        super.init(latinSearchTerm: "\(positiveInput), \(comparativeInput), \(superlativeInput)", englishSearchTerm: englishInput, partOfSpeech: "Adverb")
    }
}


func derivePositive(positiveInput:String, englishInput: String) -> adverbForm{
   var returnForm: adverbForm = adverbForm()
    returnForm.latin = positiveInput
    returnForm.english = englishInput
    
    return returnForm
}

func deriveComparative(comparativeInput: String, englishInput: String) -> adverbForm{
    var returnForm:adverbForm = adverbForm()
    returnForm.latin = comparativeInput
    
    if englishInput.hasPrefix("with"){
        let ending: String = englishInput.substringWithRange(Range<String.Index>(start: advance(englishInput.startIndex, 4), end: englishInput.endIndex))
        returnForm.english = "with rather \(ending)"
    }
    else{
        returnForm.english = "rather \(englishInput)"
    }

    return returnForm
   
}

func deriveSuperlative(superlativeInput: String, englishInput: String) -> adverbForm{
    var returnForm:adverbForm = adverbForm()
    returnForm.latin = superlativeInput
    
    if englishInput.hasPrefix("with"){
        let ending: String = englishInput.substringWithRange(Range<String.Index>(start: advance(englishInput.startIndex, 4), end: englishInput.endIndex))
        returnForm.english = "with most \(ending)"
    }
    else{
        returnForm.english = "most \(englishInput)"
    }

    return returnForm
}