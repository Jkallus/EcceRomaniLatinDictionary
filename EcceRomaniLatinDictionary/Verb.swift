//
//  Verb.swift
//  LatinTableView2
//
//  Created by Josh Kallus on 11/26/14.
//  Copyright (c) 2014 JMKLABS. All rights reserved.
//
import Foundation

struct number {
    var singular: form = form()
    var plural: form = form()

    init(){}
}
    
struct person {
    var firstPerson: number = number()
    var secondPerson: number = number()
    var thirdPerson: number = number()
    
    init(firstPersonInput: number, secondPersonInput: number, thirdPersonInput: number){
        self.firstPerson = firstPersonInput
        self.secondPerson = secondPersonInput
        self.thirdPerson = thirdPersonInput
    }
    
    init(){}
}
struct tense {
    var present: person = person()
    var imperfect: person = person()
    var future: person = person()
    var perfect: person = person()
    var pluperfect: person = person()
    var futurePerfect: person = person()
    
    
    
    init(presentInput: person, imperfectInput: person, futureInput: person, perfectInput: person, pluperfectInput: person, futurePerfectInput: person){
        self.present = presentInput
        self.imperfect = imperfectInput
        self.future = futureInput
        self.perfect = perfectInput
        self.pluperfect = pluperfectInput
        self.futurePerfect = futurePerfectInput
    }
    
    init(){}
}

class Verb: Word{
    var firstPrinciplePart: String
    var secondPrinciplePart: String
    var thirdPrinciplePart: String
    var fourthPrinciplePart: String
    var definition: String
    var conjugation: Int = 1
    
    var active: tense
    
    init(firstPrinciplePart: String, secondPrinciplePart: String, thirdPrinciplePart: String, fourthPrinciplePart: String, definition: String){
        self.firstPrinciplePart = firstPrinciplePart
        self.secondPrinciplePart = secondPrinciplePart
        self.thirdPrinciplePart = thirdPrinciplePart
        self.fourthPrinciplePart = fourthPrinciplePart
        
        self.definition = definition
        
        
        if secondPrinciplePart.hasSuffix("āre"){self.conjugation = 1 }
        if secondPrinciplePart.hasSuffix("ēre"){self.conjugation = 2 }
        if secondPrinciplePart.hasSuffix("ere"){self.conjugation = 3 }
        if secondPrinciplePart.hasSuffix("ire"){self.conjugation = 4 }
        
        self.active = deriveActive(firstPrinciplePart, secondPrinciplePart, thirdPrinciplePart, fourthPrinciplePart, definition)
        
        super.init(latinSearchTerm: firstPrinciplePart + ", " + secondPrinciplePart, englishSearchTerm: definition, partOfSpeech: "Verb")
    }
    
}






