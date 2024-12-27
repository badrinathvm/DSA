//: [Previous](@previous)

import Foundation

// Leetcode - 1768 https://leetcode.com/problems/merge-strings-alternately/

print(" --- Merge Strings alternatively ---")
let mergeStringResult = MergeStringAlternatively().mereStrings("abcxy", "def")
print(mergeStringResult)

class LenghtOfLastWord {
    static func lenghtOFLastWord(_ str: String) -> Int {
        guard str.count > 0 else { return -1 }
        
        let splitArray = str.split(separator: " ")
        
        guard let lastWord = splitArray.last else { return -1 }
            
        return lastWord.count
    }
}

LenghtOfLastWord.lenghtOFLastWord("   fly me   to   the moon  ")


class MatchingPairs {
    static func matchingPairs(s: String, t: String) -> Int {
        let sArray = s.flatMap { String($0) }
        let tArray = t.flatMap { String($0) }
        print(sArray)
        print(tArray)
        
        guard sArray.count == tArray.count else { return 0 }
         
        var swapIndexValue = [Int]()
        for index in 0..<sArray.count {
            if sArray[index] != tArray[index] {
                swapIndexValue.append(index)
            }
        }
        print(swapIndexValue)
        
        var result = 0
        if swapIndexValue.isEmpty {
            result = 1
        } else {
            result = (swapIndexValue.last ?? 0) + 1
        }
        print("output: \(result)")
        
        return result
    }
}

MatchingPairs.matchingPairs(s: "abcde", t: "adcbe")
MatchingPairs.matchingPairs(s: "mno", t: "mno")

print(" -- Group Shifted Strings -- ")
let groupStrings = GroupShiftedStrings().groupStrings(["abc","bcd","acef","xyz","az","ba","a","z"])
print(groupStrings)

print(" -- Custom Sort String --")
let customStringResult = CustomSortString().customSortString(order: "cba", s: " abcdd")
print(customStringResult)
