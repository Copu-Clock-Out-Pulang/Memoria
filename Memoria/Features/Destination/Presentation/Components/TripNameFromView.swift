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
        stack.distribution = .fill
        stack.backgroundColor = .white
        [tripNameField, UIView.spacer(),  loginButton]
            .forEach {
                stack.addArrangedSubview($0)
            }
        return stack
    }()
    lazy var tripNameField: UITextField = {
        let field = UITextField(frame: CGRect(x: 0, y: 20, width: 100, height: 20))
        field.placeholder = S.dstTripInputHint
        field.layer.cornerRadius = 20
        field.layer.borderWidth = 2
        field.addPadding(padding: .equalSpacing(20))
        field.clipsToBounds = true
        return field
        
    }()
    lazy var loginButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle(S.dstNext, for: UIControl.State())
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.tintColor = I.primaryButton.color(compatibleWith: .current)
        button.titleLabel?.font = UIFont(name: "Poppins-Bold", size: 20)
        return button
    }()

    init() {
        super.init(frame: .infinite)
        
        self.backgroundColor = UIColor(patternImage: I.tripBackground1.image)
        
        addSubViews(view: [pageTitle, contentStack])
        pageTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-250)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            
        }
        contentStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(20)
            make.top.equalTo(pageTitle.snp.bottom).offset(64)
            make.height.equalTo(280)
        }
        
        tripNameField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)

        }
        loginButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)

            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
    }
      
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
