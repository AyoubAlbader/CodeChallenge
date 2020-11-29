//
//  SenatorDetailsHeader.swift
//  CodeChallenge
//
//  Created by Ayoub Al Bader on 29/11/2020.
//

import UIKit

class SenatorDetailsHeader: UIView {

    var senator: Objects? {
        didSet {
            senatorImage.image = senator?.party == "Democrat" ? UIImage(named: PartyImage.democrat.rawValue) : UIImage(named: PartyImage.republican.rawValue)
            senatorNameLabel.text = "\(senator?.person?.firstname ?? "") \(senator?.person?.lastname ?? "")"
            senatorLinkLabel.text = senator?.person?.link ?? ""
            bioIdLabel.text = senator?.person?.bioguideid ?? ""
            partyLabel.text = senator?.party ?? ""
        }
    }

    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#ffffff")
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        return view
    }()

    private let senatorImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: ""))
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private let senatorNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#8b8da1")
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()

    private let senatorLinkLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#b7b5c1")
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let bioGuideIdLabel: UILabel = {
        let label = UILabel()
        label.text = "Bio Guide Id"
        label.textColor = UIColor(hexString: "#b7b5c1")
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let bioIdLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#8b8da1")
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let partyValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Party"
        label.textColor = UIColor(hexString: "#b7b5c1")
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let partyLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#8b8da1")
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()

    private let emailPhoto: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "email"))
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private let phonePhoto: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "phone"))
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private let speakPhoto: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "speak"))
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cardView)
        addSubview(senatorImage)
        cardView.addSubview(senatorNameLabel)
        cardView.addSubview(senatorLinkLabel)
        cardView.addSubview(bioGuideIdLabel)

        cardView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,
                        paddingTop: 0, paddingLeft: 20, paddingBottom: 10, paddingRight: 20,
                        paddingCenterX: 0, paddingCenterY: 0,
                        width: 0, height: 350, enableInsets: false)


        senatorImage.anchor(top: cardView.topAnchor, centerX: cardView.centerXAnchor,
                          paddingTop: -35, paddingLeft: 0, paddingBottom: 0, paddingRight: 10,
                          paddingCenterX: 0, paddingCenterY: 0,
                          width: 70, height: 70, enableInsets: false)

        senatorNameLabel.anchor(top: cardView.topAnchor,
                             centerX: cardView.centerXAnchor,
                             paddingTop: 80, paddingLeft: 0,
                             paddingBottom: 0, paddingRight: 0,
                             paddingCenterX: 0, paddingCenterY: 0,
                             width: 0, height: 0,
                             enableInsets: false)

        senatorLinkLabel.anchor(top: senatorNameLabel.bottomAnchor, left: cardView.leftAnchor, right: cardView.rightAnchor,
                                     centerX: cardView.centerXAnchor,
                                     paddingTop: 10, paddingLeft: 20,
                                     paddingBottom: 0, paddingRight: 20,
                                     paddingCenterX: 0, paddingCenterY: 0,
                                     width: 0, height: 0,
                                     enableInsets: false)

        lineView.widthAnchor.constraint(equalToConstant: 1).isActive = true

        let bioStackView = UIStackView(arrangedSubviews: [bioGuideIdLabel, bioIdLabel])
        bioStackView.axis = .vertical
        bioStackView.spacing = 10
        bioStackView.distribution = .fill

        let partyStackView = UIStackView(arrangedSubviews: [partyValueLabel, partyLabel])
        partyStackView.axis = .vertical
        partyStackView.spacing = 10
        partyStackView.distribution = .fill

        let stackView = UIStackView(arrangedSubviews: [bioStackView, lineView, partyStackView])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillProportionally

        cardView.addSubview(stackView)

        stackView.anchor(top: senatorLinkLabel.topAnchor, left: cardView.leftAnchor, right: cardView.rightAnchor,
                         centerX: cardView.centerXAnchor,
                         paddingTop: 50, paddingLeft: 50,
                         paddingBottom: 0, paddingRight: 50,
                         paddingCenterX: 0, paddingCenterY: 0,
                         width: 0, height: 0,
                         enableInsets: false)

        let imagesStackView = UIStackView(arrangedSubviews: [emailPhoto, phonePhoto, speakPhoto])
        imagesStackView.axis = .horizontal
        imagesStackView.spacing = 20
        imagesStackView.distribution = .fillEqually

        cardView.addSubview(imagesStackView)

        imagesStackView.anchor(bottom: bottomAnchor,
                         centerX: cardView.centerXAnchor,
                         paddingTop: 0, paddingLeft: 0,
                         paddingBottom: 50, paddingRight: 0,
                         paddingCenterX: 0, paddingCenterY: 0,
                         width: 160, height: 40,
                         enableInsets: false)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
