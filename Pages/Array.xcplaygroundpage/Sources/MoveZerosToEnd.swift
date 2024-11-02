//
//  MoveZerosToEnd.swift
//  
//
//  Created by Rani Badri on 11/2/24.
//

/*
  Time Complexity : O(n)
  Space Complexity : O(n)
 
 */

public class MoveZerosToEnd {
    public init() { }
    
    public func moveZerosToEnd(input: [Int]) -> [Int] {
        // filter the non zero elements
        let nonZeroArray = input.filter { $0 != 0 }
        // Calculate the zero count
        let zeroCount = input.count - nonZeroArray.count
        // append the non zero count with number of zeros
        let finalResult = nonZeroArray + Array(repeating: 0 , count: zeroCount)
        return finalResult
    }
    
    /* Using Reduce way
        print("Using Reduce Way")
        let result = nums.reduce(into: ([Int](), 0)) { result, num in
            if num == 0 {
                result.1 += 1
            } else {
                result.0.append(num)
            }
        }
        
        let (withoutZero, count) = result
        let finalArray = withoutZero + Array(repeating: 0, count: count)
        print(finalArray)
     */
}

/*
 Input: [0,1,0,3,12 ]
 Output: [1,3,12,0,0 ]
 */

