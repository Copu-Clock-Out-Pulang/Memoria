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
        toolContentView?.removeFromSuperview()
        canvasView.subviews.forEach { sub in
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
        
        canvasView.drawingPolicy = .anyInput
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
        
        navigationItem.rightBarButtonItems!.removeAll()
        navigationItem.leftBarButtonItems!.removeAll()
        makeDrawingLeftNavigationItem()
        makeDrawingRightNavigationItem()
    }
    
    // MARK: Close ToolPicker
    @objc func closeToolPicker() {
        canvasView.subviews.forEach { sub in
            sub.isUserInteractionEnabled = true
            sub.alpha = 1
        }
        canvasView.drawingPolicy = .pencilOnly
        toolPicker.setVisible(false, forFirstResponder: canvasView)
        toolPicker.removeObserver(canvasView)
        
        redrawTopCanvas(image: canvasView.drawing.image(from: canvasView.bounds, scale: 1))
        
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
        canvasView.drawing = PKDrawing()
        view.subviews.forEach {sub in
            if sub.tag == 1 {
                sub.removeFromSuperview()
            }
        }
        redrawTopCanvas(image: canvasView.drawing.image(from: canvasView.bounds, scale: 1))
    }
}
