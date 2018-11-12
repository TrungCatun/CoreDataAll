//
//  TableViewController.swift
//  CoreDataFirt2
//
//  Created by Trung on 11/7/18.
//  Copyright © 2018 Trung. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var arrayName: [Person] = []
//    var fetchResultController = 
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayName = try! AppDelegate.context?.fetch(Person.fetchRequest()) as! [Person]
        for i in arrayName {
            print(i.name)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         arrayName = try! AppDelegate.context?.fetch(Person.fetchRequest()) as! [Person]
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayName.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(arrayName[indexPath.row].age)
        cell.detailTextLabel?.text = arrayName[indexPath.row].name

        return cell
    }
    
    // delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            AppDelegate.context?.delete(arrayName[indexPath.row]) // delete in core data
            arrayName.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            AppDelegate.saveContext()
        }
    }
   
}
