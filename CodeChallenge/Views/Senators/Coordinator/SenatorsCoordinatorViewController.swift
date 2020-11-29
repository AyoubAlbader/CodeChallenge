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
        }
    }
}

// MARK: - Screen Presentation
extension SenatorsCoordinatorViewController {
    func presentSenatorsList(senators: Senators) {
        
    }
}
