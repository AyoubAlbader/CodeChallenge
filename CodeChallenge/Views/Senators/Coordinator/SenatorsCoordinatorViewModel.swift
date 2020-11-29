//
//  SenatorsCoordinatorViewModel.swift
//  CodeChallenge
//
//  Created by Ayoub Al Bader on 29/11/2020.
//

import Foundation

enum SenatorsView {
    case senatorsList(with: Senators)
}

protocol SenatorsCoordinatorDelegate {
    func changeView(to senatorsView: SenatorsView)
}

class SenatorsCoordinatorViewModel {

    // MARK: - Proprties
    var senators: Senators? {
        didSet {
            guard let senators = senators else { return }
            senatorsCoordinatorDelegate.changeView(to: .senatorsList(with: senators))
        }
    }
    let senatorsCoordinatorDelegate: SenatorsCoordinatorDelegate

    init(senatorsCoordinatorDelegate: SenatorsCoordinatorDelegate) {
        self.senatorsCoordinatorDelegate = senatorsCoordinatorDelegate
    }
    
}

// MARK: - Load Data
extension SenatorsCoordinatorViewModel {
    func loadUSSenators() {
        do {
            if let bundlePath = Bundle.main.path(forResource: "us_senators", ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let senators = try JSONDecoder().decode(Senators.self, from: jsonData)
                self.senators = senators
            }
        } catch {
            print(error)
        }
    }
}
