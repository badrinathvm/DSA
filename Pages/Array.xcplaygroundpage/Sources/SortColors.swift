//
//  SortColors.swift
//  
//
//  Created by Rani Badri on 11/2/24.
//

/*
  Approach :
   Step 1: Get the count for eahc of the color , make use of reduce
   count[0] = 2, count[1] = 1, count[2]= 2
   Step 2: Iterate over the counts and create an Array(repeating: color(index), count: count)
 
   Time Complexity : O(n)
   Space Complexity : O(n)
 */

public class SortColors {
    public init() {
    }
    
    public func sortColors(_ nums: [Int]) -> [Int] {
        // Step 1: Count occurrences of each color using reduce
        let countArray = nums.reduce(into: [0,0,0]) { counts, element in
            counts[element] += 1
        }
        
        // Step 2: Reconstruct the array by repeating elements based on their counts
        let result = countArray.enumerated().flatMap { color, count in
            Array(repeating: color, count: count)
        }
        return result
    }
    
    public func sortColor(_ nums: [Int]) -> [Int] {
        var nums = nums
        // Make use of bucket sort
        // first pass : Iterate over the array and keep track of how many frequency of eahc of the element.
        // second pass: Implement those buckets
        
        // Step 1: Count occurrences of each color (0, 1, 2)
        var count = [0, 0, 0]
            
        // Count the occurrences of 0, 1, and 2
        for num in nums {
            count[num] += 1
        }
      //  print(count)
        
        // Step 2: Overwrite the original array based on the counts
        var index = 0

        // Fill in 0s (red)
        for _ in 0..<count[0] {
            nums[index] = 0
            index += 1
        }
        
        // Fill in 0s (green)
        for _ in 0..<count[1] {
            nums[index] = 1
            index += 1
        }
        
        // Fill in 0s (blue)
        for _ in 0..<count[2] {
            nums[index] = 2
            index += 1
        }
        
        return nums
    }
}

/*
 
 Input: [2,0,2,1,1,0]
 Output: [0, 0, 1, 1, 2, 2]
 
 */
