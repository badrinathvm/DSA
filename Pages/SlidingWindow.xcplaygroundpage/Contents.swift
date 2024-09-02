//: [Previous](@previous)

import Foundation

// Leetcode 1004 : https://leetcode.com/problems/max-consecutive-ones-iii/
class MaxConsecutiveOnes {
    static func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        // Two pointer approach
        var left = 0
        var maxCons = 0
        var k = k

        // Iterate through the array with the right pointer
        for (right, num) in nums.enumerated() {
            // Decrease k for each 0 encountered, as we're allowed to flip up to k zeros
            k -= 1 - num

            // If k becomes less than 0, adjust the left pointer to reduce the window size
            if k < 0 {
                // Give back '0' to k when left pointer moves past a zero
                k += 1 - nums[left]
                left += 1
            } else {
                // Update the maximum consecutive ones that can be achieved with flips
                maxCons = max(maxCons, right - left + 1)
            }
        }

        return maxCons
    }
}


MaxConsecutiveOnes.longestOnes([1,1,1,0,0,0,1,1,1,1,0], 2) // 6

class LengthOfLongestSubstring {
    static func lengthOfLongestSubstring(_ s: String) -> Int {
        var charset = Set<Character>()
        var maxLength = 0
        var left = 0
        
        // Convert the string to an array of characters for easy indexing
        let characters = Array(s)
        
        for right in 0..<characters.count {
            // Shrink the window from the left until the character at `right` is not in the set
            if charset.contains(characters[right]) {
                charset.remove(characters[left])
                left += 1
            }
            
            // Add the current character to the set
            charset.insert(characters[right])
            // Update the maximum length found so far
            maxLength = max(maxLength, right - left + 1)
        }
        
        return maxLength
    }
}

LengthOfLongestSubstring.lengthOfLongestSubstring("bbbb")
