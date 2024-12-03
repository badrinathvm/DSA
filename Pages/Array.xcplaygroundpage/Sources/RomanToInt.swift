//
//  RoamTOInt.swift
//  
//
//  Created by Rani Badri on 12/3/24.
//

public class RomanToInt {
    public init() { }
    
    public func romanToInt(_ s: String) -> Int {
        let romanValues: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000,
        ]
        
        var result = 0
        var previousValue = 0
        
        for char in s.reversed() {
            if let value = romanValues[char] {
                if value < previousValue {
                    result -= value
                } else {
                    result += value
                }
                previousValue = value
            }
        }
        return result
    }
}

/*
  Input: MCMXCIV
  Output: 1994
 
 */
