//
//  NumberOFSubStringsAllCharacters.swift
//  
//
//  Created by Rani Badri on 10/23/24.
//

//Time Complexity: O(n), where n is the length of the string s. We process each character at most twice — once when expanding the window and once when shrinking it.
//Space Complexity: O(1), since we only use a constant amount of space for the array count and a few pointers.

public class NumberOFSubStringsAllCharacters {
    public init() { }
    
    public func numberOfSubStrings(_ s: String) -> Int {
        // convert all the letters to character array
        let chars = Array(s)
        
        var count = [0,0,0]
        
        var left = 0, result = 0
        
        for right in 0..<chars.count {
            // update the count for the current character
            count[Int(chars[right].asciiValue! - Character("a").asciiValue!)] += 1
            
            // Shrink the window from the left as long as the window contains all 'a', 'b', 'c'
            while count[0] > 0 && count[1] > 0 && count[2] > 0  {
                result += (s.count - right)
                
                // shrink window from the left
                count[Int(chars[left].asciiValue! - Character("a").asciiValue!)] -= 1
                left += 1
            }
        }
        
        return result
    }
}

/*
 Input: s = "abcabc"
 Output: 10
 Explanation: The substrings containing at least one occurrence of the characters a, b and c are "abc", "abca", "abcab", "abcabc", "bca", "bcab", "bcabc", "cab", "cabc" and "abc" (again).
 
 */
