//
//  Noun.swift
//  LatinTableView
//
//  Created by Josh Kallus on 11/21/14.
//  Copyright (c) 2014 JMK Labs. All rights reserved.
//

import Foundation


struct nounNumber {
    var nominative: form = form()
    var genitive: form = form()
    var dative: form = form()
    var accusative: form = form()
    var ablative: form = form()
    var vocative: form = form()
    init(){}
}

class Noun: Word{
    
    var gender: String
    var declension: Int
    
    var definition: String
    
    var singular: nounNumber
    var plural: nounNumber
    
    init(nominativeSingularInput: String, genitiveSingularInput: String, genderInput: String, definitionInput: String, declensionInput: Int){
        
        self.gender = genderInput
        self.declension = declensionInput
        self.definition = definitionInput
        
        let noun: simpleNoun = simpleNoun(nominativeSingularInput: nominativeSingularInput, genitiveSingularInput: genitiveSingularInput, genderInput: genderInput, definitionInput: definitionInput, declensionInput: declensionInput)
        
        self.singular = deriveSingular(noun)
        self.plural = derivePlural(noun)
        
        super.init(latinSearchTerm: nominativeSingularInput + ", " + genitiveSingularInput, englishSearchTerm: definitionInput, partOfSpeech: "Noun")
        
    }
}


