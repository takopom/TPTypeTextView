//
//  ViewController.swift
//  TPTypeTextView
//
//  Created by takopom on 2016/09/20.
//  Copyright © 2016 takopom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var typeTextView: TPTypeTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTypeTextView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func setupTypeTextView() {
        typeTextView.startTypingAnimation(typingText: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.")
        
        typeTextView.typingCompletely = {
            print("Finished!")
        }
    }
    
    @IBAction func didSelectShowAllButton(_sender: AnyObject) {
        typeTextView.showImmediately()
    }
    
    @IBAction func didSelectClearButton(_sender: AnyObject) {
        typeTextView.clearAll()
    }

    @IBAction func didSelectStartButton(_sender: AnyObject) {
        typeTextView.startTypingAnimation()
    }
    
    @IBAction func didSelectStopButton(_sender: AnyObject) {
        typeTextView.stopTypingAnimation()
    }
}

