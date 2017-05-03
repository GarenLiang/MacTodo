//
//  ViewController.swift
//  Todo List
//
//  Created by GarenLiang on 2017/5/1.
//  Copyright © 2017年 GarenLiang. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    @IBOutlet weak var importantCheckbox: NSButton!
    @IBOutlet weak var textField: NSTextField!
    
    @IBOutlet weak var tableView: NSTableView!
    var toDoItems : [ToDoItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getToDoItems()
    }
    func getToDoItems() {
        //get the todoItems from coredata
        if let context = (NSApplication.shared().delegate as?
            AppDelegate)?.persistentContainer.viewContext {
            do {
                //set them to class property
                toDoItems = try context.fetch(ToDoItem.fetchRequest())
                print(toDoItems.count)
            } catch {
            
            }
        }
        //update table
        tableView.reloadData()
    }
    @IBAction func addClicked(_ sender: AnyObject) {
        if textField.stringValue != "" {
            if let context = (NSApplication.shared().delegate as?
                AppDelegate)?.persistentContainer.viewContext {
                let toDoItem = ToDoItem(context: context)
                
                toDoItem.name = textField.stringValue
                if importantCheckbox.state == 0 {
                    //not important
                    toDoItem.important = false
                } else {
                    //important
                    toDoItem.important = true
                }
                (NSApplication.shared().delegate as?
                    AppDelegate)?.saveAction(nil)
                textField.stringValue = ""
                importantCheckbox.state = 0
                
                getToDoItems()
            }
        }
    }
    // tableview stuff
    func numberOfRows(in tableView: NSTableView) -> Int {
        return toDoItems.count
    }
    func tableView(_ tableView: NSTableView, viewFor tableColum: NSTableColumn?, row: Int) -> NSView? {
        if let cell = tableView.make(withIdentifier: "importantCell", owner: self) as? NSTableCellView {
            cell.textField?.stringValue = "HELLO"
            return cell
        }
        return nil
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