func deriveSingular(noun: simpleNoun) -> nounNumber{
    var singular: nounNumber = nounNumber()
    let root: String
    
    let nominativeDefinition = "subject"
    let genitiveDefinition = "subject's ownership"
    let dativeDefinition = "subject's indirect object"
    let accusativeDefinition = "subject's direct object"
    let ablativeDefinition = "various meanings"
    let vocativeDefinition = "identifies who is being addressed"
    
    if noun.declension == 1{
        root = noun.nominativeSingular.substringWithRange(Range<String.Index>(start: noun.nominativeSingular.startIndex, end: advance(noun.nominativeSingular.endIndex, -1)))
        
        singular.nominative.latin = root + "a"
        singular.nominative.english = nominativeDefinition
        
        singular.genitive.latin = root + "ae"
        singular.genitive.english = genitiveDefinition
        
        singular.dative.latin = root + "ae"
        singular.dative.english = dativeDefinition
        
        singular.accusative.latin = root + "am"
        singular.accusative.english = accusativeDefinition
        
        singular.ablative.latin = root + "ā"
        singular.ablative.english = ablativeDefinition
        
        singular.vocative.latin = root + "a"
        singular.vocative.english = vocativeDefinition
        
    }
    else if noun.declension == 2{
        if noun.nominativeSingular.hasSuffix("us") || noun.nominativeSingular.hasSuffix("um"){
            root = noun.nominativeSingular.substringWithRange(Range<String.Index>(start: noun.nominativeSingular.startIndex, end: advance(noun.nominativeSingular.endIndex, -2)))
            
            singular.nominative.latin = root + "us"
            singular.nominative.english = nominativeDefinition
            
            singular.genitive.latin = root + "ī"
            singular.genitive.english = genitiveDefinition
            
            singular.dative.latin = root + "ō"
            singular.dative.english = dativeDefinition
            
            singular.accusative.latin = root + "um"
            singular.accusative.english = accusativeDefinition
            
            singular.ablative.latin = root + "ō"
            singular.ablative.english = ablativeDefinition
            
            singular.vocative.latin = root + "e"
            singular.vocative.english = vocativeDefinition
        }
        else{
            root = noun.nominativeSingular.substringWithRange(Range<String.Index>(start: noun.genitiveSingular.startIndex, end: advance(noun.genitiveSingular.endIndex, -1)))
            
            singular.nominative.latin = noun.nominativeSingular
            singular.nominative.english = nominativeDefinition
            
            singular.genitive.latin = root + "ī"
            singular.genitive.english = genitiveDefinition
            
            singular.dative.latin = root + "ō"
            singular.dative.english = dativeDefinition
            
            singular.accusative.latin = root + "um"
            singular.accusative.english = accusativeDefinition
            
            singular.ablative.latin = root + "ō"
            singular.ablative.english = ablativeDefinition
            
            singular.vocative.latin = root + "e"
            singular.vocative.english = vocativeDefinition
        }
    }
    else if noun.declension == 3{
        
        if noun.gender == "masculine" || noun.gender == "feminine"{
            root = noun.genitiveSingular.substringWithRange(Range<String.Index>(start: noun.genitiveSingular.startIndex, end: advance(noun.genitiveSingular.endIndex, -2)))
            
            singular.nominative.latin = noun.nominativeSingular
            singular.nominative.english = nominativeDefinition
            
            singular.genitive.latin = root + "is"
            singular.genitive.english = genitiveDefinition
            
            singular.dative.latin = root + "ī"
            singular.dative.english = dativeDefinition
            
            singular.accusative.latin = root + "em"
            singular.accusative.english = accusativeDefinition
            
            singular.ablative.latin = root + "e"
            singular.ablative.english = ablativeDefinition
            
            singular.vocative.latin = noun.nominativeSingular
            singular.vocative.english = vocativeDefinition
            
        }
        else{ //Neuter
            root = noun.genitiveSingular.substringWithRange(Range<String.Index>(start: noun.genitiveSingular.startIndex, end: advance(noun.genitiveSingular.endIndex, -2)))
            
            singular.nominative.latin = noun.nominativeSingular
            singular.nominative.english = nominativeDefinition
            
            singular.genitive.latin = root + "is"
            singular.genitive.english = genitiveDefinition
            
            singular.dative.latin = root + "ī"
            singular.dative.english = dativeDefinition
            
            singular.accusative.latin = noun.nominativeSingular
            singular.accusative.english = accusativeDefinition
            
            singular.ablative.latin = root + "e"
            singular.ablative.english = ablativeDefinition
            
            singular.vocative.latin = noun.nominativeSingular
            singular.vocative.english = vocativeDefinition
            
        }
    }
    else if noun.declension == 4{
        
        if noun.gender == "masculine"{
            root = noun.nominativeSingular.substringWithRange(Range<String.Index>(start: noun.nominativeSingular.startIndex, end: advance(noun.nominativeSingular.endIndex, -2)))
            
            
            singular.nominative.latin = root + "us"
            singular.nominative.english = nominativeDefinition
            
            singular.genitive.latin = root + "ūs"
            singular.genitive.english = genitiveDefinition
            
            singular.dative.latin = root + "uī"
            singular.dative.english = dativeDefinition
            
            singular.accusative.latin = root + "um"
            singular.accusative.english = accusativeDefinition
            
            singular.ablative.latin = root + "ū"
            singular.ablative.english = ablativeDefinition
            
            singular.vocative.latin = root + "us"
            singular.vocative.english = vocativeDefinition
            
        }
            
        else { //Neuter
            root = noun.nominativeSingular.substringWithRange(Range<String.Index>(start: noun.nominativeSingular.startIndex, end: advance(noun.nominativeSingular.endIndex, -2)))
            
            
            singular.nominative.latin = root + "u"
            singular.nominative.english = nominativeDefinition
            
            singular.genitive.latin = root + "ūs"
            singular.genitive.english = genitiveDefinition
            
            singular.dative.latin = root + "ū"
            singular.dative.english = dativeDefinition
            
            singular.accusative.latin = root + "ū"
            singular.accusative.english = accusativeDefinition
            
            singular.ablative.latin = root + "ū"
            singular.ablative.english = ablativeDefinition
            
            singular.vocative.latin = root + "ū"
            singular.vocative.english = vocativeDefinition
            
        }
        
    }
    else{
        root = noun.nominativeSingular.substringWithRange(Range<String.Index>(start: noun.nominativeSingular.startIndex, end: advance(noun.nominativeSingular.endIndex, -2)))
        
        singular.nominative.latin = root + "ēs"
        singular.nominative.english = nominativeDefinition
        
        singular.genitive.latin = root + "eī"
        singular.genitive.english = genitiveDefinition
        
        singular.dative.latin = root + "eī"
        singular.dative.english = dativeDefinition
        
        singular.accusative.latin = root + "em"
        singular.accusative.english = accusativeDefinition
        
        singular.ablative.latin = root + "ē"
        singular.ablative.english = ablativeDefinition
        
        singular.vocative.latin = root + "ēs"
        singular.vocative.english = vocativeDefinition
        
    }
    
    return singular
}

