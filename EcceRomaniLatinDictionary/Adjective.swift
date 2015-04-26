//
//  Adjective.swift
//  EcceRomaniLatinDictionary
//
//  Created by Josh Kallus on 4/25/15.
//  Copyright (c) 2015 JMKLABS. All rights reserved.
//

import Foundation

struct form{
    var latin: String = ""
    var english: String = ""
    init(){}
}

struct degree{
    var positive: form = form()
    var comparative: form = form()
    var superlative: form = form()
    init(){}
}

struct number{
    var singular: degree = degree()
    var plural: degree = degree()
    init(){}
}

struct declension{
    var nominative: number = number()
    var genitive: number = number()
    var dative: number = number()
    var accusative: number = number()
    var ablative: number = number()
    var vocative: number = number()
    init(){}
}

class adjective{
    var masculine: declension
    var feminine: declension
    var neuter: declension
    
    init(masculineNominativeSingularPositiveInput: String, feminineNominativeSingularPositiveInput: String, neuterNominativeSingularPositiveInput: String, definitionInput: String){
        self.masculine = deriveMasculine(masculineNominativeSingularPositiveInput, feminineNominativeSingularPositiveInput, neuterNominativeSingularPositiveInput, definitionInput)
        self.feminine = deriveFeminine(masculineNominativeSingularPositiveInput, feminineNominativeSingularPositiveInput, neuterNominativeSingularPositiveInput, definitionInput)
        self.neuter = deriveNeuter(masculineNominativeSingularPositiveInput, feminineNominativeSingularPositiveInput, neuterNominativeSingularPositiveInput, definitionInput)
    }
}

