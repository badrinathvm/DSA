//
//  AddStrings.swift
//  
//
//  Created by Rani Badri on 12/27/24.
//

/*
 Complexity Analysis
     1.    Time Complexity:
         •    ( O(\max(n, m)) ), where  n  and  m  are the lengths of num1 and num2.
         •    Each digit is processed once.
     2.    Space Complexity:
        •     O(\max(n, m)) , since we store the result in a string.
 */

public class AddStrings {
    public init() { }
    
    public func addStrings(_ num1: String, _ num2: String) -> String {
        var i = num1.count - 1
        var j = num2.count - 1
        var carry = 0
        var result = ""
        
        let num1Array = Array(num1)
        let num2Array = Array(num2)
        
        while i >= 0 || j >= 0 || carry > 0  {
            let digit1 = (i >= 0) ? Int(String(num1Array[i]))! : 0
            let digit2 = (j >= 0) ? Int(String(num2Array[j]))! : 0
            
            let sum = digit1 + digit2 + carry
            carry = sum / 10
            result.append("\(sum % 10)")
            
            i -= 1
            j -= 1
        }
        
        return String(result.reversed())
    }
}

/*
 
 Input: num1 = "11", num2 = "123"
 Output: "134"
 
 
 */
