//
//  VerticalOrderTraversal.swift
//  
//
//  Created by Rani Badri on 11/4/24.
//

public class VerticalOrderTraversal {
    public init() { }
    
    public func verticalOrder(_ root: Tree?) -> [[Int]] {
        guard let root else { return [] }
        var results = [[Int]]()
        
        // node , x and y position
        var queue: Queue<(Tree, Int, Int)> = Queue<(Tree,Int,Int)>()
        queue.push((root, 0 , 0))
        
        //[x: [(y: nodeValue)]]
        var dict: [Int: [(Int,Int)]] = [:]
        dict[0, default: []] += [(0, root.value)]
        
//        var minX = 0
//        var maxX = 0
        
        while !queue.empty() {
            let levelSize = queue.arr.count
            
            for _ in 0..<levelSize {
                let (node, x, y) = queue.front
                
                _ = queue.pop()
                
//                minX = min(minX, x)
//                maxX = max(maxX, x)
                
                if node.left != nil {
                    queue.push((node.left!, x-1, y+1))
                    dict[x-1, default: []] += [(y + 1, node.left!.value)]
                }
                
                if node.right != nil {
                    queue.push((node.right!, x+1, y+1))
                    dict[x+1, default: []] += [(y+1, node.right!.value)]
                }
            }
        }
        // [x : (y, nodeValue)]
        // [1: [(1, 20)], 2: [(2, 7)], -1: [(1, 9)], 0: [(0, 3), (2, 15)]]
        print(dict)
        
        let sortedNodes = dict.sorted(by: { $0.key < $1.key })
        // sorted Dictionary [-1: [(1, 9)], 0: [(0, 3), (2, 15)], 1: [(1, 20)], 2: [(2, 7)]]
        for (_, value) in sortedNodes {
            // value = > [(1,9)]
            print("Values\(value.map { $0.1 })") // extracting 9 here as this is the node value
            results.append(value.map { $0.1 })
        }
        
        return results
    }
    
    public func verticalTraversal(_ root: Tree?) -> [[Int]] {
        guard let root = root else { return [] }
        
        // Dictionary to store (x, y) positions with nodes
        var nodes: [Int: [(Int, Int)]] = [:]
        
        // Queue to manage nodes and track their x (vertical) and y (row) positions
        var queue: [(node: Tree, x: Int, y: Int)] = [(root, 0, 0)]
        
        // Track min and max x to determine the range of columns
        var minX = 0
        var maxX = 0
        
        while !queue.isEmpty {
            let (node, x, y) = queue.removeFirst()
            
            // Store node value at the x level and y depth
            nodes[x, default: []].append((y, node.value))
            minX = min(minX, x)
            maxX = max(maxX, x)
            
            // Add child nodes to the queue with updated x and y positions
            if let left = node.left {
                queue.append((left, x - 1, y + 1))
            }
            if let right = node.right {
                queue.append((right, x + 1, y + 1))
            }
        }
        
        print("minx: \(minX), maxx: \(maxX)")
        var result = [[Int]]()
        for x in minX...maxX {
            // Sort nodes in the current x level by y first, and then by value
            let sortedNodes = nodes[x, default: []].sorted { (lhs, rhs) in
                if lhs.0 == rhs.0 {
                    return lhs.1 < rhs.1
                } else {
                    return lhs.0 < rhs.0
                }
            }
            // Extract values for the result
            let column = sortedNodes.map { $0.1 }
            result.append(column)
        }
                
        return result
    }
}
