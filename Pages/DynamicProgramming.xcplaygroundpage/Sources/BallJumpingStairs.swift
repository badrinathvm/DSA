//
//  BallJumpingStairs.swift
//  
//
//  Created by Rani Badri on 11/9/24.
//

/*
  Time Complexity: O(n), since we are iterating once up to 'n;
  Space Complexity: O(n) , due `dp` array storing results for each step
 */

public class BallJumpingStairs {
    public init() { }
    
    public func ballJumpingStairs(n: Int) -> Int {
        
        // Base cases
        if n == 0 { return 1 }
        if n == 1 { return 1 }
        
        // create an array to store the number of ways for each step
        var dp = [Int](repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        
        for i in 2...n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        
        // The answer is the number of ways to reach the nth step
        return dp[n]
    }
}
