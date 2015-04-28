//
//  Noun.swift
//  LatinTableView
//
//  Created by Josh Kallus on 11/21/14.
//  Copyright (c) 2014 JMK Labs. All rights reserved.
//

import Foundation

struct declensionCase {
    var singular: String
    var plural: String
    
    init(SingularInput:String, PluralInput:String){
        self.singular = SingularInput
        self.plural = PluralInput
    }
}


class Noun: Word {
    private var NominativeSingular: String
    private var GenitiveSingular: String
    var Gender: String
    var Definition: String
    var Declension: Int
    
    var nominative: declensionCase
    var genitive: declensionCase
    var dative: declensionCase
    var accusative: declensionCase
    var ablative: declensionCase
    var vocative: declensionCase
    
    
    init(NominativeSingularInput: String, GenitiveSingularInput: String, GenderInput: String, DefinitionInput: String, DeclensionInput: Int){
        self.NominativeSingular = NominativeSingularInput
        self.GenitiveSingular = GenitiveSingularInput
        self.Declension = DeclensionInput
        
        

        
        self.Gender = GenderInput
        
        
        
        self.Definition = DefinitionInput
        
        
        
        self.nominative = deriveNominative(NominativeSingularInput, GenitiveSingularInput, GenderInput, DeclensionInput)
        self.genitive = deriveGenitive(NominativeSingularInput, GenitiveSingularInput, GenderInput, DeclensionInput)
        self.dative = deriveDative(NominativeSingularInput, GenitiveSingularInput, GenderInput, DeclensionInput)
        self.accusative = deriveAccusative(NominativeSingularInput, GenitiveSingularInput, GenderInput, DeclensionInput)
        self.ablative = deriveAblative(NominativeSingularInput, GenitiveSingularInput, GenderInput, DeclensionInput)
        self.vocative = deriveVocative(NominativeSingularInput, GenitiveSingularInput, GenderInput, DeclensionInput)
        
        super.init(latinSearchTerm: NominativeSingularInput + ", " + GenitiveSingularInput, englishSearchTerm: DefinitionInput, partOfSpeech: "Noun")
    }
}



