//
//  AddSearchWord.swift
//  
//
//  Created by Rani Badri on 12/25/24.
//

/*
 Time Complexity
     •    Add Word:  O(m) , where  m  is the length of the word.
     •    Search Word:
     •    Exact Match:  O(m) , where  m  is the length of the word.
     •    Wildcard Search:  O(m * k) , where  k  is the branching factor.

 Space Complexity
     •    Add Word:  O(n * m) , for storing the words in the Trie.
     •    Search Word:  O(m * k) , for the stack, where  m  is the length of the word and  k  is the branching factor.
 */

public class AddSearchWord {
    
    var root: TrieNode
    
    class TrieNode {
        var children:[Character: TrieNode]
        var isEndOWord: Bool
        
        init() {
            self.children = [:]
            self.isEndOWord = false
        }
    }
    
    public init() {
        self.root = TrieNode()
    }
    
    public func addWord(_ word: String) {
        var current = root
        for char in word {
            if current.children[char] == nil {
                current.children[char] = TrieNode()
            }
            current = current.children[char]!
        }
        current.isEndOWord = true
    }
    
    public func search(_ word: String) -> Bool {
        var stack: [ (node: TrieNode, index: Int)] = [(root, 0)]
        
        while !stack.isEmpty {
            let (currentNode, currentIndex) = stack.removeLast()
            
            // If we have reached the end of the word
            if currentIndex == word.count {
                if currentNode.isEndOWord { return true }
                continue
            }
            
            let char = Array(word)[currentIndex]
            
            if char == "." {
                // Wildcard case: push all child nodes to the stack
                for (_ , childNode) in currentNode.children {
                    stack.append((childNode, currentIndex + 1))
                }
            } else {
                // Exact match case: check if the character exists as a child
                if let childNode = currentNode.children[char] {
                    stack.append((childNode, currentIndex + 1))
                }
            }
        }
        
        // If no match is found, return false
        return false
    }
}


/*
  
 Input : ["bad", "dad", "mad"]
 
 Output:

 print(wordDictionary.search("pad")) // Output: false (word not found)
 print(wordDictionary.search("bad")) // Output: true  (exact match)
 print(wordDictionary.search(".ad")) // Output: true  (wildcard matches "bad", "dad", "mad")
 print(wordDictionary.search("b..")) // Output: true  (wildcard matches "bad")

 */
