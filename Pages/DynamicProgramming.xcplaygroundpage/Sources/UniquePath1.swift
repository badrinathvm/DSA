//
//  UniquePath1.swift
//  
//
//  Created by Rani Badri on 11/12/24.
//

/*
  Time Complexity: O(m * n)
  Space Complexity : O(m * n)
 */

public class UniquePath1 {
    public init() { }
    
    public func uniquePaths(m: Int, n: Int) -> Int {
        // Create a 2D array for storing the number of ways to each cell
        var dp = Array(repeating: Array(repeating: 1, count: n), count: m)
        
        // Iterate through the grid starting from cell (1, 1)
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = dp[i-1][j] + dp[i][j-1]
            }
        }
        return dp[m-1][n-1]
    }
    
    func uniquePaths_optimized(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: 1, count: n)
        
        for i in 1..<m {
            for j in 1..<n {
                dp[j] += dp[j-1]
            }
        }
        
        return dp[n-1]
    }
}

/*
  Input: m = 3, n = 7
  Output: 28
*/
