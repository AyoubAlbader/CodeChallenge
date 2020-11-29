//
//  SenatorDetailsViewModel.swift
//  CodeChallenge
//
//  Created by Ayoub Al Bader on 29/11/2020.
//

import Foundation

enum SenatorDetailsSections: String, CaseIterable {
    case address = "Address"
    case office = "Office"
    case name = "Name"
    case birthday = "Birthday"
    case endDate = "End Date"
    case gender = "Gender"
    case sortName = "Sort Name"
    case website = "Website"
    case phone = "Phone"
}

class SenatorDetailsViewModel {

    // MARK: - Proprties
    let senator: Objects
    let senatorDetailsSections: [SenatorDetailsSections]

    init(senator: Objects) {
        self.senator = senator
        senatorDetailsSections = SenatorDetailsSections.allCases
    }
}

// MARK: - Table view builder
extension SenatorDetailsViewModel {
    var numberOfRows: Int {
        return senatorDetailsSections.count
    }

    func cellTitle(for row: Int) -> String {
        return senatorDetailsSections[row].rawValue
    }

    func cellInformation(for row: Int) -> String {
        switch senatorDetailsSections[row] {
        case .address:
            return senator.extra?.address ?? ""
        case .office:
            return senator.extra?.office ?? ""
        case .name:
            return senator.person?.name ?? ""
        case .birthday:
            return senator.person?.birthday ?? ""
        case .endDate:
            return senator.enddate ?? ""
        case .gender:
            return senator.person?.gender ?? ""
        case .sortName:
            return senator.person?.sortname ?? ""
        case .website:
            return senator.website ?? ""
        case .phone:
            return senator.phone ?? ""
        }
    }
}