func deriveActive(firstPrinciplePart: String, secondPrinciplePart: String, thirdPrinciplePart: String, fourthPrinciplePart: String, definition:String)->tense{
    var active: tense = tense()
    
    
    
    
    var conjugation: Int = 1
    if secondPrinciplePart.hasSuffix("āre"){conjugation = 1 }
    if secondPrinciplePart.hasSuffix("ēre"){conjugation = 2 }
    if secondPrinciplePart.hasSuffix("ere"){conjugation = 3 }
    if secondPrinciplePart.hasSuffix("ire"){conjugation = 4 }
    
    //Present
    if conjugation == 1{
        
        
        //First Person
        active.present.firstPerson.singular.latin = firstPrinciplePart
        active.present.firstPerson.singular.english = "I \(definition)"
        
        active.present.firstPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "mus"
        active.present.firstPerson.plural.english = "We \(definition)"
        
        
        //Second Person
        active.present.secondPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "s"
        active.present.secondPerson.singular.english = "You \(definition)"
        
        active.present.secondPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "tis"
        active.present.secondPerson.plural.english = "You all \(definition)"
        
        
        //Third Person
        active.present.thirdPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "t"
        active.present.thirdPerson.singular.english = "He/She/It \(definition)s"
        
        active.present.thirdPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "nt"
        active.present.thirdPerson.plural.english = "They \(definition)"
    }
    if conjugation == 2{
        
        //First Person
        active.present.firstPerson.singular.latin = firstPrinciplePart
        active.present.firstPerson.singular.latin = "I \(definition)"
        
        active.present.firstPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "mus"
        active.present.firstPerson.plural.english = "We \(definition)"
        
        
        //Second Person
        active.present.secondPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "s"
        active.present.secondPerson.singular.english = "You \(definition)"
        
        active.present.secondPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "tis"
        active.present.secondPerson.plural.english = "You all \(definition)"
        
        
        //Third Person
        active.present.thirdPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "t"
        active.present.thirdPerson.singular.english = "He/She/It \(definition)s"
        
        active.present.thirdPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "nt"
        active.present.thirdPerson.plural.english = "They \(definition)"
    }
    if conjugation == 3{
        
        //First Person
        active.present.firstPerson.singular.latin = firstPrinciplePart
        active.present.firstPerson.singular.english = "I \(definition)"
        
        active.present.firstPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -3))) + "i" + "mus"
        active.present.firstPerson.plural.english = "We \(definition)"
        
        
        //Second Person
        active.present.secondPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -3))) + "i" + "s"
        active.present.secondPerson.singular.english = "You \(definition)"
        
        active.present.secondPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -3))) + "i" + "tis"
        active.present.secondPerson.plural.english = "You all \(definition)"
        
        
        //Third Person
        active.present.thirdPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -3))) + "i" + "t"
        active.present.thirdPerson.singular.english = "He/She/It \(definition)s"
        
        active.present.thirdPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -3))) + "u" + "nt"
        active.present.thirdPerson.plural.english = "They \(definition)"
    }
    if conjugation == 4{
        
        //First Person
        active.present.firstPerson.singular.latin = firstPrinciplePart
        active.present.firstPerson.singular.english = "I \(definition)"
        
        active.present.firstPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "mus"
        active.present.firstPerson.plural.english = "We \(definition)"
        
        //Second Person
        active.present.secondPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "s"
        active.present.secondPerson.singular.english = "You \(definition)"
        
        active.present.secondPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "tis"
        active.present.secondPerson.plural.english = "You all \(definition)"
        
        //Third Person
        active.present.thirdPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "t"
        active.present.thirdPerson.singular.english = "He/She/It \(definition)s"
        
        active.present.thirdPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "u" + "nt"
        active.present.thirdPerson.plural.english = "They \(definition)"
    }
    
    //Imperfect
    if conjugation == 1{
        
        //First Person
        active.imperfect.firstPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bam"
        active.imperfect.firstPerson.singular.english = "I was \(definition)ing"
        
        active.imperfect.firstPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bamus"
        active.imperfect.firstPerson.plural.english = "We were \(definition)ing"
        
        //Second Person
        active.imperfect.secondPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bas"
        active.imperfect.secondPerson.singular.english = "You were \(definition)ing"
        
        active.imperfect.secondPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "batis"
        active.imperfect.secondPerson.plural.english = "You all were \(definition)ing"
        
        //Third Person
        active.imperfect.thirdPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bat"
        active.imperfect.thirdPerson.singular.english = "He/She/It was \(definition)ing"
        
        active.imperfect.thirdPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bant"
        active.imperfect.thirdPerson.plural.english = "They were \(definition)ing"
    }
    if conjugation == 2{
        //First Person
        active.imperfect.firstPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bam"
        active.imperfect.firstPerson.singular.latin = "I was \(definition)ing"
        
        active.imperfect.firstPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bamus"
        active.imperfect.firstPerson.plural.english = "We were \(definition)ing"
        
        
        //Second Person
        active.imperfect.secondPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bas"
        active.imperfect.secondPerson.singular.english = "You were \(definition)ing"
        
        active.imperfect.secondPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "batis"
        active.imperfect.secondPerson.plural.english = "You all were \(definition)ing"
        
        
        //Third Person
        active.imperfect.thirdPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bat"
        active.imperfect.thirdPerson.singular.english = "He/She/It was \(definition)ing"
        
        active.imperfect.thirdPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bant"
        active.imperfect.thirdPerson.plural.english = "They were \(definition)ing"
    }
    if conjugation == 3{
        //First Person
        active.imperfect.firstPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bam"
        active.imperfect.firstPerson.singular.english = "I was \(definition)ing"
        
        active.imperfect.firstPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bamus"
        active.imperfect.firstPerson.plural.english = "We were \(definition)ing"
        
        
        //Second Person
        active.imperfect.secondPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bas"
        active.imperfect.secondPerson.singular.english = "You were \(definition)ing"
        
        active.imperfect.secondPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "batis"
        active.imperfect.secondPerson.plural.english = "You all were \(definition)ing"
        
        
        //Third Person
        active.imperfect.thirdPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bat"
        active.imperfect.thirdPerson.singular.english = "He/She/It was \(definition)ing"
        
        active.imperfect.thirdPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bant"
        active.imperfect.thirdPerson.plural.english = "They were \(definition)ing"
    }
    if conjugation == 4{
        //First Person
        active.imperfect.firstPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "e" + "bam"
        active.imperfect.firstPerson.singular.english = "I was \(definition)ing"
        
        active.imperfect.firstPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "e" + "bamus"
        active.imperfect.firstPerson.plural.english = "We were \(definition)ing"
        
        //Second Person
        active.imperfect.secondPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "e" + "bas"
        active.imperfect.secondPerson.singular.english = "You were \(definition)ing"
        
        active.imperfect.secondPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "e" + "batis"
        active.imperfect.secondPerson.plural.english = "You all were \(definition)ing"
        
        //Third Person
        active.imperfect.thirdPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "e" + "bat"
        active.imperfect.thirdPerson.singular.english = "He/She/It was \(definition)ing"
        
        active.imperfect.thirdPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "e" + "bant"
        active.imperfect.thirdPerson.plural.english = "They were \(definition)ing"
        
    }
    
    //Future
    if conjugation == 1{
        
        //First Person
        active.future.firstPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "b" + "o"
        active.future.firstPerson.singular.english = "I will \(definition)"
        
        active.future.firstPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bi" + "mus"
        active.future.firstPerson.plural.english = "We will \(definition)"
        
        
        //Second Person
        active.future.secondPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bi" + "s"
        active.future.secondPerson.singular.english = "You will \(definition)"
        
        active.future.secondPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bi" + "tis"
        active.future.secondPerson.plural.english = "You all will \(definition)"
        
        
        //Third Person
        active.future.thirdPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bi" + "t"
        active.future.thirdPerson.singular.english = "He/She/It will \(definition)s"
        
        active.future.thirdPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bu" + "nt"
        active.future.thirdPerson.plural.english = "They will \(definition)"
    }
    if conjugation == 2{
        
        //First Person
        active.future.firstPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "b" + "o"
        active.future.firstPerson.singular.english = "I will \(definition)"
        
        active.future.firstPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bi" + "mus"
        active.future.firstPerson.plural.english = "We will \(definition)"
        
        
        //Second Person
        active.future.secondPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bi" + "s"
        active.future.secondPerson.singular.english = "You will \(definition)"
        
        active.future.secondPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bi" + "tis"
        active.future.secondPerson.plural.english = "You all will \(definition)"
        
        
        //Third Person
        active.future.thirdPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bi" + "t"
        active.future.thirdPerson.singular.english = "He/She/It will \(definition)s"
        
        active.future.thirdPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "bu" + "nt"
        active.future.thirdPerson.plural.english = "They will \(definition)"
        
    }
    if conjugation == 3{
        
        //First Person
        active.future.firstPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -3))) + "am"
        active.future.firstPerson.singular.english = "I will \(definition)"
        
        active.future.firstPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -3))) + "e" + "mus"
        active.future.firstPerson.plural.english = "We will \(definition)"
        
        
        //Second Person
        active.future.secondPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -3))) + "e" + "s"
        active.future.secondPerson.singular.english = "You will \(definition)"
        
        active.future.secondPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -3))) + "e" + "tis"
        active.future.secondPerson.plural.english = "You all will \(definition)"
        
        
        //Third Person
        active.future.thirdPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -3))) + "e" + "t"
        active.future.thirdPerson.singular.english = "He/She/It will \(definition)s"
        
        active.future.thirdPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -3))) + "e" + "nt"
        active.future.thirdPerson.plural.english = "They will \(definition)"
        
    }
    if conjugation == 4{
        
        //First Person
        active.future.firstPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "am"
        active.future.firstPerson.singular.english = "I will \(definition)"
        
        active.future.firstPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "e" + "mus"
        active.future.firstPerson.plural.english = "We will \(definition)"
        
        
        //Second Person
        active.future.secondPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "e" + "s"
        active.future.secondPerson.singular.english = "You will \(definition)"
        
        active.future.secondPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "e" + "tis"
        active.future.secondPerson.plural.english = "You all will \(definition)"
        
        
        //Third Person
        active.future.thirdPerson.singular.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "e" + "t"
        active.future.thirdPerson.singular.english = "He/She/It will \(definition)s"
        
        active.future.thirdPerson.plural.latin = secondPrinciplePart.substringWithRange(Range<String.Index>(start: secondPrinciplePart.startIndex, end: advance(secondPrinciplePart.endIndex, -2))) + "e" + "nt"
        active.future.thirdPerson.plural.english = "They will \(definition)"
        
    }
    
    //Perfect
    if conjugation == 1{
        //First Person
        active.perfect.firstPerson.singular.latin = thirdPrinciplePart
        active.perfect.firstPerson.singular.english = "I \(definition)ed"
        
        active.perfect.firstPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "imus"
        active.perfect.firstPerson.plural.english = "We \(definition)ed"
        
        
        //Second Person
        active.perfect.secondPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "isti"
        active.perfect.secondPerson.singular.english = "You \(definition)ed"
        
        active.perfect.secondPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "istis"
        active.perfect.secondPerson.plural.english = "You \(definition)ed"
        
        
        //Third Person
        active.perfect.thirdPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "it"
        active.perfect.thirdPerson.singular.english = "He/She/It \(definition)ed"
        
        active.perfect.thirdPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erunt"
        active.perfect.thirdPerson.plural.english = "They \(definition)ed"
        
    }
    if conjugation == 2{
        //First Person
        active.perfect.firstPerson.singular.latin = thirdPrinciplePart
        active.perfect.firstPerson.singular.english = "I \(definition)ed"
        
        active.perfect.firstPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "imus"
        active.perfect.firstPerson.plural.english = "We \(definition)ed"
        
        
        //Second Person
        active.perfect.secondPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "isti"
        active.perfect.secondPerson.singular.english = "You \(definition)ed"
        
        active.perfect.secondPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "istis"
        active.perfect.secondPerson.plural.english = "You \(definition)ed"
        
        
        //Third Person
        active.perfect.thirdPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "it"
        active.perfect.thirdPerson.singular.english = "He/She/It \(definition)ed"
        
        active.perfect.thirdPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erunt"
        active.perfect.thirdPerson.plural.english = "They \(definition)ed"
    }
    if conjugation == 3{
        //First Person
        active.perfect.firstPerson.singular.latin = thirdPrinciplePart
        active.perfect.firstPerson.singular.english = "I \(definition)ed"
        
        active.perfect.firstPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "imus"
        active.perfect.firstPerson.plural.english = "We \(definition)ed"
        
        
        //Second Person
        active.perfect.secondPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "isti"
        active.perfect.secondPerson.singular.english = "You \(definition)ed"
        
        active.perfect.secondPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "istis"
        active.perfect.secondPerson.plural.english = "You \(definition)ed"
        
        
        //Third Person
        active.perfect.thirdPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "it"
        active.perfect.thirdPerson.singular.english = "He/She/It \(definition)ed"
        
        active.perfect.thirdPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erunt"
        active.perfect.thirdPerson.plural.english = "They \(definition)ed"
    }
    if conjugation == 4{
        //First Person
        active.perfect.firstPerson.singular.latin = thirdPrinciplePart
        active.perfect.firstPerson.singular.english = "I \(definition)ed"
        
        active.perfect.firstPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "imus"
        active.perfect.firstPerson.plural.english = "We \(definition)ed"
        
        
        //Second Person
        active.perfect.secondPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "isti"
        active.perfect.secondPerson.singular.english = "You \(definition)ed"
        
        active.perfect.secondPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "istis"
        active.perfect.secondPerson.plural.english = "You \(definition)ed"
        
        
        //Third Person
        active.perfect.thirdPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "it"
        active.perfect.thirdPerson.singular.english = "He/She/It \(definition)ed"
        
        active.perfect.thirdPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erunt"
        active.perfect.thirdPerson.plural.english = "They \(definition)ed"
    }
    
    //Pluperfect
    if conjugation == 1{
        //First Person
        active.pluperfect.firstPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eram"
        active.pluperfect.firstPerson.singular.english = "I had \(definition)ed"
        
        active.pluperfect.firstPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eramus"
        active.pluperfect.firstPerson.plural.english = "We had \(definition)ed"
        
        
        //Second Person
        active.pluperfect.secondPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eras"
        active.pluperfect.secondPerson.singular.english = "You had \(definition)ed"
        
        active.pluperfect.secondPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eratis"
        active.pluperfect.secondPerson.plural.english = "You had \(definition)ed"
        
        
        //Third Person
        active.pluperfect.thirdPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erat"
        active.pluperfect.thirdPerson.singular.english = "He/She/It had \(definition)ed"
        
        active.pluperfect.thirdPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erant"
        active.pluperfect.thirdPerson.plural.english = "They had \(definition)ed"
    }
    if conjugation == 2{
        //First Person
        active.pluperfect.firstPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eram"
        active.pluperfect.firstPerson.singular.english = "I had \(definition)ed"
        
        active.pluperfect.firstPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eramus"
        active.pluperfect.firstPerson.plural.english = "We had \(definition)ed"
        
        
        //Second Person
        active.pluperfect.secondPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eras"
        active.pluperfect.secondPerson.singular.english = "You had \(definition)ed"
        
        active.pluperfect.secondPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eratis"
        active.pluperfect.secondPerson.plural.english = "You had \(definition)ed"
        
        
        //Third Person
        active.pluperfect.thirdPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erat"
        active.pluperfect.thirdPerson.singular.english = "He/She/It had \(definition)ed"
        
        active.pluperfect.thirdPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erant"
        active.pluperfect.thirdPerson.plural.english = "They had \(definition)ed"
    }
    if conjugation == 3{
        //First Person
        active.pluperfect.firstPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eram"
        active.pluperfect.firstPerson.singular.english = "I had \(definition)ed"
        
        active.pluperfect.firstPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eramus"
        active.pluperfect.firstPerson.plural.english = "We had \(definition)ed"
        
        
        //Second Person
        active.pluperfect.secondPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eras"
        active.pluperfect.secondPerson.singular.english = "You had \(definition)ed"
        
        active.pluperfect.secondPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eratis"
        active.pluperfect.secondPerson.plural.english = "You had \(definition)ed"
        
        
        //Third Person
        active.pluperfect.thirdPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erat"
        active.pluperfect.thirdPerson.singular.english = "He/She/It had \(definition)ed"
        
        active.pluperfect.thirdPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erant"
        active.pluperfect.thirdPerson.plural.english = "They had \(definition)ed"
    }
    if conjugation == 4{
        //First Person
        active.pluperfect.firstPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eram"
        active.pluperfect.firstPerson.singular.english = "I had \(definition)ed"
        
        active.pluperfect.firstPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eramus"
        active.pluperfect.firstPerson.plural.english = "We had \(definition)ed"
        
        
        //Second Person
        active.pluperfect.secondPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eras"
        active.pluperfect.secondPerson.singular.english = "You had \(definition)ed"
        
        active.pluperfect.secondPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eratis"
        active.pluperfect.secondPerson.plural.english = "You had \(definition)ed"
        
        
        //Third Person
        active.pluperfect.thirdPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erat"
        active.pluperfect.thirdPerson.singular.english = "He/She/It had \(definition)ed"
        
        active.pluperfect.thirdPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erant"
        active.pluperfect.thirdPerson.plural.english = "They had \(definition)ed"
    }
    
    //FuturePerfect
    if conjugation == 1{
        //First Person
        active.futurePerfect.firstPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "ero"
        active.futurePerfect.firstPerson.singular.english = "I will have \(definition)ed"
        
        active.futurePerfect.firstPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erimus"
        active.futurePerfect.firstPerson.plural.english = "We had \(definition)ed"
        
        
        //Second Person
        active.futurePerfect.secondPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eris"
        active.futurePerfect.secondPerson.singular.english = "You had \(definition)ed"
        
        active.futurePerfect.secondPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eritis"
        active.futurePerfect.secondPerson.plural.english = "You had \(definition)ed"
        
        
        //Third Person
        active.futurePerfect.thirdPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erit"
        active.futurePerfect.thirdPerson.singular.english = "He/She/It had \(definition)ed"
        
        active.futurePerfect.thirdPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erint"
        active.futurePerfect.thirdPerson.plural.english = "They had \(definition)ed"
        
    }
    if conjugation == 2{
        //First Person
        active.futurePerfect.firstPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "ero"
        active.futurePerfect.firstPerson.singular.english = "I will have \(definition)ed"
        
        active.futurePerfect.firstPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erimus"
        active.futurePerfect.firstPerson.plural.english = "We had \(definition)ed"
        
        
        //Second Person
        active.futurePerfect.secondPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eris"
        active.futurePerfect.secondPerson.singular.english = "You had \(definition)ed"
        
        active.futurePerfect.secondPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eritis"
        active.futurePerfect.secondPerson.plural.english = "You had \(definition)ed"
        
        
        //Third Person
        active.futurePerfect.thirdPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erit"
        active.futurePerfect.thirdPerson.singular.english = "He/She/It had \(definition)ed"
        
        active.futurePerfect.thirdPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erint"
        active.futurePerfect.thirdPerson.plural.english = "They had \(definition)ed"
    }
    if conjugation == 3{
        //First Person
        active.futurePerfect.firstPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "ero"
        active.futurePerfect.firstPerson.singular.english = "I will have \(definition)ed"
        
        active.futurePerfect.firstPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erimus"
        active.futurePerfect.firstPerson.plural.english = "We had \(definition)ed"
        
        
        //Second Person
        active.futurePerfect.secondPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eris"
        active.futurePerfect.secondPerson.singular.english = "You had \(definition)ed"
        
        active.futurePerfect.secondPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eritis"
        active.futurePerfect.secondPerson.plural.english = "You had \(definition)ed"
        
        
        //Third Person
        active.futurePerfect.thirdPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erit"
        active.futurePerfect.thirdPerson.singular.english = "He/She/It had \(definition)ed"
        
        active.futurePerfect.thirdPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erint"
        active.futurePerfect.thirdPerson.plural.english = "They had \(definition)ed"
    }
    if conjugation == 4{
        //First Person
        active.futurePerfect.firstPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "ero"
        active.futurePerfect.firstPerson.singular.english = "I will have \(definition)ed"
        
        active.futurePerfect.firstPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erimus"
        active.futurePerfect.firstPerson.plural.english = "We had \(definition)ed"
        
        
        //Second Person
        active.futurePerfect.secondPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eris"
        active.futurePerfect.secondPerson.singular.english = "You had \(definition)ed"
        
        active.futurePerfect.secondPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "eritis"
        active.futurePerfect.secondPerson.plural.english = "You had \(definition)ed"
        
        
        //Third Person
        active.futurePerfect.thirdPerson.singular.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erit"
        active.futurePerfect.thirdPerson.singular.english = "He/She/It had \(definition)ed"
        
        active.futurePerfect.thirdPerson.plural.latin = thirdPrinciplePart.substringWithRange(Range<String.Index>(start: thirdPrinciplePart.startIndex, end: advance(thirdPrinciplePart.endIndex, -1))) + "erint"
        active.futurePerfect.thirdPerson.plural.english = "They had \(definition)ed"
    }
    
    return active
}

