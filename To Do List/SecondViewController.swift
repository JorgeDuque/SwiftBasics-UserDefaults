//
//  SecondViewController.swift
//  To Do List
//
//  Created by Jorge Duque on 12/6/16.
//  Copyright © 2016 Jorgeduque. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textFieldItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Add item to array (and save array with NSUserDefaults
    @IBAction func buttonAdd(_ sender: AnyObject) {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        var items:[String]
        
        if let tempItems = itemsObject as? [String]{
            items = tempItems
            items.append(textFieldItem.text!)
            
        } else{
            items = [textFieldItem.text!]
        }
        
        UserDefaults.standard.set(items, forKey:"items")
        textFieldItem.text = ""
    }
    
    //Hide Keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

