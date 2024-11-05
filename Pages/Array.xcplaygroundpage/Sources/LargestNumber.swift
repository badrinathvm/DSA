//
//  LargestNumber.swift
//  
//
//  Created by Rani Badri on 10/19/24.
//

public class LargestNumber {
    public init() {
        
    }
    
    public static func largestNumber(_ input: [Int]) -> String {
        // convert all the numbers to string
        let strNums = input.map { String($0) }
        
        let sortNumbers = strNums.sorted {
            $0 + $1 > $1 + $0
        }
        
        // join the sorted numbers in to one string
        let result = sortNumbers.joined()
        
        return result.first == "0" ? "0" : result
    }
}

/*
 
 Input: 123456
 
 Output: 654321
 
 */
