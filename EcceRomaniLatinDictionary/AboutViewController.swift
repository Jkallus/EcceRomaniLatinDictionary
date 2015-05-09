//
//  AboutViewController.swift
//  EcceRomaniLatinDictionary
//
//  Created by Josh Kallus on 5/8/15.
//  Copyright (c) 2015 JMKLABS. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "submitErrorSegue"{
            let webViewController :WebViewController = segue.destinationViewController as! WebViewController
            webViewController.url = NSURL(string: "https://docs.google.com/forms/d/1BQOnBzvpp1H2APehnaQN5LM4uZ2Xwn1ARQspgFziI7U/viewform?usp=send_form")
            webViewController.title = "Submit an Error Report"
        }
    }
    

}
