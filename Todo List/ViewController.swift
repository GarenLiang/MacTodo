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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addClicked(_ sender: AnyObject) {
        if textField.stringValue != "" {
            if let context = (NSApplication.shared().delegate as? AppDelegate)?.managedObjectContext {
                let toDoItem = ToDoItem(context: context)
                toDoItem.
            }
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

