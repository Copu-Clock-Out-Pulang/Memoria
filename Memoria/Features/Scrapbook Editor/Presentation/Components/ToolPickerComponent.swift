//
//  ToolPickerComponent.swift
//  Memoria
//
//  Created by Ronald Sumichael Sunan on 04/05/23.
//

import UIKit
import PencilKit

extension ScrapbookEditorViewController {
    // MARK: Open ToolPicker
    @objc func openToolPicker(_ sender: Any) {
        editorViewModel.toolContentView?.removeFromSuperview()
        editorViewModel.canvasView.subviews.forEach { sub in
            print(sub)
            if sub.tag >= 1 {
                sub.isUserInteractionEnabled = false
                sub.alpha = 0.1
            }
        }
        view.subviews.forEach {sub in
            print(sub)
            if sub.tag == 1 {
                sub.removeFromSuperview()
            }
        }
        
        editorViewModel.canvasView.drawingPolicy = .anyInput
        editorViewModel.toolPicker.setVisible(true, forFirstResponder: editorViewModel.canvasView)
        editorViewModel.toolPicker.addObserver(editorViewModel.canvasView)
        editorViewModel.canvasView.becomeFirstResponder()
        
        navigationItem.rightBarButtonItems!.removeAll()
        navigationItem.leftBarButtonItems!.removeAll()
        makeDrawingLeftNavigationItem()
        makeDrawingRightNavigationItem()
    }
    
    // MARK: Close ToolPicker
    @objc func closeToolPicker() {
        editorViewModel.canvasView.subviews.forEach { sub in
            sub.isUserInteractionEnabled = true
            sub.alpha = 1
        }
        editorViewModel.canvasView.drawingPolicy = .pencilOnly
        editorViewModel.toolPicker.setVisible(false, forFirstResponder: editorViewModel.canvasView)
        editorViewModel.toolPicker.removeObserver(editorViewModel.canvasView)
        
        redrawTopCanvas(image: editorViewModel.canvasView.drawing.image(from: editorViewModel.canvasView.bounds, scale: 1))
        
        navigationItem.leftBarButtonItems!.removeAll()
        navigationItem.rightBarButtonItems!.removeAll()
        makeLeftNavigationItems()
        makeRightNavigationItems()
    }
    
    // MARK: Undo Handler
    @objc func undoHandler() {
        undoManager?.undo()
    }
    
    // MARK: Redo Handler
    @objc func redoHandler() {
        undoManager?.redo()
    }
    
    // MARK: Clear All Canvas Drawing
    @objc func clearDrawingHandler(sender: Any) {
        print("Test Handler")
        editorViewModel.canvasView.drawing = PKDrawing()
        view.subviews.forEach {sub in
            if sub.tag == 1 {
                sub.removeFromSuperview()
            }
        }
        redrawTopCanvas(image: editorViewModel.canvasView.drawing.image(from: editorViewModel.canvasView.bounds, scale: 1))
    }
}
