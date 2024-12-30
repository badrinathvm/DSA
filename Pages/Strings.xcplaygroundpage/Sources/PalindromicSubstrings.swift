//
//  PalindromicSubstrings.swift
//  
//
//  Created by Rani Badri on 12/30/24.
//

/*
 
 The concept of `Expand Around Center leverages` the symmetry of palindromes to efficiently find all palindromic substrings without generating all possible substrings. It works by expanding outward from potential centers and counting palindromes directly.
 
 Time Compelxity : O(n^2)
 Space Complexity: O(1)
 */

public class PalindromicSubstrings {
    public init() { }
    
    public func countSubStrings(_ s: String) -> Int {
        // Convert the string to an array of characters for easy indexing
        let chars = Array(s)
        let n = chars.count
        // counter to keep track ofg palindromic strings
        var count = 0
        
        func expandAroundCenter(_ left: Int, _ right: Int) {
            var l = left
            var r = right
            
            while l >= 0 && r < n && chars[l] == chars[r] {
                count += 1
                // Move the left pointer outward
                l -= 1
                // Move the right pointer outward
                r += 1
            }
        }
        
        for i in 0..<n {
            expandAroundCenter(i, i) // Check for odd-length palindromes
            expandAroundCenter(i, i + 1) // Check for even-length palindromes
        }
        
        return count
    }
}

/*
 
 Example 1:

 Input: s = "abc"
 Output: 3
 Explanation: Three palindromic strings: "a", "b", "c".
 Example 2:

 Input: s = "aaa"
 Output: 6
 Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".
 
 
 */
