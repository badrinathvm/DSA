//
//  RotateString .swift
//  
//
//  Created by Rani Badri on 12/27/24.
//

/*
 
 Approach
     1.    Key Insight:
         •    If s can be rotated to become goal, then goal must be a substring of s + s. For example:
         •    s = "abcde" → s + s = "abcdeabcde"
         •    Rotations of s: "abcde", "bcdea", "cdeab", "deabc", "eabcd"
         •    All rotations are substrings of "abcdeabcde".
     2.    Steps:
         •    Check if s and goal are of the same length. If not, return false.
         •    Concatenate s with itself (s + s).
         •    Check if goal is a substring of s + s.
 
 */

public class RotateString {
    
    public init() { }
    
    public func rotateString(_ s: String, _ goal: String) -> Bool {
        // Check if the lengths are different
        if s.count != goal.count {
            return false
        }
        
        // Concatenate `s` with itself and check if `goal` is a substring
        let doubledString = s + s
        return doubledString.contains(goal)
    }
}

/*
 Input: s = "abcde", goal = "cdeab"
 Output: true
 
 */

