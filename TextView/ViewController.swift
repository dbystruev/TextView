//
//  ViewController.swift
//  TextView
//
//  Created by Denis Bystruev on 19.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlet
    /// Text view at the top of the screen
    @IBOutlet weak var topTextView: UITextView! {
        // Called after text view from storyboard is tied with this outlet
        didSet {
            // Save gesture recognizer for future removal
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(textViewTapped(_:)))
            self.tapRecognizer = tapRecognizer
            
            // Allow cursor to blink
            topTextView.becomeFirstResponder()
            
            // Don't show keyboard by assigning empty UIView to input view
            topTextView.inputView = UIView()
            
            // Enable to recognizer user tap for future removal of input view
            topTextView.addGestureRecognizer(tapRecognizer)
        }
    }
    
    /// Text view at the middle of the screen
    @IBOutlet weak var middleTextView: UITextView!
    
    // MARK: - Properties
    /// Tap gesture for the text view
    weak var tapRecognizer: UITapGestureRecognizer!
    
    // MARK: - Actions
    /// Called when user taps the text field
    /// - Parameter gesture: tap gesture the user has performed
    @objc func textViewTapped(_ gesture: UITapGestureRecognizer) {
        // Make sure the gesture is finished
        guard gesture.state == .ended else { return }
        
        // Remove gesture recognizer so the user won't tap again
        topTextView.removeGestureRecognizer(tapRecognizer)
        tapRecognizer = nil
        
        // Remove empty input view — this will show the keyboard again
        topTextView.inputView = nil
        topTextView.reloadInputViews()
        
        // Focus on top text view
        topTextView.becomeFirstResponder()
    }
}
