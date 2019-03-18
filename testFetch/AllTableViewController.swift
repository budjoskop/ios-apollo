//
//  AllTableViewController.swift
//  testFetch
//
//  Created by ognjen on 3/10/19.
//  Copyright © 2019 ognjen. All rights reserved.
//

import UIKit



class AllTableViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {
    
    
    var posts: [ViewControllerQuery.Data.Node]? {
        didSet {
            tableViewOutlet.reloadData()
        }
    }
    
    let cell = TableViewCell()
    @IBOutlet var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableViewOutlet.rowHeight = 500
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (posts?.count) ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllCell", for: indexPath) as! TableViewCell
        
        guard let post = posts?[indexPath.row] else {
            fatalError("Could not find post at row \(indexPath.row)")
        }
        
        cell.configure(with: post)
        
        return cell
    }
    
    
    // MARK: LOAD DATA
    
    
    
    func loadData () {
        let query = ViewControllerQuery()
        Apollo.shared.client.fetch(query: query) { (result, error) in
            if let error = error {
                print("There was an error trying to feth data, error is: \(error)")
            }
            
            guard let data = result?.data else {return}
            guard let result = data.nodes else {return}
            self.posts = result as! [ViewControllerQuery.Data.Node]
        }
    }
    
    
    
    
}
