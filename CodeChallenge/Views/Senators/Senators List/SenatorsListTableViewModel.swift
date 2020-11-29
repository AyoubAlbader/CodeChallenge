//
//  SenatorsListTableViewModel.swift
//  CodeChallenge
//
//  Created by Ayoub Al Bader on 29/11/2020.
//

import Foundation

protocol SenatorsListDelegate {
    func didSelectSenator(senator: Objects)
}

class SenatorsListTableViewModel {

    // MARK: - Proprties
    let senators: Senators
    let senatorsListDelegate: SenatorsListDelegate

    init(senators: Senators, senatorsListDelegate: SenatorsListDelegate) {
        self.senators = senators
        self.senatorsListDelegate = senatorsListDelegate
    }

}

// MARK: - Table view builder
extension SenatorsListTableViewModel {
    var numberOfRows: Int {
        return senators.objects.count
    }
}
