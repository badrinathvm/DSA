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

print("\n--- Merged Tree Result ---")

class MergeTree {
    static func mergeTrees(_ root1: Tree?, _ root2: Tree?) -> Tree? {
        // If either of the roots is nil, return the other tree
        guard let root1 = root1 else { return root2 }
        guard let root2 = root2 else { return root1 }
        
        // Create a new tree node by summing the values of the two nodes
        let mergedNode = Tree(value: root1.value + root2.value)
        
        // Recursively merge the left and right subtrees
        mergedNode.left = mergeTrees(root1.left, root2.left)
        mergedNode.right = mergeTrees(root1.right, root2.right)
        
        return mergedNode
    }
    
    static func printTree(_ root: Tree?, level: Int = 0) {
        guard let root = root else { return }
        
        // Print the current node with indentation to represent levels
        let indent = String(repeating: "  ", count: level)
        print("\(indent)\(root.value)")
        
        // Traverse the left and right children with increased indentation
        if root.left != nil || root.right != nil { // Only print children if they exist
            printTree(root.left, level: level + 1)
            printTree(root.right, level: level + 1)
        }
    }
}

//let mergeTree1 = Tree(value: 1)
//mergeTree1.left = Tree(value: 3)
//mergeTree1.right = Tree(value: 2)
//mergeTree1.left!.left = Tree(value: 5)
//
//let mergeTree2 = Tree(value: 2)
//mergeTree2.left = Tree(value: 1)
//mergeTree2.right = Tree(value: 3)
//mergeTree2.left!.right = Tree(value: 4)
//mergeTree2.right!.right = Tree(value: 7)
//
//let mergedTreeResult = MergeTree.mergeTrees(mergeTree1, mergeTree2)
//MergeTree.printTree(mergedTreeResult)



let rangeSumResult = Tree(value: 10)
rangeSumResult.left = Tree(value: 5)
rangeSumResult.right = Tree(value: 15)
rangeSumResult.left!.left = Tree(value: 3)
rangeSumResult.left!.right = Tree(value: 7)
rangeSumResult.right!.right = Tree(value: 18)
print(RangeSumBST.rangeSumBST(rangeSumResult, 7, 15))

print(" -- Validate BST  Tree-- ")
let validateBSTTree = Tree(value: 2)
validateBSTTree.left = Tree(value: 1)
validateBSTTree.right = Tree(value: 3)
let validateBSTResult = ValidateBST.validateBST(validateBSTTree)
print(validateBSTResult)

print(" -- Sorted Array To BST -- ")
let sortedArrayBSTInput = [-10,-30,5,9]
let sortedArrayToBSTResult = SortedArrayToBST.sortedArrayToBST(sortedArrayBSTInput)
print(sortedArrayToBSTResult?.preOrderTraversal(root: sortedArrayToBSTResult))

print(" -- Level Order Traversl -- ")
let levelOrderTree = Tree(value: 1)
levelOrderTree.left = Tree(value: 2)
levelOrderTree.right = Tree(value: 3)
LevelOrderTraversal.levelOrderTraversal(levelOrderTree)

print(" -- Level Order Traversal Max sum -- ")
let levelSumOrderTree = Tree(value: 1)
levelSumOrderTree.left = Tree(value: 7)
levelSumOrderTree.left?.left = Tree(value: 7)
levelSumOrderTree.left?.right = Tree(value: -8)
levelSumOrderTree.right = Tree(value: 0)
let levelSum = LevelOrderTraversal.maxLevelSum(levelSumOrderTree)
print(levelSum)

print(" -- Zig Zag Level Order Traversal -- ")
let zigZagTree = Tree(value: 3)
zigZagTree.left = Tree(value: 9)
zigZagTree.right = Tree(value: 20)
zigZagTree.right?.left = Tree(value: 15)
zigZagTree.right?.right = Tree(value: 7)
let zigZagResult = ZigZagLevelOrderTraversal.zigZagTraversal(zigZagTree)
print(zigZagResult)

print(" -- Count Nodes Equal to Average of SubTrer -- ")
let avergaTree = Tree(value: 4)
avergaTree.left = Tree(value: 8)
avergaTree.right = Tree(value: 5)
avergaTree.left?.left = Tree(value: 0)
avergaTree.left?.right = Tree(value: 1)
avergaTree.right?.right = Tree(value: 6)
let averageCount = CountNodeAverageTree.averageOfSubtree(avergaTree)
print(averageCount)

print(" -- Binary Tree Rught Side View --")
let rightSideViewTree = Tree(value: 1)
rightSideViewTree.left = Tree(value: 2)
rightSideViewTree.right = Tree(value: 3)
rightSideViewTree.left?.right = Tree(value: 5)
rightSideViewTree.right?.right = Tree(value: 4)
let rightSideResult = BinaryTreeRightSideView.rightSideView(rightSideViewTree)
print(rightSideResult)
