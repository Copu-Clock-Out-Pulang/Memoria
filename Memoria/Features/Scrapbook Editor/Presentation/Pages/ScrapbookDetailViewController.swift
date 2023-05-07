//
//  ScrapBookDetailViewController.swift
//  Memoria
//
//  Created by Ronald Sumichael Sunan on 04/05/23.
//

import UIKit

class ScrapbookDetailViewController: UIViewController {

    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("To Editor", for: .normal)
        button.addTarget(Any.self, action: #selector(toEditor), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = I.background.color(compatibleWith: .current)
        view.addSubview(button)
        button.center = view.center
        // Do any additional setup after loading the view.
    }

    @objc func toEditor() {
        navigationController?.pushViewController(ScrapbookEditorViewController(temp: "Masuk"), animated: true)
    }


    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
