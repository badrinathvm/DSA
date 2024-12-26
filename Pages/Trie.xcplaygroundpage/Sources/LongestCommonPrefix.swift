//
//  LongestCommonPrefix.swift
//  
//
//  Created by Rani Badri on 12/24/24.
//

/*
 
  Time Complexity : O(n * m), where n is the number of words and m is the average length of the words.
  Space Complexity : O(n * m) due to the storage required for each character in all words, where n is the number of words and m is the average length of the words
 
 */

public class LongestCommonPrefix {
    
    
    class TrieNode {
        var children: [Character: TrieNode]
        var isEndOfWord: Bool
        
        init() {
            self.children = [:]
            self.isEndOfWord = false
        }
    }
    
    var root: TrieNode
    
    public init() {
        root = TrieNode()
    }
    
    // Method to insert a word into the Trie
    func insert(_ word: String) {
        // start from the root node
        var currentNode = root
        
        // Iterate over each of the character
        for char in word {
            // If the current node doesn't have a child node for the current character
            if currentNode.children[char] == nil {
                // Create a new TrieNode for the character
                currentNode.children[char] = TrieNode()
            }
            
            // Move to the child node for the current character
            currentNode = currentNode.children[char]!
        }
        
        // After inserting the word, mark the current node as the end of a word
        // This is necessary to indicate that we have completed inserting a word
        currentNode.isEndOfWord = true
    }
    
    func getPrefix() -> String {
        var currentNode = root
        var prefix = ""
        
        // Traverse the Trie to find the longest common prefix
        while currentNode.children.count == 1 && !currentNode.isEndOfWord {
            // If there is exactly one child node, it means all words share this same prefix path.
            // Append the character to the prefix string.
            let (char, node) = currentNode.children.first! // Get the single child and its character
            prefix.append(char) // Add the character to the current prefix
            
            // Move to the next node in the Trie
            currentNode = node
        }
        
        return prefix
    }
    
    public func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        
        // Insert all strings into the Trie
        for str in strs {
            self.insert(str)
        }
        
        // Return the longest common prefix
        return self.getPrefix()
    }
}
