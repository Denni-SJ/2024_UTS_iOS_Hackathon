//
//  ConversationManager.swift
//  Apple Intelligence Recipe Generator
//
//  Created by Denni O on 6/20/24.
//

import Foundation

class ConversationManager {
    private var conversationInProgress = false
    
    func startConversation() {
        guard !conversationInProgress else {
            print("Conversation is already in progress")
            return
        }
        conversationInProgress = true
        print("Conversation started")
    }
    
    func endConversation() {
        guard conversationInProgress else {
            print("No conversation in progress to end")
            return
        }
        conversationInProgress = false
        print("Conversation ended")
    }
    
    func isConversationInProgress() -> Bool {
        return conversationInProgress
    }
}

