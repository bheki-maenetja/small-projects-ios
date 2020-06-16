//
//  ViewController.swift
//  Notes
//
//  Created by Bheki Maenetja on 2020/06/16.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var notes: [Note] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].content
        return cell
    }

}

