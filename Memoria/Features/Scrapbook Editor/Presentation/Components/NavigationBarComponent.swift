//
//  NavigationBarComponent.swift
//  Memoria
//
//  Created by Ronald Sumichael Sunan on 04/05/23.
//

import UIKit

extension ScrapbookEditorViewController {
    // MARK: Initialize Navigation Bar
    func makeNavigationBar() {
        navigationController?.navigationBar.backgroundColor = I.background.color(compatibleWith: .current)
        navigationController?.navigationBar.tintColor = I.primaryButton.color(compatibleWith: .current)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Poppins-Bold", size: 22)!]
        self.title = pageTitle
        
        makeLeftNavigationItems()
        makeRightNavigationItems()
    }
    
    // MARK: Left Navigation Item
    func makeLeftNavigationItems() {
        navigationItem.setLeftBarButton(UIBarButtonItem(title: "Load", style: .plain, target: self, action: #selector(loadData)), animated: true)
        navigationItem.leftBarButtonItems!.insert(UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButton)), at: 0)
    }
    
    // MARK: Right Navigation Item
    func makeRightNavigationItems() {
        navigationItem.setRightBarButton(UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareImage)), animated: true)
        navigationItem.rightBarButtonItems!.insert(UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveProgress)), at: 0)
    }
    
    // MARK: Drawing Left Navigation Item
    func makeDrawingLeftNavigationItem() {
        navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(systemName: "arrow.uturn.forward.circle.fill"), style: .plain, target: self, action: #selector(redoHandler)), animated: true)
        navigationItem.leftBarButtonItems!.insert(UIBarButtonItem(image: UIImage(systemName: "arrow.uturn.backward.circle.fill"), style: .plain, target: self, action: #selector(undoHandler)), at: 0)
    }
    
    // MARK: Drawing Right Navigation Item
    func makeDrawingRightNavigationItem() {
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(closeToolPicker)), animated: true)
    }
    
    @objc func backButton() {
        print("Back Button")
        navigationController?.popViewController(animated: true)
    }
}
