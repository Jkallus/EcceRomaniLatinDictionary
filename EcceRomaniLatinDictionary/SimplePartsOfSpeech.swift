//
//  SimplePartsOfSpeech.swift
//  EcceRomaniLatinDictionary
//
//  Created by Josh Kallus on 4/11/15.
//  Copyright (c) 2015 JMKLABS. All rights reserved.
//

import Foundation

class simpleNoun: Word{
    let nominativeSingular: String
    let genitiveSingular: String
    let gender: String
    let definition: String
    let declension: Int
    
    init(nominativeSingularInput: String, genitiveSingularInput: String, genderInput: String, definitionInput: String, declensionInput: Int){
        self.nominativeSingular = nominativeSingularInput
        self.genitiveSingular = genitiveSingularInput
        self.gender = genderInput
        self.definition = definitionInput
        self.declension = declensionInput
        
        super.init(latinSearchTerm: nominativeSingularInput + "," + genitiveSingularInput, englishSearchTerm: definitionInput, partOfSpeech: "Noun")
    }
}




class simpleVerb: Word{
    let firstPrinciplePart: String
    let secondPrinciplePart: String
    let thirdPrinciplePart: String
    let fourthPrinciplePart: String
    let definition: String
    
    init(firstPrinciplePartInput:String, secondPrinciplePartInput: String, thirdPrinciplePartInput: String, fourthPrinciplePartInput: String, definitionInput: String){
        self.firstPrinciplePart = firstPrinciplePartInput
        self.secondPrinciplePart = secondPrinciplePartInput
        self.thirdPrinciplePart = thirdPrinciplePartInput
        self.fourthPrinciplePart = fourthPrinciplePartInput
        self.definition = definitionInput
        
        super.init(latinSearchTerm: firstPrinciplePartInput + "," + secondPrinciplePartInput, englishSearchTerm: definitionInput, partOfSpeech: "Verb")
    }
}



class simpleNonConjugatable: Word{
    let latin:String
    let definition:String
    init(latinInput: String, definitionInput: String){
        self.latin = latinInput
        self.definition = definitionInput
        
        super.init(latinSearchTerm: latinInput, englishSearchTerm: definitionInput, partOfSpeech: "NonConjugatable")
    }
}
