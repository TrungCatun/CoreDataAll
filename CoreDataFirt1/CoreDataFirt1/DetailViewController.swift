//
//  ViewController.swift
//  CoreDataFirt1
//
//  Created by Trung on 11/6/18.
//  Copyright © 2018 Trung. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    var dataDetail: String?
    
    @IBAction func save(_ sender: UIButton) {
        let entity = Entity(context: AppDelegate.context )
        entity.trung = textField.text
        AppDelegate.saveContext()
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if dataDetail != nil {
            textField.text = dataDetail
        }
    }


}

