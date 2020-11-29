//
//  SenatorsCoordinatorViewController.swift
//  CodeChallenge
//
//  Created by Ayoub Al Bader on 29/11/2020.
//

import UIKit

class SenatorsCoordinatorViewController: UINavigationController {

    // MARK: - Proprties
    var viewModel: SenatorsCoordinatorViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadUSSenators()
    }

}

// MARK: - SenatorsCoordinatorDelegate
extension SenatorsCoordinatorViewController: SenatorsCoordinatorDelegate {
    func changeView(to senatorsView: SenatorsView) {
        switch senatorsView {
        case .senatorsList(let senators):
            presentSenatorsList(senators: senators)
        case .senatorDetails(let senator):
            presentSenatorDetails(senator: senator)
        }
    }
}

// MARK: - Screen Presentation
extension SenatorsCoordinatorViewController {
    func presentSenatorsList(senators: Senators) {
        let senatorsListTableViewController = SenatorsListTableViewController(style: .plain)
        senatorsListTableViewController.viewModel = SenatorsListTableViewModel(senators: senators,
                                                                               senatorsListDelegate: viewModel)
        pushViewController(senatorsListTableViewController, animated: true)
    }

    func presentSenatorDetails(senator: Objects) {
        let senatorDetailsTableViewController = SenatorDetailsTableViewController(style: .plain)
        senatorDetailsTableViewController.viewModel = SenatorDetailsViewModel(senator: senator)
        pushViewController(senatorDetailsTableViewController, animated: true)
    }
}
