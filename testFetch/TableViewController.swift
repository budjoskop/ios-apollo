//
//  TableViewController.swift
//  testFetch
//
//  Created by ognjen on 3/20/19.
//  Copyright © 2019 ognjen. All rights reserved.
//

import UIKit
import Apollo

class TableViewController: UITableViewController {

    var posts: [ViewControllerQuery.Data.Node]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    let cell = TableViewCell()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.rowHeight = 500
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (posts?.count) ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllCell", for: indexPath) as! TableViewCell
        
        guard let post = posts?[indexPath.row] else {
            fatalError("Could not find post at row \(indexPath.row)")
        }
        
        cell.configure(with: post)
        
        return cell
    }
    
    
    // MARK: LOAD DATA
    
    var watcher: GraphQLQueryWatcher<ViewControllerQuery>?
    
    func loadData () {
        
        watcher = apolloClient.watch(query: ViewControllerQuery()) { (result, error) in
            if let error = error {
                NSLog("Error while fetching query: \(error.localizedDescription)")
            }
            guard let data = result?.data else {return}
            guard let result = data.nodes else {return}
            self.posts = result as! [ViewControllerQuery.Data.Node]
            
        }
    }
}
