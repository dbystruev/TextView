//
//  ViewController.swift
//  TextView
//
//  Created by Denis Bystruev on 19.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlet
    /// The example text view
    @IBOutlet weak var textView: UITextView! {
        // Called after text view from storyboard is tied with this outlet
        didSet {
            // Save gesture recognizer for future removal
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(textViewTapped(_:)))
            self.tapRecognizer = tapRecognizer
            
            // Allow cursor to blink
            textView.becomeFirstResponder()
            
            // Don't show keyboard by assigning empty UIView to input view
            textView.inputView = UIView()
            
            // Enable to recognizer user tap for future removal of input view
            textView.addGestureRecognizer(tapRecognizer)
        }
    }
    
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
        textView.removeGestureRecognizer(tapRecognizer)
        tapRecognizer = nil
        
        // Remove empty input view — this will show the keyboard again
        textView.inputView = nil
        textView.reloadInputViews()
    }
}
