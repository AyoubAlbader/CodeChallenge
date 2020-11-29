//
//  SenatorsListTableViewController.swift
//  CodeChallenge
//
//  Created by Ayoub Al Bader on 29/11/2020.
//

import UIKit

class SenatorsListTableViewController: UITableViewController {

    // MARK: - Proprties
    var viewModel: SenatorsListTableViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - Table view data source
extension SenatorsListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        return cell
    }
}
