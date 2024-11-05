//
//  SubArraySum.swift
//  
//
//  Created by Rani Badri on 11/4/24.
//

/*
  Time Complexity : O(n)
   Space Compelxity : O(n)
 
 */

public class SubArraySum {
    public init() {
        
    }
    
    public func subArraySum(arr: [Int], k: Int) -> Int {
        var currentSum = 0
        // Dictionary to store cumulative sum frequencies, starting with 0 sum having 1 count
        var dict: [Int: Int] = [0: 1]
        var count = 0
        
        for num in arr {
            currentSum += num
            
            // Check if there is a prefix sum that, when subtracted from the current prefix sum, equals k
            if let frequency = dict[currentSum - k] {
                count += frequency
            }
            
            dict[currentSum, default: 0] = 1
        }
        
        return count
    }
}

/*
  
 Input:
   arr = [1,2,3] k = 3
 Output: 2
 
  How?
    First subArray = [1,2]
    Second subArray = [3]
  So the count is 2
  
 */
