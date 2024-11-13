//
//  HappyNumber.swift
//  
//
//  Created by Rani Badri on 11/12/24.
//

public class HappyNumber {
    public init() { }
    
    public func isHappy(_ n: Int) -> Bool {
        var slow = n , fast = n
        
        repeat {
            slow = squareSum(slow)
            fast = squareSum(squareSum(fast))
        } while slow != fast
        
        return slow == 1
    }
    
    // Helper function to calculate the sum of squares of digits
    func squareSum(_ num : Int) -> Int {
        var sum = 0
        var current = num
        
        while current > 0 {
            let digit = current % 10
            sum += digit * digit
            current = current / 10
        }
        
        return sum
    }
}

/*
 
 Example
 For the input 19:

 1^2 + 9^2 = 82
 8^2 + 2^2 = 68
 6^2 + 8^2 = 100
 1^2 + 0^2 + 0^2 = 1
 Since we reached 1, 19 is a happy number.

 */
