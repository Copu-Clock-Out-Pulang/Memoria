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

        toolContentView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        toolContentView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        toolContentView?.backgroundColor = UIColor(red: 49 / 255, green: 49 / 255, blue: 49 / 255, alpha: 0.7)
        view.addSubview(toolContentView ?? UICollectionView())

        toolContentView?.translatesAutoresizingMaskIntoConstraints = false
        toolContentView?.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        toolContentView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        toolContentView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        toolContentView?.heightAnchor.constraint(equalToConstant: 60).isActive = true

        toolContentView?.dataSource = self
        toolContentView?.delegate = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return toolContentCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)

        if selectedTool == "Background" {
            myCell.backgroundColor = canvasColors[indexPath.row]
            myCell.layer.cornerRadius = 8
        } else if selectedTool == "Sticker" {
            let imageView = UIImageView(image: UIImage(named: "Sticker/\(indexPath.row)"))
            imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            myCell.addSubview(imageView)
        } else if selectedTool == "Shape" {
            let imageView = UIImageView(image: UIImage(named: "Shape/\(indexPath.row)"))
            imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            myCell.addSubview(imageView)
        }

        return myCell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on \(selectedTool) \(indexPath.row)")

        if selectedTool == "Background"{
            canvasView.backgroundColor = canvasColors[indexPath.row]
        } else if selectedTool == "Sticker" {
            makeImageView(image: UIImage(named: "Sticker/\(indexPath.row)")!, isShape: false)
        } else if selectedTool == "Shape" {
            selectedShape = indexPath.row
            let colorPicker = UIColorPickerViewController()
            colorPicker.delegate = self
            present(colorPicker, animated: true)
        }
    }
}

extension ScrapbookEditorViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        selectedColor = viewController.selectedColor
        let shape = (UIImage(named: "Shape/\(selectedShape)")!.withRenderingMode(.alwaysTemplate))
        makeImageView(image: shape, color: selectedColor, scale: 1, isShape: true)
    }
}
