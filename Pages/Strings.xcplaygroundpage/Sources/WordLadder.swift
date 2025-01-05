//
//  WordLadder.swift
//  
//
//  Created by Rani Badri on 1/4/25.
//

/*
   Approach:
   To solve this, use Breadth-First Search (BFS):
     1.    Treat each word as a node in a graph.
     2.    Two nodes are connected if one word can be transformed into the other by changing exactly one character.
     3.    Perform a BFS to find the shortest path from beginWord to endWord.

 Key Points:
     •    Use a Set for fast lookup of words in wordList.
     •    Use a queue to perform BFS. Each element in the queue contains the current word and the number of transformation steps so far.
     •    For each word, try changing every character to all possible letters and check if the new word is in the word list.

 */

public class WordLadder {
    public init() { }
    
    public func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        
        // Convert the word list into a set for O(1) lookups
        var wordSet = Set(wordList)
        if !wordSet.contains(endWord) {
            return 0
        }
        
        var queue: Queue<(String, Int)> = Queue<(String, Int)>()
        queue.push((beginWord, 1))
        
        while !queue.empty() {
            let (currentWord, level) = queue.front
            
            _ = queue.pop()
            
            // Try changing each character in the current word
            for i in 0..<currentWord.count {
                var currentArray = Array(currentWord)
                for char in "abcdefghijklmnopqrstuvwxyz" {
                    let originalChar = currentArray[i] // h
                    currentArray[i] = char // ait , bit , cit ... zit
                    let newWord = String(currentArray)
                    
                    // if we deetct the endWord increment the level and return 
                    if newWord == endWord {
                        return level + 1
                    }
                    
                    if wordSet.contains(newWord) {
                        queue.push((newWord, level + 1))
                        wordSet.remove(newWord) // Mark as visited
                    }
                    
                    currentArray[i] = originalChar // Restore the original word
                }
            }
        }
        // If no transformation sequence exists
        return 0
    }
}


public struct Queue<T> {
    public var arr: [T] = []
    
    mutating public func push(_ item: T) {
        self.arr.append(item)
    }
    
    public mutating func pop() -> T? {
        guard !arr.isEmpty else { return nil }
        return arr.removeFirst()
    }
    
    public func empty() -> Bool  {
        arr.isEmpty
    }
    
    public var front: T! {
        self.arr.first!
    }
    
    public var rear: T! {
        self.arr.last!
    }
}

/*
 
 Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
 Output: 5
 
 Explanation: One shortest transformation sequence is
    "hit" -> "hot" -> "dot" -> "dog" -> cog", which is 5 words long.
 
 
 */