//Masculine
func deriveMasculine(masculineNominativeSingularPositiveInput: String, feminineNominativeSingularPositiveInput: String, neuterNominativeSingularPositiveInput: String, definitionInput: String) -> declension{
    var returnDeclension: declension = declension()
    
    if feminineNominativeSingularPositiveInput.hasSuffix("a"){
        let root = feminineNominativeSingularPositiveInput.substringWithRange(Range<String.Index>(start: feminineNominativeSingularPositiveInput.startIndex, end: advance(feminineNominativeSingularPositiveInput.endIndex, -1)))
        let positiveDefinition = definitionInput
        let comparativeDefinition = "rather " + definitionInput
        let superlativeDefinition = "most " + definitionInput
        
        //Positive
        returnDeclension.nominative.singular.positive.latin = root + "us"
        returnDeclension.genitive.singular.positive.latin = root + "ī"
        returnDeclension.dative.singular.positive.latin = root + "ō"
        returnDeclension.accusative.singular.positive.latin = root + "um"
        returnDeclension.ablative.singular.positive.latin = root + "ō"
        returnDeclension.vocative.singular.positive.latin = root + "e"
        
        returnDeclension.nominative.plural.positive.latin = root + "ī"
        returnDeclension.genitive.plural.positive.latin = root + "orum"
        returnDeclension.dative.plural.positive.latin = root + "īs"
        returnDeclension.accusative.plural.positive.latin = root + "ōs"
        returnDeclension.ablative.plural.positive.latin = root + "īs"
        returnDeclension.vocative.plural.positive.latin = root + "ī"
        
        returnDeclension.nominative.singular.positive.english = positiveDefinition
        returnDeclension.genitive.singular.positive.english = positiveDefinition
        returnDeclension.dative.singular.positive.english = positiveDefinition
        returnDeclension.accusative.singular.positive.english = positiveDefinition
        returnDeclension.ablative.singular.positive.english = positiveDefinition
        returnDeclension.vocative.singular.positive.english = positiveDefinition
        
        returnDeclension.nominative.plural.positive.english = positiveDefinition
        returnDeclension.genitive.plural.positive.english = positiveDefinition
        returnDeclension.dative.plural.positive.english = positiveDefinition
        returnDeclension.accusative.plural.positive.english = positiveDefinition
        returnDeclension.ablative.plural.positive.english = positiveDefinition
        returnDeclension.vocative.plural.positive.english = positiveDefinition
        
        //Comparative
        let comparativeRoot = root + "ior"
        returnDeclension.nominative.singular.comparative.latin = comparativeRoot
        returnDeclension.genitive.singular.comparative.latin = comparativeRoot + "is"
        returnDeclension.dative.singular.comparative.latin = comparativeRoot + "ī"
        returnDeclension.accusative.singular.comparative.latin = comparativeRoot + "em"
        returnDeclension.ablative.singular.comparative.latin = comparativeRoot + "e"
        returnDeclension.vocative.singular.comparative.latin = comparativeRoot
        
        returnDeclension.nominative.plural.comparative.latin = comparativeRoot + "ēs"
        returnDeclension.genitive.plural.comparative.latin = comparativeRoot + "um"
        returnDeclension.dative.plural.comparative.latin = comparativeRoot + "ibus"
        returnDeclension.accusative.plural.comparative.latin = comparativeRoot + "ēs"
        returnDeclension.ablative.plural.comparative.latin = comparativeRoot + "ibus"
        returnDeclension.vocative.plural.comparative.latin = comparativeRoot + "ēs"
        
        returnDeclension.nominative.singular.comparative.english = comparativeDefinition
        returnDeclension.genitive.singular.comparative.english = comparativeDefinition
        returnDeclension.dative.singular.comparative.english = comparativeDefinition
        returnDeclension.accusative.singular.comparative.english = comparativeDefinition
        returnDeclension.ablative.singular.comparative.english = comparativeDefinition
        returnDeclension.vocative.singular.comparative.english = comparativeDefinition
        
        returnDeclension.nominative.plural.comparative.english = comparativeDefinition
        returnDeclension.genitive.plural.comparative.english = comparativeDefinition
        returnDeclension.dative.plural.comparative.english = comparativeDefinition
        returnDeclension.accusative.plural.comparative.english = comparativeDefinition
        returnDeclension.ablative.plural.comparative.english = comparativeDefinition
        returnDeclension.vocative.plural.comparative.english = comparativeDefinition
        
        //Superlative
        let superlativeRoot: String
        if masculineNominativeSingularPositiveInput.hasSuffix("er"){
            superlativeRoot = root + "rim"
        }
        else{
            superlativeRoot = root + "lim"
        }
        
        returnDeclension.nominative.singular.superlative.latin = superlativeRoot + "us"
        returnDeclension.genitive.singular.superlative.latin = superlativeRoot + "ī"
        returnDeclension.dative.singular.superlative.latin = superlativeRoot + "ō"
        returnDeclension.accusative.singular.superlative.latin = superlativeRoot + "um"
        returnDeclension.ablative.singular.superlative.latin = superlativeRoot + "ō"
        returnDeclension.vocative.singular.superlative.latin = superlativeRoot + "e"
        
        returnDeclension.nominative.plural.superlative.latin = superlativeRoot + "ī"
        returnDeclension.genitive.plural.superlative.latin = superlativeRoot + "orum"
        returnDeclension.dative.plural.superlative.latin = superlativeRoot + "īs"
        returnDeclension.accusative.plural.superlative.latin = superlativeRoot + "ōs"
        returnDeclension.ablative.plural.superlative.latin = superlativeRoot + "īs"
        returnDeclension.vocative.plural.superlative.latin = superlativeRoot + "ī"
        
        returnDeclension.nominative.singular.superlative.english = superlativeDefinition
        returnDeclension.genitive.singular.superlative.english = superlativeDefinition
        returnDeclension.dative.singular.superlative.english = superlativeDefinition
        returnDeclension.accusative.singular.superlative.english = superlativeDefinition
        returnDeclension.ablative.singular.superlative.english = superlativeDefinition
        returnDeclension.vocative.singular.superlative.english = superlativeDefinition
        
        returnDeclension.nominative.plural.superlative.english = superlativeDefinition
        returnDeclension.genitive.plural.superlative.english = superlativeDefinition
        returnDeclension.dative.plural.superlative.english = superlativeDefinition
        returnDeclension.accusative.plural.superlative.english = superlativeDefinition
        returnDeclension.ablative.plural.superlative.english = superlativeDefinition
        returnDeclension.vocative.plural.superlative.english = superlativeDefinition
    }
    
    return returnDeclension
}


