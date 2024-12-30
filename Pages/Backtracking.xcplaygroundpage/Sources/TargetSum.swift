//
//  TargetSum.swift
//  
//
//  Created by Rani Badri on 12/30/24.
//

/*
  Approach:
    1. Use recursion to explore all possible combinations of adding and subtracting numbers.
    2. Base case: When all numbers are processed, check if the current sum equals the target.
    3. Recursive case: For each number, recursively compute two cases:
     •    Add the current number to the sum.
     •    Subtract the current number from the sum.
 
 Time Complexity: O(2^n), where n is the size of nums (Exploring all combinations)
 Space Complexity:  O(n), Stack space for recursion
 
 */

public class TargetSum {
    public init() {
        
    }
    
    public func findTargetWays(nums: [Int], target: Int) -> Int {
        func dfs(_ index: Int, _ currentSum: Int) -> Int {
           // When all numbers are processed, check if the current sum equals the target.
            if index == nums.count {
                return currentSum == target ? 1 : 0
            }
            
//            For each number, recursively compute two cases:
//             •    Add the current number to the sum.
//             •    Subtract the current number from the sum.
            let add = dfs(index + 1, currentSum + nums[index])
            let subtract = dfs(index + 1, currentSum - nums[index])
            
            return add + subtract
        }
        
        return dfs(0, 0)
    }
}

/*
 
 Input: nums = [1,1,1,1,1], target = 3
 Output: 5
 Explanation: There are 5 ways to assign symbols to make the sum of nums be target 3.
 -1 + 1 + 1 + 1 + 1 = 3
 +1 - 1 + 1 + 1 + 1 = 3
 +1 + 1 - 1 + 1 + 1 = 3
 +1 + 1 + 1 - 1 + 1 = 3
 +1 + 1 + 1 + 1 - 1 = 3
 */
