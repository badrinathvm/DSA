//
//  BranchSum.swift
//  
//
//  Created by Rani Badri on 11/3/24.
//

public class BranchSum {
    public init() { }
    
    public func branchSum(root: Tree?) -> [Int] {
        var sums = [Int]()
        
        func branchSumHelper(_ node: Tree?, _ runningSum: Int) {
            guard let node else { return }
            
            let currentSum = runningSum + node.value
            
            // if botht the nodes are empty
            if node.left == nil && node.right == nil {
                sums.append(currentSum)
                return
            }
          
            // left node
            branchSumHelper(node.left, currentSum)
            branchSumHelper(node.right, currentSum)
        }
        
        branchSumHelper(root,0)
        return sums
    }
}


/*
 
 Input:
   1
  /
 2
 /
3
 
 Output: [6]
 */


/*
 class Branchsum {
    public static func branchSum(root: Tree) -> [Int] {
        var sums = [Int]()
        calculateBranchSum(node: root, runningSum: 0, sums: &sums)
        return sums
    }
    
    static func calculateBranchSum(node: Tree?, runningSum: Int, sums: inout [Int]){
        guard let node = node else { return }
        
        let runningSum = runningSum + node.value
        
        // if botht the nodes are empty
        if node.left == nil, node.right == nil {
            sums.append(runningSum)
            return
        }
        
        calculateBranchSum(node: node.left, runningSum: runningSum, sums: &sums)
        calculateBranchSum(node: node.right, runningSum: runningSum, sums: &sums)
    }
} */
