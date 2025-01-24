//
//  SortCustomAlphabets.swift
//  
//
//  Created by Rani Badri on 1/23/25.
//

/*
Time Complexity:
    1.    Count Frequencies: O(n), where n is the length of the input string.
    2.    Rebuild String Using Order: O(m + r), where m is the length of the order string and r is the number of remaining characters not in order.
    3.    Overall: O(n + m). Since r \leq n, this simplifies to O(n + m).

Space Complexity:
    •    Frequency Dictionary: O(u), where u is the number of unique characters in the input.
    •    Result String: O(n).
    •    Overall: O(u + n).
 */

class SortUsingCustomAlphabets {
    func sortUsingCustomAlphabetByCounting(input: String, order: String) -> String {
        // Step 1: Create a frequency dictionary for the input string
        var frequency = [Character: Int]()
        for char in input {
            frequency[char, default: 0] += 1
        }
        
        // Step 2: Build the result string using the custom order
        var result = ""
        for char in order {
            if let count = frequency[char] {
                result += String(repeating: char, count: count)
                frequency[char] = nil // Remove the processed character
            }
        }
        
        // Step 3: Append characters not in the order string at the end
        for (char, count) in frequency {
            result += String(repeating: char, count: count)
        }
        
        return result
    }
}

/*
Input :
    input = "abcab"
    order = "bca"

 Output:
    bbcaa
 */




