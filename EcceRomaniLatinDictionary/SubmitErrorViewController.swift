//
//  SubmitErrorViewController.swift
//  EcceRomaniLatinDictionary
//
//  Created by Josh Kallus on 5/8/15.
//  Copyright (c) 2015 JMKLABS. All rights reserved.
//

import UIKit

class SubmitErrorViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    
    var url:NSURL = NSURL(fileURLWithPath: "https://docs.google.com/forms/d/1BQOnBzvpp1H2APehnaQN5LM4uZ2Xwn1ARQspgFziI7U/viewform?usp=send_form")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let requestObj = NSURLRequest(URL: url)
        webView.loadRequest(requestObj)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
