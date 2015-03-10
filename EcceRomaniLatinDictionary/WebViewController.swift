//
//  WebViewController.swift
//  EcceRomaniLatinDictionary
//
//  Created by Josh Kallus on 2/21/15.
//  Copyright (c) 2015 JMKLABS. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    var url: NSURL?
    
    
    @IBOutlet weak var webView: UIWebView!
    
    
    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        if webView.canGoBack{
            webView.goBack()
        }
    }
    @IBAction func forwardButtonPressed(sender: UIBarButtonItem) {
        if webView.canGoForward{
            webView.goForward()
        }
    }
    @IBAction func refreshButtonPressed(sender: UIBarButtonItem) {
        webView.reload()
    }
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        if webView.loading != true{
            webView.stopLoading()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let requestObj = NSURLRequest(URL: url!)
        webView.loadRequest(requestObj)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}