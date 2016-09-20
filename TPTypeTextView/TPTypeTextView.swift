//
//  TPTypeTextView.swift
//  TPTypeTextView
//
//  Created by takopom on 2016/09/20.
//  Copyright © 2016 takopom. All rights reserved.
//

import UIKit

class TPTypeTextView: UITextView {
    
    // MARK: Public Properties
    var typingText = ""
    var typingInterval: TimeInterval = 0.1
    var typingCompletely: (() -> ())?
    
    // MARK: Private Properties
    private var typingIndex: Int = 0
    private var timer: Timer?
    
    // MARK: Public Methods
    func startTypingAnimation(typingText: String) {
        clearAll()
        self.typingText = typingText
        startTypingAnimation()
    }
    
    func startTypingAnimation() {
        fireTimer()
    }
    
    func stopTypingAnimation() {
        stopTimer()
    }
    
    func clearAll() {
        stopTypingAnimation()
        text = ""
        typingIndex = 0
    }
    
    func showImmediately() {
        text = typingText
        typingIndex = typingText.characters.count
        complete()
    }
    
    // MARK: Private Methods
    func updateTypingAnimation() {
        
        typeWord()
        updateTypingIndex()
        
        if (isFinishedTyping()) {
            complete()
        }
    }
    
    private func typeWord() {
        if (typingIndex < typingText.characters.count) {
            let wordIndex = typingText.index(typingText.startIndex, offsetBy: typingIndex)
            let word = typingText[wordIndex]
            text.append(word)
        }
    }
    
    private func updateTypingIndex() {
        typingIndex += 1
    }
    
    private func isFinishedTyping() -> Bool {
        return (typingText.characters.count == text.characters.count)
    }
    
    private func complete() {
        stopTypingAnimation()
        typingCompletely?()
    }
    
    private func fireTimer() {
        timer = Timer.scheduledTimer(timeInterval: typingInterval, target: self, selector: #selector(updateTypingAnimation), userInfo: nil, repeats: true)
        timer?.fire()
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
}
