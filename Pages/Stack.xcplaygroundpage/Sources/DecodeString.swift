//
//  DecodeString.swift
//  
//
//  Created by Rani Badri on 11/3/24.
//

/*
  Approach
    Have currentNumber , currentString  and a swicth case to number, [ and ] close barbce
    during open brace , add the current number , currentstring to stack and then reset it.
    during close bracket phase , pop the las the last element , and then construct the cureentString withj previous string + string repeating with count fecthed from stack.
   default case : justa dd the string the currentNumber
  
 
 Time Complexity : O( n * k ) - where k is the largest repeat factor
 
 Space Complexity : O( n * k ) - where k is the largest repeat factor
 
 */

public class DecodeString {
    public init() {}
    
    public func decodeString(_ s: String) -> String {
        var stack:[(String, Int)] = []
        var currentNumber = 0
        var currentString = ""
        
        for char in s {
            switch char {
            case "0"..."9":
                currentNumber = char.wholeNumberValue!
            case "[":
                // Push the current string and number onto the stack and reset them
                stack.append((currentString, currentNumber))
                currentNumber = 0
                currentString = ""
            case "]":
                //  Pop the last string and number from the stack and decode the current string
                let (previousElement, number) = stack.removeLast()
                currentString = previousElement + String(repeating: currentString, count: number)
            default:
                currentString.append(char)
            }
        }
        return currentString
    }
}

/*
 Input: 3[a]2[bc]
 Output: aaabcbc
 */
