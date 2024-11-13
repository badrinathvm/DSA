//
//  MaxSubArray.swift
//  
//
//  Created by Rani Badri on 11/12/24.
//

/*
  Time Complexity : O(n)
  Space Complexity : O(1)
 
 */
public class MaxSubArray {
    public init() { }
    
    public func maxSubArray(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var currentSum = nums[0]
        var maxSum = nums[0]
        
        for i in 1..<nums.count {
            // Either start a new subarray at nums[i] or continue the current one
            currentSum = max(nums[i], currentSum + nums[i])
            
            // Update the maximum sum encountered so far
            maxSum = max(maxSum, currentSum)
        }
        
        return maxSum
    }
}

/*
  Input :
   [-2,1,-3,4,-1,2,1,-5,4]
 
  Output: 6 , [4, -1, 2, 1]

 */
