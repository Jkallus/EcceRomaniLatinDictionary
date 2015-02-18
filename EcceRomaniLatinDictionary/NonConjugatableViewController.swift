//
//  NonConjugatableViewController.swift
//  EcceRomaniLatinDictionary
//
//  Created by Josh Kallus on 2/17/15.
//  Copyright (c) 2015 JMKLABS. All rights reserved.
//

import UIKit

class NonConjugatableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    let word: Word?
    
    @IBOutlet weak var propertiesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell
    
        return cell
    }
    
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }
    
    
}
