//
//  nonConjugatable.swift
//  LatinLanguageHelper
//
//  Created by Josh Kallus on 12/27/14.
//  Copyright (c) 2014 JMKLABS. All rights reserved.
//

import Foundation

class nonConjugatable: Word {
    var latinForm: String
    var englishForm: String
    
    init(latinFormInput: String, englishFormInput: String){
        self.latinForm = latinFormInput
        self.englishForm = englishFormInput
        super.init(latinSearchTerm: latinFormInput, englishSearchTerm: englishFormInput, partOfSpeech: "nonConjugatable")
    }
    
}
