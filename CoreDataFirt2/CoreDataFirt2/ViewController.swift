//
//  ViewController.swift
//  CoreDataFirt2
//
//  Created by Trung on 11/7/18.
//  Copyright © 2018 Trung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func save(_ sender: UIButton) {
        let name = Person(context: AppDelegate.context!)
        name.age = Int16(textField.text ?? "") ?? 0
        AppDelegate.saveContext()
    }
    

}

