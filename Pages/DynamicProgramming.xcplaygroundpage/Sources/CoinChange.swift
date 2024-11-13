//
//  CoinChange.swift
//  
//
//  Created by Rani Badri on 11/13/24.
//

/*
  Time Complexity: O( n * amount) , where n is the number of coins
  Space Complexity: O(amount) - dp array
 */

public class CoinChange {
    public init() { }
    
    public func coinChange(coins: [Int], amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        var dp: [Int] = Array(repeating: amount + 1, count: amount + 1)
        
        // Base case: no coins are needed to make amount 0
        dp[0] = 0
        
        // Fill the dp array
        for coin in coins {
            for i in coin...amount {
                dp[i] = min(dp[i], dp[i-coin] + 1)
            }
        }
        
        // If dp[amount] is still amount + 1, no solution was found
        return dp[amount] == amount + 1 ? -1 : dp[amount]
    }
}

/*
 
 Input: coins = [1,2,5], amount = 11
 Output: 3
 Explanation: 11 = 5 + 5 + 1
 
 */
