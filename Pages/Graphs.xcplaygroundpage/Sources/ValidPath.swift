//
//  Untitled.swift
//  
//
//  Created by Rani Badri on 10/26/24.
//

/*
  Time Complexity : O(V+E), wher V is the number of vertices(nodes) , E is the number of edges.
 
  Space  Complexity : O(V+E) due to adjaceny list and the visited set and queue in BFS
 */
public class ValidPath {
    public init() { }
    
    
    public func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        let graph = Graph<Int>()
        
        graph.buildGraph(edges: edges)
        
        graph.printGraph()
        
        return graph.hasPath(from: source, to: destination)
    }
}

extension Graph {
    
    // Check if a path exists using BFS
    func hasPath(from source: T, to destination: T) -> Bool {
        guard let sourceNode = nodes[source], let destinationNode = nodes[destination] else {
            return false
        }
        
        var visited: Set<T> = []
        var queue = [sourceNode]
        visited.insert(sourceNode.value)
        
        while !queue.isEmpty {
            let currentNode = queue.removeFirst()
            
            // Check if we've reached the destination node
            if currentNode.value ==  destinationNode.value {
                return true
            }
            
            // Explore neighbors
            for neighbor in currentNode.neighbors {
                if !visited.contains(neighbor.value) {
                    visited.insert(neighbor.value)
                    queue.append(neighbor)
                }
            }
        }
        
        // If we exhaust the queue without finding the destination, return false
        return false
    }
}
