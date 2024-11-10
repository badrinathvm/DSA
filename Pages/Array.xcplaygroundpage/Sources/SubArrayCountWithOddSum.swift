//
//  SubArrayCountWithOddSum.swift
//  
//
//  Created by Rani Badri on 11/9/24.
//

/*
  Approach :  C
 
  Step 1: Calculate teh sub arrays [[1], [1,3],[1,3,5] ,[3],[3,5],[5]]
  Step 2: Pick the subarray which has the odd sum [[1], [1,3,5] , [3],[5]]
  Step 3: Return the count of it.
 
  Time Complexity :  O(n ^ 3)
  Space Complexity: O(n ^ 3)
 
 */

public class SubArrayCountWithOddSum {
    public init() { }
    
    public func subArrayOddSumCount(_ nums: [Int]) -> Int {
        var results = [[Int]]()
        
        for i in 0..<nums.count {
            for j in i+1...nums.count {
                let subArray = Array(nums[i..<j])
                let oddSum = subArray.reduce(0, +)
                if oddSum % 2 != 0  {
                    results.append(subArray)
                }
            }
        }
        print("SubArrays:", results)
        return results.count
    }
}


/*
  Input: [1,3,5]
 
  Output: 4
 
 */
