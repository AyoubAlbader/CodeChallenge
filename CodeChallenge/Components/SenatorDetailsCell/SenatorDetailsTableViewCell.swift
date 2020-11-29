//
//  SenatorDetailsTableViewCell.swift
//  CodeChallenge
//
//  Created by Ayoub Al Bader on 29/11/2020.
//

import UIKit

class SenatorDetailsTableViewCell: UITableViewCell {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#b7b5c1")
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    let informationLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#8b8da1")
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundView?.backgroundColor = .clear
        addSubview(titleLabel)
        addSubview(informationLabel)

        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: informationLabel.topAnchor, right: rightAnchor,
                          paddingTop: 10, paddingLeft: 20, paddingBottom: 5, paddingRight: 20, paddingCenterX: 0, paddingCenterY: 0, width: 0, height: 0, enableInsets: false)

        informationLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, right: rightAnchor,
                                paddingTop: 5, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, paddingCenterX: 0, paddingCenterY: 0, width: 0, height: 0, enableInsets: false)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