func deriveFeminine(masculineNominativeSingularPositiveInput: String, feminineNominativeSingularPositiveInput: String, neuterNominativeSingularPositiveInput: String, definitionInput: String) -> declension{
    var returnDeclension: declension = declension()
    
    if feminineNominativeSingularPositiveInput.hasSuffix("a"){
        let root = feminineNominativeSingularPositiveInput.substringWithRange(Range<String.Index>(start: feminineNominativeSingularPositiveInput.startIndex, end: advance(feminineNominativeSingularPositiveInput.endIndex, -1)))
        let positiveDefinition = definitionInput
        let comparativeDefinition = "rather " + definitionInput
        let superlativeDefinition = "most " + definitionInput
        
        //Positive
        returnDeclension.nominative.singular.positive.latin = root + "a"
        returnDeclension.genitive.singular.positive.latin = root + "ae"
        returnDeclension.dative.singular.positive.latin = root + "ae"
        returnDeclension.accusative.singular.positive.latin = root + "am"
        returnDeclension.ablative.singular.positive.latin = root + "ā"
        returnDeclension.vocative.singular.positive.latin = root + "a"
        
        returnDeclension.nominative.plural.positive.latin = root + "ae"
        returnDeclension.genitive.plural.positive.latin = root + "arum"
        returnDeclension.dative.plural.positive.latin = root + "īs"
        returnDeclension.accusative.plural.positive.latin = root + "ās"
        returnDeclension.ablative.plural.positive.latin = root + "īs"
        returnDeclension.vocative.plural.positive.latin = root + "ae"
        
        returnDeclension.nominative.singular.positive.english = positiveDefinition
        returnDeclension.genitive.singular.positive.english = positiveDefinition
        returnDeclension.dative.singular.positive.english = positiveDefinition
        returnDeclension.accusative.singular.positive.english = positiveDefinition
        returnDeclension.ablative.singular.positive.english = positiveDefinition
        returnDeclension.vocative.singular.positive.english = positiveDefinition
        
        returnDeclension.nominative.plural.positive.english = positiveDefinition
        returnDeclension.genitive.plural.positive.english = positiveDefinition
        returnDeclension.dative.plural.positive.english = positiveDefinition
        returnDeclension.accusative.plural.positive.english = positiveDefinition
        returnDeclension.ablative.plural.positive.english = positiveDefinition
        returnDeclension.vocative.plural.positive.english = positiveDefinition
        
        //Comparative
        let comparativeRoot = root + "ior"
        returnDeclension.nominative.singular.comparative.latin = comparativeRoot
        returnDeclension.genitive.singular.comparative.latin = comparativeRoot + "is"
        returnDeclension.dative.singular.comparative.latin = comparativeRoot + "ī"
        returnDeclension.accusative.singular.comparative.latin = comparativeRoot + "em"
        returnDeclension.ablative.singular.comparative.latin = comparativeRoot + "e"
        returnDeclension.vocative.singular.comparative.latin = comparativeRoot
        
        returnDeclension.nominative.plural.comparative.latin = comparativeRoot + "ēs"
        returnDeclension.genitive.plural.comparative.latin = comparativeRoot + "um"
        returnDeclension.dative.plural.comparative.latin = comparativeRoot + "ibus"
        returnDeclension.accusative.plural.comparative.latin = comparativeRoot + "ēs"
        returnDeclension.ablative.plural.comparative.latin = comparativeRoot + "ibus"
        returnDeclension.vocative.plural.comparative.latin = comparativeRoot + "ēs"
        
        returnDeclension.nominative.singular.comparative.english = comparativeDefinition
        returnDeclension.genitive.singular.comparative.english = comparativeDefinition
        returnDeclension.dative.singular.comparative.english = comparativeDefinition
        returnDeclension.accusative.singular.comparative.english = comparativeDefinition
        returnDeclension.ablative.singular.comparative.english = comparativeDefinition
        returnDeclension.vocative.singular.comparative.english = comparativeDefinition
        
        returnDeclension.nominative.plural.comparative.english = comparativeDefinition
        returnDeclension.genitive.plural.comparative.english = comparativeDefinition
        returnDeclension.dative.plural.comparative.english = comparativeDefinition
        returnDeclension.accusative.plural.comparative.english = comparativeDefinition
        returnDeclension.ablative.plural.comparative.english = comparativeDefinition
        returnDeclension.vocative.plural.comparative.english = comparativeDefinition
        
        //Superlative
        let superlativeRoot: String
        if masculineNominativeSingularPositiveInput.hasSuffix("er"){
            superlativeRoot = root + "rim"
        }
        else{
            superlativeRoot = root + "lim"
        }
        
        returnDeclension.nominative.singular.superlative.latin = superlativeRoot + "a"
        returnDeclension.genitive.singular.superlative.latin = superlativeRoot + "ae"
        returnDeclension.dative.singular.superlative.latin = superlativeRoot + "ae"
        returnDeclension.accusative.singular.superlative.latin = superlativeRoot + "am"
        returnDeclension.ablative.singular.superlative.latin = superlativeRoot + "ā"
        returnDeclension.vocative.singular.superlative.latin = superlativeRoot + "a"
        
        returnDeclension.nominative.plural.superlative.latin = superlativeRoot + "ae"
        returnDeclension.genitive.plural.superlative.latin = superlativeRoot + "arum"
        returnDeclension.dative.plural.superlative.latin = superlativeRoot + "īs"
        returnDeclension.accusative.plural.superlative.latin = superlativeRoot + "ās"
        returnDeclension.ablative.plural.superlative.latin = superlativeRoot + "īs"
        returnDeclension.vocative.plural.superlative.latin = superlativeRoot + "ae"
        
        returnDeclension.nominative.singular.superlative.english = superlativeDefinition
        returnDeclension.genitive.singular.superlative.english = superlativeDefinition
        returnDeclension.dative.singular.superlative.english = superlativeDefinition
        returnDeclension.accusative.singular.superlative.english = superlativeDefinition
        returnDeclension.ablative.singular.superlative.english = superlativeDefinition
        returnDeclension.vocative.singular.superlative.english = superlativeDefinition
        
        returnDeclension.nominative.plural.superlative.english = superlativeDefinition
        returnDeclension.genitive.plural.superlative.english = superlativeDefinition
        returnDeclension.dative.plural.superlative.english = superlativeDefinition
        returnDeclension.accusative.plural.superlative.english = superlativeDefinition
        returnDeclension.ablative.plural.superlative.english = superlativeDefinition
        returnDeclension.vocative.plural.superlative.english = superlativeDefinition
    }
    
    return returnDeclension
}

