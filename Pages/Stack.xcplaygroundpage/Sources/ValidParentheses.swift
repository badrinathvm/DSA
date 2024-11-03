//
//  Untitled.swift
//  
//
//  Created by Rani Badri on 11/3/24.
//

/*
  Approach:
     create a matchign dictionary for closed bracket : opening bracket.
     Iterate over the string, if the bracket is present in openign brackets section , add it to stack
     if the bracket is present in closed section, get teh last eleemnt of stack, comapre this agaianst the machedDictionary if it matchjes then remove it, else retuirn false.
 
    Time Complexity : O(n) - n is the length of the input string
    Space Complexity: O(n)
 
 */

public class ValidParentheses {
    public init() { }
    
    public func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        let openingBrackets = "({[", closingBrackets = ")}]"
        let matchingBracketDictionary: [Character: Character] = [")" : "(", "}": "{", "]": "["]
        for bracket in s {
            switch bracket {
                case _ where openingBrackets.contains(bracket):
                    stack.append(bracket)
                case _ where closingBrackets.contains(bracket):
                    if stack.count == 0 { return false }
                    // get the last element of the stack and check agaianst the matched dictionary
                    if let lastOpenedBracket = stack.last, matchingBracketDictionary[bracket] == lastOpenedBracket {
                        _ = stack.popLast()
                    } else {
                        return false
                    }
            default: break
            }
        }
        
        return stack.count == 0
    }
}


/*
 
 Input : ()
 Output: true
 
 Input: s = "(]"
 Output: false
 
 */
