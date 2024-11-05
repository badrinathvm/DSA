//
//  CountNodeAverageTree.swift
//  
//
//  Created by Rani Badri on 10/14/24.
//

public class CountNodeAverageTree {
    
    // if node's value  == Avregare of sub tree ( total sum / total count)  - Then increment the count.
    // in order to calculate the total sum and total count leverage Post order traversal.
    public static func averageOfSubtree(_ root: Tree?) -> Int {
        var count = 0
        _ = postOrder(root, &count)
        return count
    }
    
    static func postOrder(_ root: Tree?, _ count: inout Int) -> (sum: Int, count: Int) {
        guard let root else { return (0,0) }
        
        let (leftSum, leftCount) = postOrder(root.left, &count)
        let (rightSum, rightCount) = postOrder(root.right, &count)
        
        // sub tree sum and averags
        let totalSum = leftSum + rightSum + root.value
        let totalCount = leftCount + rightCount + 1
        
        // Calculate average and check if it matches the node's value
        if root.value == totalSum / totalCount {
            count += 1
        }
        
        return (totalSum, totalCount)
    }
}

/*
 Input: root = [4,8,5,0,1,null,6]
 Output: 5
 
 Explanation:
 For the node with value 4: The average of its subtree is (4 + 8 + 5 + 0 + 1 + 6) / 6 = 24 / 6 = 4.
 For the node with value 5: The average of its subtree is (5 + 6) / 2 = 11 / 2 = 5.
 For the node with value 0: The average of its subtree is 0 / 1 = 0.
 For the node with value 1: The average of its subtree is 1 / 1 = 1.
 For the node with value 6: The average of its subtree is 6 / 1 = 6.
 
 
 */
