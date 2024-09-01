//: [Previous](@previous)

import Foundation

// Leetcode - 1768 https://leetcode.com/problems/merge-strings-alternately/
class MergeStringsAlternatively {
    static func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var result = ""
        zip(word1, word2).forEach { element in
            print(element)
            result += "\(element.0)\(element.1)"
        }
       
        let remainingPart = word1.dropFirst(min(word1.count, word2.count)) +
        word2.dropFirst(min(word1.count, word2.count))
        
        result += remainingPart
        print("Result is \(result)")
        return result
    }
}

MergeStringsAlternatively.mergeAlternately("abcxy", "def")

class LenghtOfLastWord {
    static func lenghtOFLastWord(_ str: String) -> Int {
        guard str.count > 0 else { return -1 }
        
        let splitArray = str.split(separator: " ")
        
        guard let lastWord = splitArray.last else { return -1 }
            
        return lastWord.count
    }
}

LenghtOfLastWord.lenghtOFLastWord("   fly me   to   the moon  ")
