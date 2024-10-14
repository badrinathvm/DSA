//
//  CountNodeAverageTree.swift
//  
//
//  Created by Rani Badri on 10/14/24.
//

public class CountNodeAverageTree {
    
    // if node's value  == Avregare of sub tree ( total sum / total count)  - Then increment the count.
    // in order to calculate the total sum and total count leverage Post oerder traversal.
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
