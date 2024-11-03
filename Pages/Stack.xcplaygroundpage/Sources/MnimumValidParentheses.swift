//
//  MnimumValidParentheses.swift
//  
//
//  Created by Rani Badri on 11/3/24.
//

/*
 
  Approach:
    Have a toRemove Set<String> which keep track sof the brackets to be removed.
    Iterate iver the string, if we encounter "(" , add it ti stack
    if we encounter ")" , if stack is not empty , remove the last element else add it to the toRemove Set
 
    let's say if the stack is not empty for the umatched "("
    while !stack.isEmpty { add all the items to toRemove.append(stack.removeLast())
    
    Iterate iver the string. check if the index is present in not present in toRemove then add it to the result.
 
    Time Complexity: O(n), where n is the lenght of the inoput string
    Space Compelxity: O(n), where n is the lenght of the inoput string
 */

public class MinimmValidParentheses {
    public init() { }
    
    public func minimumValidParentheses(_ s: String) -> String {
        var stack : [Int] = [] // to keep track of '(' indices
        var toRemove : Set<Int> = []
        
        let sArray = Array(s)
        
        for (index, element) in sArray.enumerated() {
            if element == "(" {
                stack.append(index)
            } else if element == ")" {
                if !stack.isEmpty {
                    stack.removeLast()
                } else {
                    //there is no unmatched '(' to match this ')'
                    toRemove.insert(index)
                }
            }
        }
        
        // Add any unmatched '(' indices left in the stack to the removal set
        while !stack.isEmpty {
            toRemove.insert(stack.removeLast())
        }
        
        // Build the result string, skipping indices that need to be removed
        var result = ""
        for (index, element) in sArray.enumerated() {
            if !toRemove.contains(index) {
                result.append(element)
            }
        }
        
        return result
    }
}

/*
 
 Input: s = "a)b(c)d"
 Output: "ab(c)d"
 
 */
