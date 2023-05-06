//
//  TempDetailViewController.swift
//  Memoria
//
//  Created by Ronald Sumichael Sunan on 06/05/23.
//

import UIKit

class TempDetailViewController: UIViewController {

    private let scrapPageViewModel = InjectionContainer.shared.container.resolve(ScrapPageViewModel.self)!
    let editorViewModel = ScrapBookEditorViewModel()
    var scrapPageData = ScrapPageStackData(id: UUID(), content: "", thumbnail: "")
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("To Editor", for: .normal)
        button.addTarget(self, action: #selector(toEditor), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = I.background.color(compatibleWith: .current)
        
        button.center = view.center
        view.addSubview(button)
        
        scrapPageData.content = editorViewModel.makeInitialContent(image: UIImage(named: "ScrapPageEditorBackground")!)
        scrapPageData.thumbnail = (UIImage(named: "ScrapPageEditorBackground")!.pngData()?.base64EncodedString())!
    }

    @objc func toEditor(_ sender: Any) {
        navigationController?.pushViewController(ScrapbookEditorViewController(
            scrapPageName: "Temp", scrapPageContent: scrapPageData.content, scrapPageThumbnail: scrapPageData.thumbnail, viewModel: scrapPageViewModel
        ), animated: true)
    }

}
