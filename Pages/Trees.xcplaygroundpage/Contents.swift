//: [Previous](@previous)

import Foundation

print("\n---Branch Sum ---")
let branchTree = Tree(value: 1)
branchTree.left = Tree(value: 2)
branchTree.right = Tree(value: 3)
let result = BranchSum().branchSum(root: branchTree)
print(result)

print("\n--- Sum of Leafnodes ---")
let sampleTree = Tree(value: 3)
sampleTree.left = Tree(value: 9)
sampleTree.right = Tree(value: 20)
sampleTree.right!.left = Tree(value: 15)
sampleTree.right!.right = Tree(value: 7)
let sumLeftLeavesNodeResult = SumOfLeftLeaves().sumLeftLeaves(sampleTree)
print(sumLeftLeavesNodeResult)

print("\n--- Merged Tree Result ---")
let mergeTree1 = Tree(value: 1)
mergeTree1.left = Tree(value: 3)
mergeTree1.right = Tree(value: 2)
mergeTree1.left!.left = Tree(value: 5)

let mergeTree2 = Tree(value: 2)
mergeTree2.left = Tree(value: 1)
mergeTree2.right = Tree(value: 3)
mergeTree2.left!.right = Tree(value: 4)
mergeTree2.right!.right = Tree(value: 7)

let mergedTreeResult = MergeTwoBinaryTree().mergeTwoBinaryTree(mergeTree1, mergeTree2)
MergeTwoBinaryTree.printTree(mergedTreeResult)

print("\n--- Range Sum of BST --")
let rangeSumTree = Tree(value: 10)
rangeSumTree.left = Tree(value: 5)
rangeSumTree.right = Tree(value: 15)
rangeSumTree.left!.left = Tree(value: 3)
rangeSumTree.left!.right = Tree(value: 7)
rangeSumTree.right!.right = Tree(value: 18)
//print(RangeSumBST.rangeSumBST(rangeSumResult, 7, 15))
let rangeResultBST = RangeBSTSum().rangeBST(rangeSumTree, 7, 15)
print(rangeResultBST)

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

print("\n\n -- Level Order Traversl -- ")
let levelOrderTree = Tree(value: 1)
levelOrderTree.left = Tree(value: 2)
levelOrderTree.right = Tree(value: 3)
LevelOrderTraversal.levelOrderTraversal(levelOrderTree)

print(" \n\n -- Level Order Traversal Max sum -- ")
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

print(" -- Count Nodes Equal to Average of SubTree -- ")
let avergaTree = Tree(value: 4)
avergaTree.left = Tree(value: 8)
avergaTree.right = Tree(value: 5)
avergaTree.left?.left = Tree(value: 0)
avergaTree.left?.right = Tree(value: 1)
avergaTree.right?.right = Tree(value: 6)
let averageCount = CountNodeAverageTree.averageOfSubtree(avergaTree)
print(averageCount)

print(" -- Binary Tree Right Side View --")
let rightSideViewTree = Tree(value: 1)
rightSideViewTree.left = Tree(value: 2)
rightSideViewTree.right = Tree(value: 3)
rightSideViewTree.left?.right = Tree(value: 5)
rightSideViewTree.right?.left = Tree(value: 4)
let rightSideResult = BinaryTreeRightSideView.rightSideView(rightSideViewTree)
print(rightSideResult)

let leftSideResult = BinaryTreeRightSideView.leftSideView(rightSideViewTree)
print(leftSideResult)


print(" -- K smallest Element --")
let kSmallestElementTree = Tree(value: 3)
kSmallestElementTree.left = Tree(value: 1)
kSmallestElementTree.right = Tree(value: 4)
kSmallestElementTree.left?.right = Tree(value: 2)
let kSmallestResult = KSmallestElement.kthSmallest(kSmallestElementTree, 1)
print(kSmallestResult)

print(" -- Sum to Leaf numbers --")
let sumToLeafTree = Tree(value: 1)
sumToLeafTree.left = Tree(value: 2)
sumToLeafTree.right = Tree(value: 3)
let sumToLeafResult = SumRootToLeaf.sumRootToLeaf(sumToLeafTree)
print(sumToLeafResult)

