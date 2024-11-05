//
//  ValidWordAbbrevation.swift
//  
//
//  Created by Rani Badri on 11/4/24.
//

/*
  Time Complexity : O(n + m) where n is the length of the word, m is the length of the abbr
  Space Complexity: O(n + m) where n is the length of the word, m is the length of the abbr
 */

public class ValidWordAbbrevation {
    public init() {}
    
    public func validWordAbbreviation(_ word: String, _ abbreviation: String) -> Bool {
        let wordArray = Array(word)
        let abbreviationArray = Array(abbreviation)
        
        var wordIndex = 0
        var abbrevationIndex = 0
        
        while wordIndex < wordArray.count && abbrevationIndex < abbreviationArray.count {
            if abbreviationArray[abbrevationIndex].isNumber {
                // Check for leading zero
                if abbreviationArray[abbrevationIndex] == "0" {
                    return false
                }
                
                // Calculate the number in abbreviation
                var num = 0
                while abbrevationIndex < abbreviationArray.count && abbreviationArray[abbrevationIndex].isNumber {
                    let digit = Int(String(abbreviationArray[abbrevationIndex]))!
                    num = num * 10 + digit
                    abbrevationIndex += 1
                }
                // Move the word pointer by `num` characters
                wordIndex += num
            } else {
                if wordArray[wordIndex] != abbreviationArray[abbrevationIndex] {
                    return false
                }
                // Move both pointers forward
                wordIndex += 1
                abbrevationIndex += 1
            }
        }
        
        return wordIndex == wordArray.count && abbrevationIndex == abbreviationArray.count
    }
    
    public func validWordAbbreviation1(_ word: String, _ abbr: String) -> Bool {
        let wordArray = Array(word)
        let abbrArray = Array(abbr)
        var i = 0  // Pointer for word
        var j = 0  // Pointer for abbr
        
        while i < wordArray.count && j < abbrArray.count {
            if abbrArray[j].isNumber {
                // Check for leading zero
                if abbrArray[j] == "0" {
                    return false
                }
                
                // Calculate the number in abbreviation
                var num = 0
                while j < abbrArray.count && abbrArray[j].isNumber {
                    num = num * 10 + Int(String(abbrArray[j]))!
                    j += 1
                }
                // Move the word pointer by `num` characters
                i += num
            } else {
                // If characters don't match, return false
                if wordArray[i] != abbrArray[j] {
                    return false
                }
                // Move both pointers forward
                i += 1
                j += 1
            }
        }
        
        // Both pointers should reach the end
        return i == wordArray.count && j == abbrArray.count
    }
}

/*
 
  Input : "internationalization", "i12iz4n"
  Output: true
  
 */
