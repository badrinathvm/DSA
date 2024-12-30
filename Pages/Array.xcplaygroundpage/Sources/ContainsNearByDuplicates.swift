//
//  ContainsNearByDuplicates.swift
//  
//
//  Created by Rani Badri on 12/30/24.
//

/*
 Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.
 Time Complexity: O(n)
 Space Complexity: O(n)
 
 */

public class ContainsNearByDuplicates {
    public init() { }
    
    public func containsNearByDuplicates(_ nums: [Int], _ k: Int) -> Bool {
        // Dictionary to store the last seen index of each number
        var lastSeenIndex = [Int: Int]()
        
        for (index, element) in nums.enumerated() {
            // Check if the number exists in the dictionary and the index difference is <= k
            if let previousIndex = lastSeenIndex[element], index - previousIndex <= k {
                return true
            }
            
            // update the last seen index for the current Number
            lastSeenIndex[element] = index
        }
        
        // No duplicates found within the required range
        return false
    }
}

/*
 
 Example 1:

 Input: nums = [1,2,3,1], k = 3
 Output: true
 Example 2:

 Input: nums = [1,0,1,1], k = 1
 Output: true
 Example 3:

 Input: nums = [1,2,3,1,2,3], k = 2
 Output: false
 
 */
