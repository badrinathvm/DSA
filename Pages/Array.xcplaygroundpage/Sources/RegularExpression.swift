//
//  RegulsrExpression.swift
//  
//
//  Created by Rani Badri on 12/3/24.
//

import Foundation

/*
 
 Time Complexity: O(m×n), where m and n are the lengths of the string and the pattern.
 Space Complexity: O(m×n), as we use a 2D DP table.
 */

public class RegularExpression  {

    func isMatch(_ s: String, _ p: String) -> Bool {
        let sArray = Array(s)
        let pArray = Array(p)
        
        let m = sArray.count
        let n = pArray.count
        
        // DP table where dp[i][j] indicates if s[0..<i] matches p[0..<j]
        var dp = Array(repeating: Array(repeating: false, count: n + 1), count: m + 1)
        dp[0][0] = true // Empty string matches empty pattern
        
        // Fill in the table for patterns like a*, a*b*, etc.
        for j in 1...n {
            if pArray[j - 1] == "*" {
                dp[0][j] = dp[0][j - 2]
            }
        }
        
        for i in 1...m {
            for j in 1...n {
                if pArray[j - 1] == sArray[i - 1] || pArray[j - 1] == "." {
                    dp[i][j] = dp[i - 1][j - 1]
                } else if pArray[j - 1] == "*" {
                    // Check zero occurrence of character before '*'
                    dp[i][j] = dp[i][j - 2] || (dp[i - 1][j] && (sArray[i - 1] == pArray[j - 2] || pArray[j - 2] == "."))
                }
            }
        }
        
        return dp[m][n]
    }
}

// Example usage
let s = "aab"
let p = "c*a*b"
print(isMatch(s, p)) // Output: true
