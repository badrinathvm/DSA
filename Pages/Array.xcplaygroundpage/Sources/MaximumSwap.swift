//
//  MaximumSwap.swift
//  
//
//  Created by Rani Badri on 12/26/24.
//

/*
 
  Time Complexity : O(n^2)
  Space Complexity: O(n)
 
 */

/*
  Approach: The maximum number can be acheived by swapping the left most digit with the largest digit to it's right
  
  Convert the numbers to array
 
 
 */

import Foundation

public class MaximumSwap {
    public init() { }
    
    public func maximumSwap(_ num: Int) -> Int {
        // convert the number in to array of digits
        var digits = Array(String(num)).flatMap { Int(String($0))! }
        
        // Store the last occureence of each of the digit in the dictionary
        var lastIndex = [Int: Int]()
        
        // [ 2:0, 7: 1, 3: 2, 6: 3]
        for (index, digit) in digits.enumerated() {
            lastIndex[digit] = index
        }
        
        // Iterate through digits
        for i in 0..<digits.count {
            // check if there is a larger digit towards the right
            for d in stride(from: 9 , to: digits[i], by: -1) { // key sauce
                if let swapIndex = lastIndex[d], swapIndex > i {
                    // Swap the current digit with the larger digit
                    digits.swapAt(i, swapIndex)
                    // Convert back to an integer and return the result
                    return Int(digits.map { String($0) }.joined())!
                }
            }
        }
        
        return num
    }
}


/*
 
 Example 1:

 Input: num = 2736
 Output: 7236
 Explanation: Swap the number 2 and the number 7.
 
 
 
 */
