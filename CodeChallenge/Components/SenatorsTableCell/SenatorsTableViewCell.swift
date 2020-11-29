//
//  SenatorsTableViewCell.swift
//  CodeChallenge
//
//  Created by Ayoub Al Bader on 29/11/2020.
//

import UIKit

enum PartyImage: String {
    case republican = "republican_logo"
    case democrat = "democrat_logo"
    
}

class SenatorsTableViewCell: UITableViewCell {

    var senator: Objects? {
        didSet {
            senatorImage.image = senator?.party == "Democrat" ? UIImage(named: PartyImage.democrat.rawValue) : UIImage(named: PartyImage.republican.rawValue)
            senatorNameLabel.text = "\(senator?.person?.firstname ?? "") \(senator?.person?.lastname ?? "")"
            senatorPartyLabel.text = senator?.party ?? ""
            senatorDescriptionLabel.text = senator?.description ?? ""
        }
    }

    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#ffffff")
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        return view
    }()

    private let senatorNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#8b8da1")
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()


    private let senatorPartyLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#8b8da1")
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    private let senatorDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#b7b5c1")
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    private let senatorImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: ""))
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        return imageView
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundView?.backgroundColor = .clear
        addSubview(cardView)
        cardView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,
                              paddingTop: 10, paddingLeft: 20, paddingBottom: 10, paddingRight: 20,
                              paddingCenterX: 0, paddingCenterY: 0,
                              width: 0, height: 0, enableInsets: false)

        cardView.addSubview(senatorImage)
        senatorImage.anchor(top: cardView.topAnchor, left: cardView.leftAnchor, bottom: cardView.bottomAnchor,
                          paddingTop: 15, paddingLeft: 10, paddingBottom: 15, paddingRight: 0, paddingCenterX: 0, paddingCenterY: 0,
                          width: 70, height: 70, enableInsets: false)

        let stackView = UIStackView(arrangedSubviews: [senatorNameLabel, senatorPartyLabel, senatorDescriptionLabel])
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 5
        cardView.addSubview(stackView)

        stackView.anchor(left: senatorImage.rightAnchor, right: cardView.rightAnchor,
                         centerY: cardView.centerYAnchor,
                         paddingTop: 0, paddingLeft: 10,
                         paddingBottom: 0, paddingRight: 40,
                         paddingCenterX: 0, paddingCenterY: 0,
                         width: 0, height: 0,
                         enableInsets: false)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
