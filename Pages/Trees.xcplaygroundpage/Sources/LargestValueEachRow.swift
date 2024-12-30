//
//  LargestValueEachRow.swift
//  
//
//  Created by Rani Badri on 12/30/24.
//

/*
  Time Complexity: O(n), where n is the number of nodes in the tree. Each node is visited once.
 
  Space Complexity: O(m), where m is the maximum number of nodes at any level (queue size).
 */

public class LargestValueEachRow {
    public init() {
    }
    
    public func largestValues(_ root: Tree?) -> [Int] {
        // Return an empty array if the root is nil
        guard let root = root else { return [] }
        
        // Use an array to store the largest values per level
        var result = [Int]()
        
        // Create a queue for level-order traversal
        var queue:Queue<Tree> = Queue<Tree>()
        queue.push(root)
        
        while !queue.empty() {
            let levelCount = queue.arr.count
            var maxValue = Int.min
            
            for _ in 0..<levelCount {
                let node = queue.front
                _ = queue.pop()
                
                // Update the max value for the current level
                maxValue = max(maxValue, node.value)

                // Add children to the queue
                if let leftNode = node.left {
                    queue.push(leftNode)
                }
                
                if let rightNode = node.right {
                    queue.push(rightNode)
                }
            }
            
            // Append the largest value of the current level to the result
            result.append(maxValue)
        }
        return result
    }
}

/*
 
     1
    / \
   3   2
  / \    \
 5   3    9
 
 [1, 3, 9]
 
 */
