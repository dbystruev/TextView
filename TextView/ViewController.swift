//
//  ViewController.swift
//  TextView
//
//  Created by Denis Bystruev on 19.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView! {
        didSet {
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(textViewTapped(_:)))
            self.gestureRecognizer = gestureRecognizer
            textView.becomeFirstResponder()
            textView.inputView = UIView()
            textView.addGestureRecognizer(gestureRecognizer)
        }
    }
    
    weak var gestureRecognizer: UITapGestureRecognizer!
    
    @objc func textViewTapped(_ gesture: UITapGestureRecognizer) {
        guard gesture.state == .ended else { return }
        textView.inputView = nil
        textView.reloadInputViews()
        textView.removeGestureRecognizer(gestureRecognizer)
        gestureRecognizer = nil
    }
}

