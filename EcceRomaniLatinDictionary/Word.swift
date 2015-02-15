//
//  Word.swift
//  LatinTableView2
//
//  Created by Josh Kallus on 11/27/14.
//  Copyright (c) 2014 JMKLABS. All rights reserved.
//

//import Foundation

class Word{
    var latinSearchTerm: String
    var englishSearchTerm: String
    var partOfSpeech: String
    
    init(latinSearchTerm: String, englishSearchTerm: String, partOfSpeech: String){
        self.latinSearchTerm = latinSearchTerm
        self.englishSearchTerm = englishSearchTerm
        self.partOfSpeech = partOfSpeech
    }
}