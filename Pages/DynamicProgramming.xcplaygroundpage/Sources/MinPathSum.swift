//
//  MinPathSum.swift
//  
//
//  Created by Rani Badri on 11/12/24.
//

/*
  Time Complexity : O(m * n)
  Space Complexity: O(1)
 */

public class MinPathSum {
    public init() { }
    
    public func minPathSum(grid: [[Int]]) -> Int {
        // Initialize dp array with the same values as grid
        var dp = grid
        
        let m = dp.count, n = dp[0].count
        
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 && j == 0 {
                    // dp[0][0] is just grid[0][0], so nothing to change
                    continue
                } else if i == 0 {
                    // For the first row only accumulate from left
                    dp[i][j] = dp[i][j-1] + grid[i][j]
                } else if j == 0 {
                    // for thje first column, only accumulate from above
                    dp[i][j] = dp[i-1][j] + grid[i][j]
                } else {
                    // For other cells, take the minimum of the top and left neighbors
                    dp[i][j] = grid[i][j] + min(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        
        return dp[m-1][n-1]
    }
}

/*
  Input :
   [
     [1, 3, 1],
     [1, 5, 1],
     [4, 2, 1]
   ]
 
  Output: 7
 
 */
