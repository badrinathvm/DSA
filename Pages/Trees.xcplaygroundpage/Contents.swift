//: [Previous](@previous)

import Foundation

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
}

print("\n---Branch Sum ---")
let branchTree = Tree(value: 1)
branchTree.left = Tree(value: 2)
branchTree.left!.left = Tree(value: 3)
let result = Branchsum.branchSum(root: branchTree)
print(result)

print("\n--- Sum of Leafnodes ---")
class SumOFLeaveNodes {
     static func leaveNodes(_ root: Tree?) -> Int {
        return sumOfLeftLeavesHelper(root, isLeft: false)
     }
    
    static func sumOfLeftLeavesHelper(_ node: Tree?, isLeft: Bool) -> Int {
        guard let node = node else { return 0 }
        
        // Check if the node is a leaf and if it is a left child
        if node.left == nil && node.right == nil {
            return isLeft ? node.value : 0
        }
        
        // Recur on both left and right children
        let leftSum = sumOfLeftLeavesHelper(node.left, isLeft: true)
        let rightSum = sumOfLeftLeavesHelper(node.right, isLeft: false)
        
        return leftSum + rightSum
    }
}

let sampleTree = Tree(value: 3)
sampleTree.left = Tree(value: 9)
sampleTree.right = Tree(value: 20)
sampleTree.right!.left = Tree(value: 15)
sampleTree.right!.right = Tree(value: 7)
print(SumOFLeaveNodes.leaveNodes(sampleTree))




