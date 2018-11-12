//
//  TableViewController.swift
//  CoreDataFirt1
//
//  Created by Trung on 11/6/18.
//  Copyright © 2018 Trung. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var entities: [Entity]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        entities = try? AppDelegate.context.fetch(Entity.fetchRequest()) as [Entity]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return  entities == nil ? 0 : entities!.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = entities![indexPath.row].trung

        return cell
    }
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "pass":
        if let toDetailVC = segue.destination as? DetailViewController {
            if let index = tableView.indexPathForSelectedRow {
                toDetailVC.dataDetail = entities![index.row].trung
            }
        }
        default:
            return
        }
    }

    
}