func deriveNeuter(masculineNominativeSingularPositiveInput: String, feminineNominativeSingularPositiveInput: String, neuterNominativeSingularPositiveInput: String, definitionInput: String) -> declension{
    var returnDeclension: declension = declension()
    
    if feminineNominativeSingularPositiveInput.hasSuffix("a"){
        let root = feminineNominativeSingularPositiveInput.substringWithRange(Range<String.Index>(start: feminineNominativeSingularPositiveInput.startIndex, end: advance(feminineNominativeSingularPositiveInput.endIndex, -1)))
        let positiveDefinition = definitionInput
        let comparativeDefinition = "rather " + definitionInput
        let superlativeDefinition = "most " + definitionInput
        
        //Positive
        returnDeclension.nominative.singular.positive.latin = root + "um"
        returnDeclension.genitive.singular.positive.latin = root + "ī"
        returnDeclension.dative.singular.positive.latin = root + "ō"
        returnDeclension.accusative.singular.positive.latin = root + "um"
        returnDeclension.ablative.singular.positive.latin = root + "ō"
        returnDeclension.vocative.singular.positive.latin = root + "um"
        
        returnDeclension.nominative.plural.positive.latin = root + "a"
        returnDeclension.genitive.plural.positive.latin = root + "orum"
        returnDeclension.dative.plural.positive.latin = root + "īs"
        returnDeclension.accusative.plural.positive.latin = root + "a"
        returnDeclension.ablative.plural.positive.latin = root + "īs"
        returnDeclension.vocative.plural.positive.latin = root + "a"
        
        returnDeclension.nominative.singular.positive.english = positiveDefinition
        returnDeclension.genitive.singular.positive.english = positiveDefinition
        returnDeclension.dative.singular.positive.english = positiveDefinition
        returnDeclension.accusative.singular.positive.english = positiveDefinition
        returnDeclension.ablative.singular.positive.english = positiveDefinition
        returnDeclension.vocative.singular.positive.english = positiveDefinition
        
        returnDeclension.nominative.plural.positive.english = positiveDefinition
        returnDeclension.genitive.plural.positive.english = positiveDefinition
        returnDeclension.dative.plural.positive.english = positiveDefinition
        returnDeclension.accusative.plural.positive.english = positiveDefinition
        returnDeclension.ablative.plural.positive.english = positiveDefinition
        returnDeclension.vocative.plural.positive.english = positiveDefinition
        
        //Comparative
        let comparativeRoot = root + "ior"
        returnDeclension.nominative.singular.comparative.latin = root
        returnDeclension.genitive.singular.comparative.latin = comparativeRoot + "is"
        returnDeclension.dative.singular.comparative.latin = comparativeRoot + "ī"
        returnDeclension.accusative.singular.comparative.latin = root
        returnDeclension.ablative.singular.comparative.latin = comparativeRoot + "e"
        returnDeclension.vocative.singular.comparative.latin = root
        
        returnDeclension.nominative.plural.comparative.latin = comparativeRoot + "a"
        returnDeclension.genitive.plural.comparative.latin = comparativeRoot + "um"
        returnDeclension.dative.plural.comparative.latin = comparativeRoot + "ibus"
        returnDeclension.accusative.plural.comparative.latin = comparativeRoot + "a"
        returnDeclension.ablative.plural.comparative.latin = comparativeRoot + "ibus"
        returnDeclension.vocative.plural.comparative.latin = comparativeRoot + "a"
        
        returnDeclension.nominative.singular.comparative.english = comparativeDefinition
        returnDeclension.genitive.singular.comparative.english = comparativeDefinition
        returnDeclension.dative.singular.comparative.english = comparativeDefinition
        returnDeclension.accusative.singular.comparative.english = comparativeDefinition
        returnDeclension.ablative.singular.comparative.english = comparativeDefinition
        returnDeclension.vocative.singular.comparative.english = comparativeDefinition
        
        returnDeclension.nominative.plural.comparative.english = comparativeDefinition
        returnDeclension.genitive.plural.comparative.english = comparativeDefinition
        returnDeclension.dative.plural.comparative.english = comparativeDefinition
        returnDeclension.accusative.plural.comparative.english = comparativeDefinition
        returnDeclension.ablative.plural.comparative.english = comparativeDefinition
        returnDeclension.vocative.plural.comparative.english = comparativeDefinition
        
        //Superlative
        let superlativeRoot: String
        if masculineNominativeSingularPositiveInput.hasSuffix("er"){
            superlativeRoot = root + "rim"
        }
        else{
            superlativeRoot = root + "lim"
        }
        
        returnDeclension.nominative.singular.superlative.latin = superlativeRoot + "um"
        returnDeclension.genitive.singular.superlative.latin = superlativeRoot + "ī"
        returnDeclension.dative.singular.superlative.latin = superlativeRoot + "ō"
        returnDeclension.accusative.singular.superlative.latin = superlativeRoot + "um"
        returnDeclension.ablative.singular.superlative.latin = superlativeRoot + "ō"
        returnDeclension.vocative.singular.superlative.latin = superlativeRoot + "um"
        
        returnDeclension.nominative.plural.superlative.latin = superlativeRoot + "a"
        returnDeclension.genitive.plural.superlative.latin = superlativeRoot + "orum"
        returnDeclension.dative.plural.superlative.latin = superlativeRoot + "īs"
        returnDeclension.accusative.plural.superlative.latin = superlativeRoot + "a"
        returnDeclension.ablative.plural.superlative.latin = superlativeRoot + "īs"
        returnDeclension.vocative.plural.superlative.latin = superlativeRoot + "a"
        
        returnDeclension.nominative.singular.superlative.english = superlativeDefinition
        returnDeclension.genitive.singular.superlative.english = superlativeDefinition
        returnDeclension.dative.singular.superlative.english = superlativeDefinition
        returnDeclension.accusative.singular.superlative.english = superlativeDefinition
        returnDeclension.ablative.singular.superlative.english = superlativeDefinition
        returnDeclension.vocative.singular.superlative.english = superlativeDefinition
        
        returnDeclension.nominative.plural.superlative.english = superlativeDefinition
        returnDeclension.genitive.plural.superlative.english = superlativeDefinition
        returnDeclension.dative.plural.superlative.english = superlativeDefinition
        returnDeclension.accusative.plural.superlative.english = superlativeDefinition
        returnDeclension.ablative.plural.superlative.english = superlativeDefinition
        returnDeclension.vocative.plural.superlative.english = superlativeDefinition
    }
    
    return returnDeclension
}
