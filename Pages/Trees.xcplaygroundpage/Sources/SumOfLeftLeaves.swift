//
//  SumOfLeftLeaves.swift
//  
//
//  Created by Rani Badri on 11/3/24.
//

public class SumOfLeftLeaves {
    public init() {
    }
    
    public func sumLeftLeaves(_ root: Tree?) -> Int {
        guard let root else { return 0 }
        
        func sumLeftLeavesHelper(node: Tree?, isLeft: Bool) -> Int {
            guard let node else { return 0 }
            
            if node.left == nil && node.right == nil {
                return isLeft ? node.value : 0
            }
            
            let leftSum = sumLeftLeavesHelper(node: node.left, isLeft: true)
            let rightSum = sumLeftLeavesHelper(node: node.right, isLeft: false)
            
            return leftSum + rightSum
        }
        
        let result = sumLeftLeavesHelper(node: root, isLeft: false)
        return result
    }
}
