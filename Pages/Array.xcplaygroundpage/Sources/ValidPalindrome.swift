//
//  ValidPalindrome.swift
//  
//
//  Created by Rani Badri on 12/26/24.
//
import Foundation

/*
  
 Time Complexity: O (n)
 
 Space Complexity : O (n)
 
 */

public class ValidPalindrome {
    public init() {
        
    }
    
    // use two pointer approach
    public func isPalindrome(_ s: String) -> Bool {
        // get the character set
        let specialCharacterSet = CharacterSet.alphanumerics.inverted
        
        // components(separatedBy:): Splits the string into components using the CharacterSet as delimiters.
        //    .joined(): Joins the components back together into a single string, effectively removing the special characters.
        let input = Array(s.lowercased().components(separatedBy: specialCharacterSet).joined())
        
        var left = 0
        var right = input.count - 1
        
        while left < right {
            if input[left] != input[right] {
                return false
            }
            
            left += 1
            right -= 1
        }
        return true
    }
    
    
    public func validPalindrome(_ s: String) -> Bool  {
        let specialCharacterSet = CharacterSet.alphanumerics.inverted
        let input = Array(s.lowercased().components(separatedBy: specialCharacterSet).joined())
        return isValidPalindrome(input, allowDeletion: true)
    }
    
    public func isValidPalindrome(_ input: [Character], allowDeletion: Bool) -> Bool {
        var left = 0
        var right = input.count - 1
        
        while left < right {
            if input[left] != input[right] {
                // If mismatch and deletion is allowed, try removing either left or right
                if allowDeletion {
                    return isValidPalindrome(input.dropLeft(left), allowDeletion: false) ||
                    isValidPalindrome(input.dropRight(right), allowDeletion: false)
                }
                return false
            }
            
            left += 1
            right -= 1
        }
        
        return true
    }
}

extension Array {
    func dropLeft(_ index: Int) -> [Element] {
        var newArray = self
        newArray.remove(at: index)
        return newArray
    }
    
    func dropRight(_ index: Int) -> [Element] {
        var newArray = self
        newArray.remove(at: index)
        return newArray
    }
}


/*
 
 Input: s = "A man, a plan, a canal: Panama"
 Output: true
 Explanation: "amanaplanacanalpanama" is a palindrome
 
 */
