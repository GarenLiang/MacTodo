//
//  ViewController.swift
//  Todo List
//
//  Created by GarenLiang on 2017/5/1.
//  Copyright © 2017年 GarenLiang. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var importantCheckbox: NSButton!
    @IBOutlet weak var textField: NSTextField!
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

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