func deriveNominative(NominativeSingular: String, GenitiveSingular: String, Gender: String, Declension: Int) -> declensionCase{
    var NomSing: String?
    var NomPlural: String?

    
    if Declension == 1{
        NomSing = NominativeSingular
        NomPlural = NominativeSingular + "e"
    }
    if Declension == 2{
        NomSing = NominativeSingular
        if Gender == "Masculine" || Gender == "Feminine"{
            if NominativeSingular.hasSuffix("r"){
                NomPlural = NominativeSingular+"i"
            }
            if NominativeSingular.hasSuffix("us"){
                NomPlural = NominativeSingular.substringWithRange(Range<String.Index>(start: NominativeSingular.startIndex, end: advance(NominativeSingular.endIndex, -2)))+"i"
            }
            
        }
        if Gender == "Neuter"{
            NomPlural = NominativeSingular.substringWithRange(Range<String.Index>(start: NominativeSingular.startIndex, end: advance(NominativeSingular.endIndex, -2)))+"a"
        }
    }
    if Declension == 3{
        if Gender != "Neuter" {
            NomSing = NominativeSingular
            NomPlural = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -2)))+"es"
        }
        if Gender == "Neuter" {
            NomSing = NominativeSingular
            NomPlural = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -2)))+"a"
        }
    }
    if Declension == 4{
        if Gender != "Neuter" {
            NomSing = NominativeSingular
            NomPlural = GenitiveSingular
        }
        if Gender == "Neuter"{
            NomSing = NominativeSingular
            NomPlural = NominativeSingular.substringWithRange(Range<String.Index>(start: NominativeSingular.startIndex, end: advance(NominativeSingular.endIndex, -1)))+"ua"
        }
        if Declension == 5{
            NomSing = NominativeSingular
            NomPlural = NominativeSingular
        }
    }
    if Declension == 5{
        NomSing = NominativeSingular
        NomPlural = NominativeSingular
    }
    
    var derivedNominative: declensionCase = declensionCase(SingularInput: NomSing!, PluralInput: NomPlural!)
    return derivedNominative
}
func deriveGenitive(NominativeSingular: String, GenitiveSingular: String, Gender: String, Declension: Int) -> declensionCase{
    var GenSing: String?
    var GenPlural: String?
    if Declension == 1 {
        GenSing = GenitiveSingular
        GenPlural = NominativeSingular + "rum"
    }
    if Declension == 2 {
        if Gender == "Masculine" || Gender == "Feminine"{
            GenSing = GenitiveSingular
            GenPlural = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -1))) + "orum"
        }
        
        if Gender == "Neuter" {
            GenSing = GenitiveSingular
            GenPlural = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -1))) + "a"
        }
    }
    if Declension == 3 {
        GenSing = GenitiveSingular
        GenPlural = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -2))) + "um"
    }
    if Declension == 4 {
        GenSing = GenitiveSingular
        GenPlural = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -2))) + "uum"
    }
    if Declension == 5 {
        GenSing = GenitiveSingular
        GenPlural = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -2))) + "erum"
    }
    
    var derivedGenitive: declensionCase = declensionCase(SingularInput: GenSing!, PluralInput: GenPlural!)
    return derivedGenitive
}
func deriveDative(NominativeSingular: String, GenitiveSingular: String, Gender: String, Declension: Int) -> declensionCase{
    var DatSing: String?
    var DatPlural: String?
    
    
    if Declension == 1{
        DatSing = NominativeSingular + "e"
        DatPlural = NominativeSingular.substringWithRange(Range<String.Index>(start: NominativeSingular.startIndex, end: advance(NominativeSingular.endIndex, -1))) + "īs"
    }
    if Declension == 2{
        DatSing = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -1))) + "o"
        DatPlural = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -1))) + "īs"
    }
    if Declension == 3{
        DatSing = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -2))) + "ī"
        DatPlural = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -2))) + "ībus"
    }
    if Declension == 4{
        DatSing = NominativeSingular.substringWithRange(Range<String.Index>(start: NominativeSingular.startIndex, end: advance(NominativeSingular.endIndex, -2))) + "uī"
        DatPlural = NominativeSingular.substringWithRange(Range<String.Index>(start: NominativeSingular.startIndex, end: advance(NominativeSingular.endIndex, -2))) + "ibus"
    }
    if Declension == 5{
        DatSing =  NominativeSingular.substringWithRange(Range<String.Index>(start: NominativeSingular.startIndex, end: advance(NominativeSingular.endIndex, -2))) + "eī"
        DatPlural = NominativeSingular.substringWithRange(Range<String.Index>(start: NominativeSingular.startIndex, end: advance(NominativeSingular.endIndex, -2))) + "ebus"
    }
    
    var derivedAblative: declensionCase = declensionCase(SingularInput: DatSing!, PluralInput: DatPlural!)
    return derivedAblative
}
func deriveAccusative(NominativeSingular: String, GenitiveSingular: String, Gender: String, Declension: Int) -> declensionCase{
    
    var AccSing: String?
    var AccPlural: String?
    
    if Declension == 1{
        AccSing = NominativeSingular + "m"
        AccPlural = NominativeSingular.substringWithRange(Range<String.Index>(start: NominativeSingular.startIndex, end: advance(NominativeSingular.endIndex, -1))) + "ās"
    }
    if Declension == 2{
        if Gender == "Masculine" || Gender == "Feminine"{
            AccSing = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -1))) + "um"
            AccPlural = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -1))) + "ōs"
        }
        if Gender == "Neuter"{
            AccSing = NominativeSingular
            AccPlural = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -1))) + "a"
        }
    }
    if Declension == 3{
        if Gender != "Neuter"{
            AccSing = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -2))) + "ēm"
            AccPlural = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -2))) + "ēs"
        }
        if Gender == "Neuter"{
            AccSing = NominativeSingular
            AccPlural = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -2))) + "a"
        }
    }
    if Declension == 4{
        if Gender != "Neuter"{
            AccSing = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -2))) + "um"
            AccPlural = GenitiveSingular
        }
        if Gender == "Neuter"{
            AccSing = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -1)))
            AccPlural = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -2))) + "ua"
        }
    }
    if Declension == 5{
        AccSing = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -2))) + "ēm"
        AccPlural = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -2))) + "ēs"
    }
    
    var derivedAccusative: declensionCase = declensionCase(SingularInput: AccSing!, PluralInput: AccPlural!)
    return derivedAccusative
}
func deriveAblative(NominativeSingular: String, GenitiveSingular: String, Gender: String, Declension: Int) -> declensionCase{
    
    var AblSing: String?
    var AblPlural: String?
    
    
    if Declension == 1{
        AblSing = NominativeSingular.substringWithRange(Range<String.Index>(start: NominativeSingular.startIndex, end: advance(NominativeSingular.endIndex, -1))) + "ā"
        AblPlural = NominativeSingular.substringWithRange(Range<String.Index>(start: NominativeSingular.startIndex, end: advance(NominativeSingular.endIndex, -1))) + "īs"
    }
    if Declension == 2{
        AblSing = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -1))) + "ō"
        AblPlural = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -1))) + "īs"
    }
    if Declension == 3{
        AblSing = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -2))) + "e"
        AblPlural = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -2))) + "ibus"
    }
    if Declension == 4{
        AblSing = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -1)))
        AblPlural = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -2))) + "ibus"
    }
    if Declension == 5{
        AblSing = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -2))) + "ē"
        AblPlural = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -2))) + "ebus"
    }
    
    var derivedAblative: declensionCase = declensionCase(SingularInput: AblSing!, PluralInput: AblPlural!)
    return derivedAblative
}
func deriveVocative(NominativeSingular: String, GenitiveSingular: String, Gender: String, Declension: Int) -> declensionCase{
    var VocSing: String?
    var VocPlural: String?
    
    //var derivedVocative: nominativeCase = nominativeCase(NominativeSingularInput: "",NominativePluralInput: "")
    
    if Declension == 1{
        VocSing = NominativeSingular
        VocPlural = NominativeSingular + "e"
    }
    if Declension == 2{
        VocSing = NominativeSingular
        if Gender == "Masculine" || Gender == "Feminine"{
            if NominativeSingular.hasSuffix("r"){
                VocPlural = NominativeSingular+"i"
            }
            if NominativeSingular.hasSuffix("us"){
                VocPlural = NominativeSingular.substringWithRange(Range<String.Index>(start: NominativeSingular.startIndex, end: advance(NominativeSingular.endIndex, -2)))+"i"
            }
            
        }
        if Gender == "Neuter"{
            VocPlural = NominativeSingular.substringWithRange(Range<String.Index>(start: NominativeSingular.startIndex, end: advance(NominativeSingular.endIndex, -2)))+"a"
        }
    }
    if Declension == 3{
        if Gender != "Neuter" {
            VocSing = NominativeSingular
            VocPlural = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -2)))+"es"
        }
        if Gender == "Neuter" {
            VocSing = NominativeSingular
            VocPlural = GenitiveSingular.substringWithRange(Range<String.Index>(start: GenitiveSingular.startIndex, end: advance(GenitiveSingular.endIndex, -2)))+"a"
        }
    }
    if Declension == 4{
        if Gender != "Neuter"{
            VocSing = NominativeSingular
            VocPlural = GenitiveSingular
        }
        if Gender == "Neuter"{
            VocSing = NominativeSingular
            VocPlural = NominativeSingular.substringWithRange(Range<String.Index>(start: NominativeSingular.startIndex, end: advance(NominativeSingular.endIndex, -1)))+"ua"
        }
        if Declension == 5{
            VocSing = NominativeSingular
            VocPlural = NominativeSingular
        }
    }
    if Declension == 5{
        VocSing = NominativeSingular
        VocPlural = NominativeSingular
    }
    
    var derivedVocative: declensionCase = declensionCase(SingularInput: VocSing!, PluralInput: VocPlural!)
    return derivedVocative
}

