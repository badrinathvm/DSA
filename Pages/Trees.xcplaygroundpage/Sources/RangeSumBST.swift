//
//  RangeSumBST.swift
//  
//
//  Created by Rani Badri on 10/12/24.
//

import Foundation

// print("--- Time Complexity O(N) --- \n")
public class RangeSumBST {
    public static func rangeSumBST(_ root: Tree?, _ low: Int, _ high: Int) -> Int {
//        guard let root else { return 0 }
//        if root.value > high { return rageSumBST(root.left, low, high) }
//        if root.value < low { return rageSumBST(root.right, low, high) }
//        return root.value + rageSumBST(root.left, low, high) + rageSumBST(root.right, low, high)
        return rangeSumBSTHelper(root, low, high)
    }
    
    static func rangeSumBSTHelper(_ root: Tree?, _ low: Int, _ high: Int) -> Int {
        guard let root else { return 0 }
        var sum = 0
        
        if low < root.value {
            sum += rangeSumBSTHelper(root.left, low, high)
        }
        
        if high > root.value  {
            sum += rangeSumBSTHelper(root.right, low, high)
        }
        
        if root.value >= low && root.value <= high {
            sum += root.value
        }
        
        return sum
    }
}


public class RangeBSTSum {
    public init() { }
    
    public func rangeBST(_ root: Tree?, _ low: Int, _ high: Int) -> Int {
        
        func rangeBSTHelper(_ root: Tree?) -> Int  {
            guard let root else { return 0 }
            var sum = 0
            
            // recursive left tree
            if low < root.value {
                let leftSum = rangeBSTHelper(root.left)
                sum += leftSum
            }
            
            // recursive right tree
            if high > root.value {
                let rightSum = rangeBSTHelper(root.right)
                sum += rightSum
            }
            
            // root
            if root.value >= low && root.value <= high {
                let currentSum = root.value
                sum += currentSum
            }
            
            return sum
        }
        
        let result = rangeBSTHelper(root)
        
        return result
    }
}
