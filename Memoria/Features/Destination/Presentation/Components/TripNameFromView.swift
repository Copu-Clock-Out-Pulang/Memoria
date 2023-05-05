//
//  TripNameFromView.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 02/05/23.
//

import SnapKit
import UIKit

class TripNameFromView: UIView {
    lazy var pageTitle: UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.numberOfLines = 0
        title.font = UIFont(name: "LilitaOne", size: 40.0)
        title.text = S.dstCreateYourTrip
        title.textColor = I.textPrimary.color(compatibleWith: .current)
        return title
    }()
    lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.distribution = .equalSpacing
        [tripNameField, loginButton]
            .forEach {
                stack.addArrangedSubview($0)
            }
        return stack
    }()
    lazy var tripNameField: UITextField = {
        let field = UITextField()
        field.placeholder = S.dstTripInputHint
        return field

    }()
    lazy var loginButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle(S.dstNext, for: UIControl.State())
        return button
    }()

    init() {
        super.init(frame: .infinite)

        self.backgroundColor = UIColor(patternImage: I.backgroundImage1.image)

        addSubViews(view: [pageTitle, contentStack])
        pageTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-250)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)

        }
        contentStack.snp.makeConstraints { make in
            make.centerX.left.right.equalTo(pageTitle)
            make.top.equalTo(pageTitle.snp.bottom).offset(30)
            make.height.equalTo(280)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
