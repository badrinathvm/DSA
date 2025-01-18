//
//  LargestOddNumber.swift
//  
//
//  Created by Rani Badri on 1/7/25.
//

/*
  Approach:
    - A number is odd if its last digit is odd
    - To find the largest odd-numbered substring, we only need to find the rightmost odd digit in the string. The substring from the start of the string to that digit will be the largest odd number.
 
 2.    Algorithm:
     •    Traverse the string from the end to the beginning.
     •    Check each digit. If you find an odd digit:
     •    Return the substring from the start of the string to that digit.
     •    If no odd digit is found, return an empty string.
 3.    Time Complexity:
     •    O(n): We traverse the string once.
     •    Space complexity is O(1) since we only store indices and substrings.
 */

public class LargestOddNumber {
    public init() { }
    
    public func largestOddNumber(_ num: String) -> String {
        // Iterate through the string from right to left
        for i in stride(from: num.count - 1, through: 0, by: -1) {
            let index = num.index(num.startIndex, offsetBy: i)
            if let digit = Int(String(num[index])), digit % 2 != 0 {
                // Return the substring from start of the current odd digit
                return String(num[..<num.index(after: index)])
            }
        }
        // If no odd digit is found, return an empty string
        return ""
    }
}
