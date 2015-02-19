//
//  DismissSegue.swift
//  TaskMe
//
//  Created by Josh Kallus on 10/29/14.
//  Copyright (c) 2014 JMK Labs. All rights reserved.
//

import UIKit

@objc(DismissSegue) class DismissSegue: UIStoryboardSegue {
   
    override func perform() {
        if let controller = sourceViewController.presentingViewController? {
            controller.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
}
