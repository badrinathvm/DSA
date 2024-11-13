//
//  UniquePathWithObstacles.swift
//  
//
//  Created by Rani Badri on 11/12/24.
//

/*
  Time Complexity : O( m * n )
  Space Complexity : O( m * n)
 */

public class UniquePathWithObstacles {
    public init() { }
    
    public func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let m = obstacleGrid.count,
            n = obstacleGrid[0].count
        
        // If the start or end cell is blocked, return 0
        if obstacleGrid[0][0] == 1 || obstacleGrid[m-1][n-1] == 1 {
            return 0
        }
        
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        
        // Set the starting point
        dp[0][0] = 1
        
        // Fill the first column, check if the cell is not blocked
        for i in 1..<m {
            if obstacleGrid[i][0] == 0 {
                dp[i][0] = dp[i-1][0]
            }
        }
        
        // Fill the first row, check if the cell is not blocked
        for j in 1..<n {
            if obstacleGrid[0][j] == 0 {
                dp[0][j] = dp[0][j-1]
            }
        }
        
        // Fill the rest of the DP table
        for i in 1..<m {
            for j in 1..<n {
                if obstacleGrid[i][j] == 0 {
                    dp[i][j] = dp[i-1][j] + dp[i][j-1]
                }
            }
        }
        
        return dp[m-1][n-1]
    }
    
    // Space Complexity : O(n)
    func uniquePathsWithObstacles_opimized(_ obstacleGrid: [[Int]]) -> Int {
        let m = obstacleGrid.count
        let n = obstacleGrid[0].count
        
        // If the start or end cell is blocked, return 0
        if obstacleGrid[0][0] == 1 || obstacleGrid[m-1][n-1] == 1 {
            return 0
        }
        
        var dp = Array(repeating: 0, count: n)
        
        dp[0] = 1 // Starting point
        
        // Fill the first row, check if the cell is not blocked
        for j in 1..<n {
            if obstacleGrid[0][j] == 0 {
                dp[j] = dp[j-1]
            } else {
                dp[j] = 0
            }
        }
        
        // Fill the rest of the grid row by row
        for i in 1..<m {
            for j in 1..<n {
                if obstacleGrid[i][j] == 0 {
                    dp[j] += dp[j-1]
                } else {
                    dp[j] = 0
                }
            }
        }
        
        return dp[n-1]
    }

}

/*
 
 Input:
      obstacleGrid = [[0,0,0],[0,1,0],[0,0,0]]
 Output: 2
 
 */
