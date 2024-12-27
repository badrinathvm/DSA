//
//  CustomeSortString.swift
//  
//
//  Created by Rani Badri on 12/27/24.
//

/*
 
 1.    Step 1: Frequency Map of s
     •  Count how many times each character appears in s:
      charFrequency = ["a": 1, "b": 1, "c": 1, "d": 1]
 
 2.  Step 2: Process order
     •    Iterate through the characters in order (c, b, a) and build the result string:
     •    For c: Found in charFrequency with count 1 → Add "c" to result → result = "c".
     •    For b: Found in charFrequency with count 1 → Add "b" to result → result = "cb".
     •    For a: Found in charFrequency with count 1 → Add "a" to result → result = "cba".
     •    After processing order, charFrequency contains:
   ["d": 1] // Only "d" remains
 
 Step 3: Append Remaining Characters
     •    Append the characters still in charFrequency:
     •    Add "d" → result = "cbad".
 */

/*
  1.    Time Complexity:
        •    Building Frequency Map:  O(n) , where  n  is the length of s.
        •    Building Result String:
        •    Iterating over order:  O(m) , where  m  is the length of order.
        •    Appending remaining characters:  O(n) .
        •    Total:  O(n + m) .
    2.    Space Complexity:
        •    Frequency map:  O(k) , where  k  is the number of unique characters in s.
        •    Result string:  O(n) .
*/
public class CustomSortString {
    public init() { }
    
    public func customSortString(order: String, s: String) -> String {
        // step 1: Create a frequency map for chaacter in 's'
        var charFrequency = [Character: Int]()
        for char in s {
            charFrequency[char, default: 0] += 1
        }
        
        // step 2: Build the result string using the custom order
        var result = ""
        for char in order {
            if let frequency = charFrequency[char] {
                result += String(repeating: char, count: frequency)
                charFrequency[char] = nil // Remove processed character
            }
        }
        
        // Step 3: Append remaining characters not in `order`
        for (char, frequency) in charFrequency {
            result += String(repeating: char, count: frequency)
        }
        
        return result
    }
}

/*
 
 Input: order = "cba", s = "abcd"

 Output: "cbad"
 
 */
