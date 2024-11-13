//
//  LongestIncreasingSubSequence.swift
//  
//
//  Created by Rani Badri on 11/13/24.
//

/*
 Time Complexity : O(n^2)
 Space Complexity : O(n)

*/

public class LongestIncreasingSubSequence {
    public init() { }
    
    public func longestIncreasingSubSequence(nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        
        var dp = Array(repeating: 1, count: nums.count)
        
        for i in 1..<nums.count {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        
        return dp.max() ?? 0
    }
    
    // Optimized Approach using Binary Search (O(n log n))
    func lengthOfLIS_Optimized(_ nums: [Int]) -> Int {
        var sub = [Int]()

        for num in nums {
            if let index = sub.firstIndex(where: { $0 >= num }) {
                sub[index] = num  // Replace the first element that is >= num
            } else {
                sub.append(num)  // Add num to the end if it's greater than all elements in sub
            }
        }

        return sub.count
    }
}

/*
 
 Input: nums = [10,9,2,5,3,7,101,18]
 Output: 4
 Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
 
 */
