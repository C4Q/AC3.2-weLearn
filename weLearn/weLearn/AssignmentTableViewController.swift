//
//  HomeworkTableViewController.swift
//  weLearn
//
//  Created by Karen Fuentes on 2/27/17.
//  Copyright © 2017 Victor Zhong. All rights reserved.
//

import UIKit

class AssignmentTableViewController: UITableViewController {
    
    var assignments = [Assignment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Assignments"
        
        tableView.register(AssignmentTableViewCell.self, forCellReuseIdentifier: "AssignmentTableViewCell")
        
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 268.0
        
        fakePopulate([Assignment(date: "Feb 12, 2017", assignmentTitle: "Final", score: "A", url: "www.google.com"), Assignment(date: "October 1, 2016", assignmentTitle: "Battleship Homework", score: "A", url: "www.google.com"), Assignment(date: "September 20, 2016", assignmentTitle: "Tableview Exam", score: "A", url: "www.google.com")])
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func fakePopulate(_ items: [Assignment]) {
        self.assignments = items
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return assignments.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AssignmentTableViewCell", for: indexPath)
        
        if let assignmentCell = cell as? AssignmentTableViewCell {
            assignmentCell.gradeLabel.text = assignments[indexPath.row].score
            assignmentCell.assignmentNameLabel.text = assignments[indexPath.row].assignmentTitle
            assignmentCell.dateLabel.text = assignments[indexPath.row].date
            guard assignments[indexPath.row].url != nil else {
                assignmentCell.repoLink.isHidden = true
                return cell
            }
            assignmentCell.repoLink.setTitle("Link to Repo", for: .normal)
        }
        
        return cell
    }
    
}