//
//  SenatorDetailsTableViewController.swift
//  CodeChallenge
//
//  Created by Ayoub Al Bader on 29/11/2020.
//

import UIKit

class SenatorDetailsTableViewController: UITableViewController {

    // MARK: - Proprties
    var viewModel: SenatorDetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        setupTableHeaderView()
        registerCells()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    // MARK: - Methods
    func setupTableHeaderView() {
        let senatorDetailsHeader = SenatorDetailsHeader(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 450))
        senatorDetailsHeader.senator = viewModel.senator
        tableView.tableHeaderView = senatorDetailsHeader
    }

    func registerCells() {
        tableView.register(SenatorDetailsTableViewCell.self, forCellReuseIdentifier: "SenatorDetailsTableViewCell")
    }
}

// MARK: - Table view data source
extension SenatorDetailsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SenatorDetailsTableViewCell", for: indexPath) as? SenatorDetailsTableViewCell
        cell?.titleLabel.text = viewModel.cellTitle(for: indexPath.row)
        cell?.informationLabel.text = viewModel.cellInformation(for: indexPath.row)
        return cell!
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
