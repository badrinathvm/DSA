//
//  MinimumSizeSubArray.swift
//  
//
//  Created by Rani Badri on 10/26/24.
//

/**
 Time Complexity:
 𝑂(𝑛)  - because each element is processed at most twice (once by right and potentially again by left when the window shrinks).
 
 
 */

public class MinimumSizeSubArray {
    public init() { }
    
    public func minSubArrayLen(_ nums: [Int], _ target: Int) -> Int {
        var minLength = Int.max
        var left = 0
        var currentSum = 0
        
        for right in 0..<nums.count {
            currentSum += nums[right]
            
            // shrink the window, and increment left pointer.
            while currentSum >= target {
                minLength = min(minLength , right - left + 1)
                currentSum -= nums[left]
                left += 1
            }
        }
        
        return minLength == Int.max ? 0 : minLength
    }
}

/**
 
 Input: target = 7, nums = [2,3,1,2,4,3]
 Output: 2
 Explanation: The subarray [4,3] has the minimal length under the problem constraint.
 */
