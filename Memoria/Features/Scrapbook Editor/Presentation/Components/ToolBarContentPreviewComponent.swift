//
//  ToolBarContentPreviewComponent.swift
//  Memoria
//
//  Created by Ronald Sumichael Sunan on 04/05/23.
//

import UIKit

extension ScrapbookEditorViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    // MARK: Make ToolBar Content
    func makeToolBarContent() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 40, height: 40)
        layout.scrollDirection = .horizontal
        
        editorViewModel.toolContentView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        editorViewModel.toolContentView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        editorViewModel.toolContentView?.backgroundColor = UIColor(red: 49 / 255, green: 49 / 255, blue: 49 / 255, alpha: 0.7)
        view.addSubview(editorViewModel.toolContentView ?? UICollectionView())
        
        editorViewModel.toolContentView?.translatesAutoresizingMaskIntoConstraints = false
        editorViewModel.toolContentView?.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        editorViewModel.toolContentView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        editorViewModel.toolContentView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        editorViewModel.toolContentView?.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        editorViewModel.toolContentView?.dataSource = self
        editorViewModel.toolContentView?.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return editorViewModel.toolContentCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        
        if editorViewModel.selectedTool == "Background" {
            myCell.backgroundColor = editorViewModel.canvasColors[indexPath.row]
            myCell.layer.cornerRadius = 8
        } else if editorViewModel.selectedTool == "Sticker" {
            let imageView = UIImageView(image: UIImage(named: "Sticker/\(indexPath.row)"))
            imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            myCell.addSubview(imageView)
        } else if editorViewModel.selectedTool == "Shape" {
            let imageView = UIImageView(image: UIImage(named: "Shape/\(indexPath.row)"))
            imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            myCell.addSubview(imageView)
        }
        
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on \(editorViewModel.selectedTool) \(indexPath.row)")
        
        if editorViewModel.selectedTool == "Background"{
            editorViewModel.canvasView.backgroundColor = editorViewModel.canvasColors[indexPath.row]
        } else if editorViewModel.selectedTool == "Sticker" {
            makeImageView(image: UIImage(named: "Sticker/\(indexPath.row)")!, isShape: false)
        } else if editorViewModel.selectedTool == "Shape" {
            editorViewModel.selectedShape = indexPath.row
            let colorPicker = UIColorPickerViewController()
            colorPicker.delegate = self
            present(colorPicker, animated: true)
        }
    }
}

extension ScrapbookEditorViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        editorViewModel.selectedColor = viewController.selectedColor
        let shape = (UIImage(named: "Shape/\(editorViewModel.selectedShape)")!.withRenderingMode(.alwaysTemplate))
        makeImageView(image: shape, color: editorViewModel.selectedColor, scale: 1, isShape: true)
    }
}