func derivePlural(noun: simpleNoun) -> nounNumber{
    var plural: nounNumber = nounNumber()
    let root: String
    
    let nominativeDefinition = "subject"
    let genitiveDefinition = "subject's ownership"
    let dativeDefinition = "subject's indirect object"
    let accusativeDefinition = "subject's direct object"
    let ablativeDefinition = "various meanings"
    let vocativeDefinition = "identifies who is being addressed"
    
    
    if noun.declension == 1{
        root = noun.nominativeSingular.substringWithRange(Range<String.Index>(start: noun.nominativeSingular.startIndex, end: advance(noun.nominativeSingular.endIndex, -1)))
        
        plural.nominative.latin = root + "ae"
        plural.nominative.english = nominativeDefinition
        
        plural.genitive.latin = root + "arum"
        plural.genitive.english = genitiveDefinition
        
        plural.dative.latin = root + "īs"
        plural.dative.english = dativeDefinition
        
        plural.accusative.latin = root + "ās"
        plural.accusative.english = accusativeDefinition
        
        plural.ablative.latin = root + "īs"
        plural.ablative.english = ablativeDefinition
        
        plural.vocative.latin = root + "ae"
        plural.vocative.english = vocativeDefinition
        
    }
    else if noun.declension == 2{
        if noun.nominativeSingular.hasSuffix("us") || noun.nominativeSingular.hasSuffix("um"){
            root = noun.nominativeSingular.substringWithRange(Range<String.Index>(start: noun.nominativeSingular.startIndex, end: advance(noun.nominativeSingular.endIndex, -2)))
            
            plural.nominative.latin = root + "ī"
            plural.nominative.english = nominativeDefinition
            
            plural.genitive.latin = root + "orum"
            plural.genitive.english = genitiveDefinition
            
            plural.dative.latin = root + "īs"
            plural.dative.english = dativeDefinition
            
            plural.accusative.latin = root + "ōs"
            plural.accusative.english = accusativeDefinition
            
            plural.ablative.latin = root + "īs"
            plural.ablative.english = ablativeDefinition
            
            plural.vocative.latin = root + "ī"
            plural.vocative.english = vocativeDefinition
        }
        else{
            root = noun.nominativeSingular.substringWithRange(Range<String.Index>(start: noun.nominativeSingular.startIndex, end: advance(noun.nominativeSingular.endIndex, 0)))
            
            plural.nominative.latin = root + "ī"
            plural.nominative.english = nominativeDefinition
            
            plural.genitive.latin = root + "orum"
            plural.genitive.english = genitiveDefinition
            
            plural.dative.latin = root + "īs"
            plural.dative.english = dativeDefinition
            
            plural.accusative.latin = root + "ōs"
            plural.accusative.english = accusativeDefinition
            
            plural.ablative.latin = root + "īs"
            plural.ablative.english = ablativeDefinition
            
            plural.vocative.latin = root + "ī"
            plural.vocative.english = vocativeDefinition        }
    }
    else if noun.declension == 3{
        if noun.gender == "masculine" || noun.gender == "feminine"{
            root = noun.genitiveSingular.substringWithRange(Range<String.Index>(start: noun.genitiveSingular.startIndex, end: advance(noun.genitiveSingular.endIndex, -2)))
            
            plural.nominative.latin = root + "ēs"
            plural.nominative.english = nominativeDefinition
            
            plural.genitive.latin = root + "um"
            plural.genitive.english = genitiveDefinition
            
            plural.dative.latin = root + "ibus"
            plural.dative.english = dativeDefinition
            
            plural.accusative.latin = root + "ēs"
            plural.accusative.english = accusativeDefinition
            
            plural.ablative.latin = root + "ibus"
            plural.ablative.english = ablativeDefinition
            
            plural.vocative.latin = root + "ēs"
            plural.vocative.english = vocativeDefinition
            
        }
        else{ //Neuter
            root = noun.genitiveSingular.substringWithRange(Range<String.Index>(start: noun.genitiveSingular.startIndex, end: advance(noun.genitiveSingular.endIndex, -2)))
            
            plural.nominative.latin = root + "a"
            plural.nominative.english = nominativeDefinition
            
            plural.genitive.latin = root + "um"
            plural.genitive.english = genitiveDefinition
            
            plural.dative.latin = root + "ibus"
            plural.dative.english = dativeDefinition
            
            plural.accusative.latin = root + "a"
            plural.accusative.english = accusativeDefinition
            
            plural.ablative.latin = root + "ibus"
            plural.ablative.english = ablativeDefinition
            
            plural.vocative.latin = root + "a"
            plural.vocative.english = vocativeDefinition
            
        }
    }
    else if noun.declension == 4{
        if noun.gender == "masculine"{
            root = noun.nominativeSingular.substringWithRange(Range<String.Index>(start: noun.nominativeSingular.startIndex, end: advance(noun.nominativeSingular.endIndex, -2)))
            
            
            plural.nominative.latin = root + "ūs"
            plural.nominative.english = nominativeDefinition
            
            plural.genitive.latin = root + "uum"
            plural.genitive.english = genitiveDefinition
            
            plural.dative.latin = root + "ibus"
            plural.dative.english = dativeDefinition
            
            plural.accusative.latin = root + "ūs"
            plural.accusative.english = accusativeDefinition
            
            plural.ablative.latin = root + "ibus"
            plural.ablative.english = ablativeDefinition
            
            plural.vocative.latin = root + "ūs"
            plural.vocative.english = vocativeDefinition
            
        }
        else { //Neuter
            root = noun.nominativeSingular.substringWithRange(Range<String.Index>(start: noun.nominativeSingular.startIndex, end: advance(noun.nominativeSingular.endIndex, -2)))
            
            
            plural.nominative.latin = root + "ua"
            plural.nominative.english = nominativeDefinition
            
            plural.genitive.latin = root + "uum"
            plural.genitive.english = genitiveDefinition
            
            plural.dative.latin = root + "ibus"
            plural.dative.english = dativeDefinition
            
            plural.accusative.latin = root + "ua"
            plural.accusative.english = accusativeDefinition
            
            plural.ablative.latin = root + "ibus"
            plural.ablative.english = ablativeDefinition
            
            plural.vocative.latin = root + "ua"
            plural.vocative.english = vocativeDefinition
            
        }
    }
    else{
        root = noun.nominativeSingular.substringWithRange(Range<String.Index>(start: noun.nominativeSingular.startIndex, end: advance(noun.nominativeSingular.endIndex, -2)))
        
        plural.nominative.latin = root + "ēs"
        plural.nominative.english = nominativeDefinition
        
        plural.genitive.latin = root + "erum"
        plural.genitive.english = genitiveDefinition
        
        plural.dative.latin = root + "ebus"
        plural.dative.english = dativeDefinition
        
        plural.accusative.latin = root + "es"
        plural.accusative.english = accusativeDefinition
        
        plural.ablative.latin = root + "ebus"
        plural.ablative.english = ablativeDefinition
        
        plural.vocative.latin = root + "ēs"
        plural.vocative.english = vocativeDefinition
        
    }
    
    return plural
}