print(" -- Construct Tree from InORder and PRe Order Travsersl --")
let treeResult = ConstructTreeFromPreOrderAndInOrderArray().buildTree([3,9,20,15,7], [9,3,15,20,7])
print(treeResult)

print(" --- Increasing Order BST --")
let increasingOrderBST = Tree(value: 5)
increasingOrderBST.left = Tree(value: 1)
increasingOrderBST.right = Tree(value: 7)
let increasingOrderResult = IncreasingOrderBST().increasingOrderBST(increasingOrderBST)
print(increasingOrderResult?.right?.right?.value)

print(" ---- Balanced Binary Tree --- ")
let balancedBinaryTree = Tree(value: 1)
balancedBinaryTree.left = Tree(value: 2)
balancedBinaryTree.right = Tree(value: 3)
let balancedBinaryResult = BalancedBinaryTree().isBalanced(balancedBinaryTree)
print(balancedBinaryResult)

print(" --- Same Tree ---")
let sameTree1 = Tree(value: 1)
sameTree1.left = Tree(value: 2)
sameTree1.right = Tree(value: 3)

let sameTree2 = Tree(value: 1)
sameTree2.left = Tree(value: 2)
sameTree2.right = Tree(value: 3)

let sameTreeResult = SameTree().isSame(sameTree1, sameTree2)
print(sameTreeResult)

print(" --- Invert Binary tree ---")
let invertBinaryTree = Tree(value: 1)
invertBinaryTree.left = Tree(value: 2)
invertBinaryTree.right = Tree(value: 3)
let invertBinaryResult = InvertBinaryTree().invertTree(invertBinaryTree)
print(invertBinaryResult?.left?.value)

print(" --- Diameter of Binary Tree ---")
let diameterOfBinaryTree = Tree(value: 1)
diameterOfBinaryTree.left = Tree(value: 2)
diameterOfBinaryTree.right = Tree(value: 3)
let diameterOfBinaryResult = DiameterBinaryTree().diameterOfBinaryTree(diameterOfBinaryTree)
print(diameterOfBinaryResult)

print(" --- Flatten tree ---")
let flattenTree = Tree(value: 1)
flattenTree.left = Tree(value: 2)
flattenTree.right = Tree(value: 3)
FlattenTree().flatten(flattenTree)
print(flattenTree.right?.right?.value)


print(" --- Vertical Order Travsersal ---")
let verticalOrderTraversal = Tree(value: 3)
verticalOrderTraversal.left = Tree(value: 9)
verticalOrderTraversal.right = Tree(value: 20)
verticalOrderTraversal.right?.left = Tree(value: 15)
verticalOrderTraversal.right?.right = Tree(value: 7)
let verticalOrderResult = VerticalOrderTraversal().verticalOrder(verticalOrderTraversal)
print(verticalOrderResult)

//let verticalOrderResult1 = VerticalOrderTraversal().verticalTraversal(verticalOrderTraversal)
//print(verticalOrderResult1)

print(" -- Lowest Common ancestor --")
// Example usage:
let root = Tree(value: 3)
let node5 = Tree(value: 5)
let node1 = Tree(value: 1)
root.left = node5
root.right = node1

let node6 = Tree(value: 6)
let node2 = Tree(value: 2)
node5.left = node6
node5.right = node2

let node7 = Tree(value: 7)
let node4 = Tree(value: 4)
node2.left = node7
node2.right = node4

if let lca = LowestCommonAncestor().lca(root, node5, node2) {
    print("LCA of node 5 and node 4 is \(lca.value)")  // Output: LCA of node 5 and node 4 is 5
} else {
    print("LCA not found")
}

let grid = [
    [0, 1, 0, 1, 1, 0, 1],
    [0, 1, 1, 1, 1, 0, 1],
    [0, 0, 0, 1, 1, 0, 1],
    [1, 1, 0, 1, 1, 0, 1],
    [1, 0, 1, 1, 1, 0, 1],
    [0, 1, 0, 0, 0, 0, 0]
]
let start = Position(x: 0, y: 0)
let end = Position(x: 3, y: 2)

if let shortestPath = ShortesPathInGrid().shortestPathInGrid(grid: grid, start: start, end: end) {
    print("The shortest path length is \(shortestPath).")
} else {
    print("No path found.")
}
