//
//  MaximumConsecutiveOnes.swift
//  
//
//  Created by Rani Badri on 11/4/24.
//

public class MaximumConsecutiveOnes {
    public init() {}
    
    public func maxConsecutiveOnes(_ nums: [Int]) -> Int {
        var maxCount = 0
        var currentCount = 0
        
        for num in nums {
            if num == 1 {
                currentCount += 1
                maxCount = max(maxCount, currentCount)
            } else {
                currentCount = 0
            }
        }
        
        return maxCount
    }
    
    /*
     
     Input:
      nums: [1, 1, 0, 1, 1, 1]
     Output: 3
     
     */
    
    public func maximumConsecutiveOnesIII(_ nums: [Int], _ k: Int) -> Int {
        var left = 0
        var maxLength = 0
        var zeroCount = 0
        
        for right in 0..<nums.count {
            // count Zeros in the current window
            if nums[right] == 0 {
                zeroCount += 1
            }
            
            // shrink the window if zero counyts exceeds k
            while zeroCount > k {
                if nums[left] == 0 {
                    zeroCount -= 1
                }
                left += 1
            }
            
            // update the maximum window size
            maxLength = max(maxLength, right - left + 1)
        }
        
        return maxLength
    }
}

/*

 Input: nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2
 Output: 6
 Explanation: [1,1,1,0,0,1,1,1,1,1,1]
 Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
 
 */
