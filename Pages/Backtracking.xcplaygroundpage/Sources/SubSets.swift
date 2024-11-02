//
//  SubSets.swift
//  
//
//  Created by Rani Badri on 11/2/24.
//

/*
  Time Complexity : O(2^n)
  Space Complexity: O(2^n * n) where 2^n is the number of subsets and each subset contains n elements.
 */

public class SubSets {
    public init() { }
    
    public func subsets(_ nums: [Int] ) ->[[Int]] {
        var results = [[Int]]()
        var subset = [Int]()
        
        func backtrack(_ start: Int) {
            results.append(subset)
            
            for i in start..<nums.count {
                subset.append(nums[i])
                backtrack(i+1)
                subset.removeLast()
            }
        }
        
        backtrack(0)
        return results
    }
}

/*
 
 Input: [1,2,3,4]
 
 Output: [[], [1], [1, 2], [1, 2, 3], [1, 3], [2], [2, 3], [3]]

 
 
 */
