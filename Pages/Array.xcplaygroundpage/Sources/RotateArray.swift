//
//  RotateArray.swift
//  
//
//  Created by Rani Badri on 10/10/24.
//

public class RotateArray {
    
    public init() { }
    
    public func rotateArray(_ nums: inout [Int], _ k: Int) {
        let reversedArray = Array(nums.reversed())
        let rotations = (nums.count + k % nums.count) % nums.count
        print(rotations)
        
        let leftPart = Array(reversedArray[0..<rotations].reversed())
        let rightPart = Array(reversedArray[rotations..<nums.count].reversed())
        
        let finalArray = leftPart + rightPart
        print(finalArray)
    }
    
    public func rotateLeft(_ nums: inout [Int], _ k: Int) {
        for _ in 0..<k {
            let firstElement = nums.removeFirst()
            nums.insert(firstElement, at: nums.count)
        }
        print(nums)
    }
}
