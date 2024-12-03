//
//  ZigZgLevelOrderTraversal.swift
//
//
//  Created by Rani Badri on 10/13/24.
//

// Time Complexity : O(N)
public class ZigZagLevelOrderTraversal {
    public static func zigZagTraversal(_ root: Tree?) -> [[Int]] {
        guard let root else { return [] }
        
        var result = [[Int]]()
        var queue = Queue<(Tree, Int)>()
        queue.push((root, 1))
        
        while !queue.empty() {
            var currentLevel = [Int]()
            let size = queue.arr.count
            let level = queue.front.1
            
            for _ in 0..<size {
                let (node, level) = queue.front
                _ = queue.pop()
                
                currentLevel.append(node.value)
                
                // Always push left and right children in the same order
                if let left = node.left {
                    queue.push((left, level + 1))
                }
                if let right = node.right {
                    queue.push((right, level + 1))
                }
            }
            
            // Reverse the values for even levels (i.e., zigzag)
            if level.isMultiple(of: 2) {
                currentLevel.reverse()
            }
            
            result.append(currentLevel)
        }
        return result
    }
}


/*
  Input:
     3
   /  \
  9   20
     /  \
    15   7
 
 Output:
  [ [3], [20,9], [15,7] ]
 
 */
