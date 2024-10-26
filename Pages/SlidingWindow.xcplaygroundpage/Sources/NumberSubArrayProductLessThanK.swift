//
//  NumberSubArrayProductLessThanK.swift
//  
//
//  Created by Rani Badri on 10/26/24.
//

/**
 Time Complexity: 𝑂 (𝑛) where '𝑛'  n is the length of nums, since each element is processed at most twice (once when right expands and potentially once more if left needs to move)\
 Space Complexity : O(1), as we are using a constant amount of extra space.
 */

/*
  Approach
     Step 1: Initialize left to 0, product to 1, and count to 0.
     Step 2: Expand right from 0 to the end of nums: Multiply product by nums[right].
     Step 3: While product >= k, divide product by nums[left] and increment left.
     Add (right - left + 1) to count
     which represents the number of subarrays ending at right with a product less than k.
     Step 4: Return count.
 */

public class NumberSubArrayProductLessThanK {
    public init() { }
    
    public func numSubArrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        // Edge case: if k is 1, we can't form any subarray with product less than 1
        if k <= 1 { return 0 }
        
        var count = 0,
            product = 1,
            left =  0
        
        for right in 0..<nums.count {
            product *= nums[right]
            
            // Shringk the window if product is graeter than or equal to k
            while product >= k {
                product /= nums[left]
                left += 1
            }
            
            // Count all subarrays ending at `right`
            count += right - left + 1
        }
        
        return count
    }
}

/**
 Input: nums = [10,5,2,6], k = 100
 Output: 8
 Explanation: The 8 subarrays that have product less than 100 are:
 [10], [5], [2], [6], [10, 5], [5, 2], [2, 6], [5, 2, 6]
 Note that [10, 5, 2] is not included as the product of 100 is not strictly less than k.
 */
