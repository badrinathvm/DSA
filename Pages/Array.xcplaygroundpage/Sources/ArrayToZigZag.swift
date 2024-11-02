//
//  ArrayToZigZag.swift
//  
//
//  Created by Rani Badri on 11/2/24.
//

/*
  Approach:
  Step 1: Iterate iver the array
  Step 2: if the index is even and the array[i] > a[i+1] then swap else if the index is off , if array[i] < array[i+1] the swap.
  Step 3: return the array
 
  Time Compelxity : O(n)
  Space Complexity: O(n)
 
 */

public class ZigZag {
    public init() { }
    
    public func convert(_ array: [Int]) -> [Int] {
        var array = array
        for index in 0..<array.count - 1 {
            // checking the if the index % 2 or index.isMulitpleOf(2)
            if index.isMultiple(of: 2) && array[index] > array[index + 1] {
                array.swapAt(index, index + 1)
            } else if !index.isMultiple(of: 2) && array[index] < array[index + 1] {
                array.swapAt(index, index + 1)
            }
        }
        
        return array
    }
}

/*
  Input: [4, 3, 7, 8, 6, 2, 1]
  Output: [3, 7, 4, 8, 2, 6, 1]
 */
