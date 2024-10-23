//
//  BibaryTreeRightSideView.swift
//  
//
//  Created by Rani Badri on 10/14/24.
//

// Time Complexity - O(N) , Space Complexity - O(N)
public class BinaryTreeRightSideView {
    public static func rightSideView(_ root: Tree?) -> [Int] {
        guard let root else { return [] }
        var result = [Int]()
        
        var queue = Queue<Tree>()
        queue.push(root)
        
        while !queue.empty() {
 
            // get the lkevel count
            let levelCount = queue.arr.count
            var lastNodeValue: Int?
            
            // Process each level
            for i in 0..<levelCount {
                // get the front node
                let node = queue.front
                
                _ = queue.pop()
                
                // Always update the lastNodeValue (we want the rightmost node)
                lastNodeValue = node.value
                
                // Add left and right children to the queue
                if let left = node.left {
                    queue.push(left)
                }
                
                if let right = node.right {
                    queue.push(right)
                }
            }
            
            if let last = lastNodeValue {
                result.append(last)
            }
        }
        
        return result
    }
    
    public static func leftSideView(_ root: Tree?) -> [Int] {
        guard let root else { return [] }
        var result = [Int]()
        
        var queue = Queue<Tree>()
        queue.push(root)
        
        while !queue.empty() {
 
            // get the lkevel count
            let levelCount = queue.arr.count
            var firstNodeValue: Int?
            
            // Process each level
            for i in 0..<levelCount {
                // get the front node
                let node = queue.front
                
                _ = queue.pop()
                
                // Capture the first node in the level
                if i == 0 {
                    firstNodeValue = node.value
                }
                
                // Add left and right children to the queue
                if let left = node.left {
                    queue.push(left)
                }
                
                if let right = node.right {
                    queue.push(right)
                }
            }
            
            if let first = firstNodeValue {
                result.append(first)
            }
        }
        
        return result
    }
}
