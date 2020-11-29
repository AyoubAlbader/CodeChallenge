//
//  Senators.swift
//  CodeChallenge
//
//  Created by Ayoub Al Bader on 29/11/2020.
//

import Foundation

// MARK: - Senators
struct Senators: Codable {
    let objects: [Objects]
}

// MARK: - Objects
struct Objects: Codable {
    let caucus: String?
    let congress_numbers: [Int]?
    let current: Bool?
    let description: String?
    let district: String?
    let enddate: String?
    let extra: Extra?
    let leadership_title: String?
    let party: String?
    let person: Person?
    let phone: String?
    let role_type: String?
    let role_type_label: String?
    let senator_class: String?
    let senator_class_label: String?
    let senator_rank: String?
    let senator_rank_label: String?
    let startdate: String?
    let state: String?
    let title: String?
    let title_long: String?
    let website: String?
}

// MARK: - Extra
struct Extra: Codable {
    let address: String?
    let contact_form: String?
    let fax: String?
    let office: String?
    let rss_url: String?
}

// MARK: - Person
struct Person: Codable {
    let bioguideid: String?
    let birthday: String?
    let cspanid: Int?
    let firstname: String?
    let gender: String?
    let gender_label: String?
    let lastname: String?
    let link: String?
    let middlename: String?
    let name: String?
    let namemod: String?
    let nickname: String?
    let osid: String?
    let pvsid: String?
    let sortname: String?
    let twitterid: String?
    let youtubeid: String?
}
