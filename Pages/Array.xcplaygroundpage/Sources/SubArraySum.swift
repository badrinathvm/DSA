//
//  SubArraySum.swift
//  
//
//  Created by Rani Badri on 10/14/24.
//

import Foundation

// Time Complexity - O(n) - traverse the array only once
// Space Complexity - O(n) - space required to store the dictionary
public class SubArraySum {
    public static func subArraySum(_ nums: [Int], _ k: Int) -> Int {
        var currentSum = 0
        var count = 0
        // Initialize with 0:1 to handle edge case where currentSum == k
        var prefixDict: [Int: Int] = [0: 1]
        
        for num in nums {
            currentSum += num
            
            if let occurences = prefixDict[currentSum - k] {
                count += occurences
            }
            
            // Update the prefixSumCount map
            prefixDict[currentSum, default: 0] += 1
        }
        
        return count
    }
}

/*
 
 Input : [1,1,1] , k = 2
 Output: 2
 
 */
