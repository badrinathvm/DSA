//
//  RemoveAllAdjacenDuplicates.swift
//  
//
//  Created by Rani Badri on 11/3/24.
//

/**
     Time Compelxity:  O(n)
     Space Complexity : O(n)
 */

public class RemoveAllAdjacenDuplicates {
    public init() {}
    
    public func removeAdjacentDuplicates(_ s: String, _ k : Int) -> String {
        var stack = [(Character, Int)]()
        for char in s {
            if let lastElement = stack.last, lastElement.0 == char {
                // increment the count of the top
                stack[stack.count - 1].1 += 1
                // the count reaches k, pop the element from the stack
                if stack[stack.count - 1].1 == k {
                    // push the current element on to stack with a count 1
                    stack.removeLast()
                }
            } else {
                stack.append((char, 1))
            }
        }
        
        var result = ""
        for element in stack {
            result += Array(repeating: element.0, count: element.1)
        }
        return result
    }
}

/*
 
 Input: s = "deeedbbcccbdaa", k = 3
 Output: "aa"
 
 Explanation:
 First delete "eee" and "ccc", get "ddbbbdaa"
 Then delete "bbb", get "dddaa"
 Finally delete "ddd", get "aa"
 
 */
