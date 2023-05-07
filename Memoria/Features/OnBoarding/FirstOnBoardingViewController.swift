//
//  FirstOnBoardingViewController.swift
//  Memoria
//
//  Created by Ronald Sumichael Sunan on 07/05/23.
//

import UIKit

class FirstOnBoardingViewController: UIViewController {

    let backgound = UIImageView(image: UIImage(named: "OnBoarding/1"))
    var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setAttributedTitle(NSAttributedString(string: "Next", attributes: [NSAttributedString.Key.font: UIFont(name: "Poppins-Bold", size: 22)!]), for: .normal)
        button.tintColor = .white
        button.backgroundColor = I.primaryButton.color(compatibleWith: .current)
        button.layer.cornerRadius = 16
        button.frame = CGRect(x: 60, y: 700, width: 270, height: 50)
        button.addTarget(self, action: #selector(toNextView), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgound.frame = view.frame
        view.addSubview(backgound)
        
        view.addSubview(nextButton)
    }
    
    @objc func toNextView(_ sender: Any) {
        navigationController?.pushViewController(SecondOnBoardingViewController(), animated: true)
    }

}
