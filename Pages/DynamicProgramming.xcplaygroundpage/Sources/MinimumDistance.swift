//
//  MinimumDistance.swift
//  
//
//  Created by Rani Badri on 11/12/24.
//

/*
  Time Complexity : O (m ^ n)
  Space Complexity : O ( m ^ n)
 
 */

public class MinimumDistance {
    public init() {
        
    }
    
    public func minDistance(word1: String, word2: String) -> Int {
        let m = word1.count, n = word2.count
        
        let word1Array = Array(word1)
        let word2Array = Array(word2)
        
        // if one of the words is empty, retunr the lenght of the other word
        if m == 0 { return n }
        if n == 0 { return m }
        
        // Create a 2D DP table with (m+1) rows and (n+1) columns
        var dp = Array(repeating: Array(repeating: Int.max, count: n + 1), count: m + 1)
        
        // Initialize the DP table for base cases
        for i in 0...m {
            dp[i][0] = i  // If word2 is empty, delete all characters from word1
        }
        
        for j in 0...n {
            dp[0][j] = j // If word1 is empty, insert all characters from word2
        }
        
        // Fill in DP table
        for i in 1...m {
            for j in 1...n {
                if word1Array[i-1] == word2Array[j-1] {
                    dp[i][j] = dp[i-1][j-1] // No operation needed
                } else {
                    dp[i][j] = min(dp[i-1][j-1],// replace ,
                                   // Delete,
                                   min(dp[i-1][j], dp[i][j-1])) + 1 // Insert
                }
            }
        }
        return dp[m][n]
    }
}

/*
Input :
 let word1 = "horse"
 let word2 = "ros"
 
 Output: 3
 */
