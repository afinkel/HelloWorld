//
//  ViewController.swift
//  HelloWorld
//
//  Created by Alex Finkel on 2016-02-08.
//  Copyright © 2016 ScotiaBank. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: outlets
    @IBOutlet weak var navigationTableView: UITableView!
    
    
    struct TableViewConstants {
        static let tableViewCellIdentifier = "NavTableViewCell"
    }

    //data
    lazy var tableViewItems: [String] = {
        var aVal = [String]()
        aVal.append("Bots")
        return aVal
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("Hello Skyline")
        self.title = "Skyline"
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueToBots" {
            //use in case if destination needs to be passed some data to
            guard let destination = segue.destinationViewController as? BotsTableViewController else { return }
            destination.title = "Bots"
        }
        super.prepareForSegue(segue, sender: sender)
    }

    
    // MARK: UITableViewDataSource
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewItems.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableViewConstants.tableViewCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        cell.textLabel!.text = tableViewItems[indexPath.row]
        return cell
    }
    
     func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.textLabel!.text = tableViewItems[indexPath.row]
    }
    
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let aValue = tableViewItems[indexPath.row]
        if aValue == "Bots" {
            performSegueWithIdentifier("segueToBots", sender: indexPath.row)
        }
    }

}

