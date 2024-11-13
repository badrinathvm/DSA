//
//  SortParentheses.swift
//  
//
//  Created by Rani Badri on 11/12/24.
//

public class SortParentheses {
    public init() { }
    
    public func sortParentheses(_ input: String) -> String {
        var openCount = 0 , closeCount = 0
        var sortedParentheses = ""
        
        // count each type of parentheses
        for char in input {
            if char == "(" {
                openCount += 1
            } else if char == ")" {
                closeCount += 1
            }
        }
        
        // find thr number of balanced pairs we can create
        let balancedPairs = min(openCount, closeCount)
        
        // construct the sorted/balanced string
        for _ in 0..<balancedPairs {
            sortedParentheses.append("(")
        }
        
        for _ in 0..<balancedPairs {
            sortedParentheses.append(")")
        }
        
        return sortedParentheses
    }
}

/*
 
 Input = "())()"
 Output = "(())
 
 */
