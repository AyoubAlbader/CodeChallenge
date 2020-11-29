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
        tableView.backgroundColor = UIColor(hexString: "#fbfbfd")
        setupNavigationBar()
        setupTableHeaderView()
        registerCells()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    // MARK: - Methods
    func setupNavigationBar() {
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }

    func setupTableHeaderView() {
        let senatorDetailsHeader = SenatorDetailsHeader(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 400))
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
        cell?.backgroundColor = .clear
        cell?.selectionStyle = .none
        return cell!
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
