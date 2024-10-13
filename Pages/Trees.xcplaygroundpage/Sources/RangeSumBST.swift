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
        guard let root = root else { return 0 }
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
