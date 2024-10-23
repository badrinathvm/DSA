//
//  SumRootToLeaf.swift
//  
//
//  Created by Rani Badri on 10/20/24.
//

public class SumRootToLeaf {
    public init() { }
    public static func sumRootToLeaf(_ root: Tree?) -> Int {
        sumRootToLeafHelper(root, 0)
    }
    
    static func sumRootToLeafHelper(_ root: Tree?, _ currentSum: Int) -> Int {
        guard let node = root else { return 0 }
        
        // Update the current path sum
        let newSum = currentSum * 10 + node.value
        
        if node.left == nil && node.right == nil {
            return newSum
        }
        
        //Recursively calculate the sym of left and right nodes
        let leftSum = sumRootToLeafHelper(node.left, newSum)
        let rightSum = sumRootToLeafHelper(node.right, newSum)
        
        return leftSum + rightSum
    }
}
