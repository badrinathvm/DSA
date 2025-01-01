//
//  AddToMakeParenthesesValid.swift
//  
//
//  Created by Rani Badri on 12/31/24.
//

/*
 1.    Use Counters:
     •    Use a counter to track unmatched opening parentheses.
     •    Count unmatched closing parentheses.
 2.    Iterate Through String:
     •    For each ‘(’ encountered, increment the counter for unmatched opening parentheses.
     •    For each ‘)’ encountered:
     •    If there’s an unmatched opening parenthesis, decrement the counter for unmatched opening parentheses.
     •    Otherwise, increment a counter for unmatched closing parentheses.
 3.    Result:
     •    The total additions needed will be the sum of unmatched opening and closing parentheses.
 
 Complexity
     •    Time Complexity: O(n), where n is the length of the string.
     •    Space Complexity: O(1), as only a few variables are used.
 */

public class AddToMakeParenthesesValid {
    public init() {
        
    }
    
    public func minAddToMakeValid(_ s: String) -> Int {
        var open = 0 // Tracks unmatched '('
        var close = 0 // Tracks unmatched ')'
        
        for char in s {
            if char == "(" {
                open += 1
            } else if open > 0 { // A matching '(' is available
                open -= 1
            } else {  // No matching '(' available
                close += 1
            }
        }
        return open + close 
    }
}

/*
 
    xample 1:
     Input: s = "())"
     Output: 1
 
     Example 2:
     Input: s = "((("
     Output: 3
 
 
 
 */
