//
//  LongestPath.swift
//  
//
//  Created by Rani Badri on 11/13/24.
//

struct Node {
    let value: Int
    var neighbors: [Node] = []
}

// Adjacency list representation of the graph
class Graph {
    private var adjList: [Int: [Int]]
    private var memo: [Int: Int]  // Memoization dictionary to store the longest path for each node

    init(edges: [(Int, Int)]) {
        self.adjList = [:]
        self.memo = [:]
        
        // Populate adjacency list from edges
        for (src, dest) in edges {
            if adjList[src] == nil {
                adjList[src] = []
            }
            adjList[src]?.append(dest)
        }
    }

    // Function to find the longest path starting from a given node using DFS with memoization
    func longestPath(from node: Int) -> Int {
        // If already computed, return the stored result
        if let longest = memo[node] {
            return longest
        }

        var maxLength = 0

        // Check each neighbor
        if let neighbors = adjList[node] {
            for neighbor in neighbors {
                maxLength = max(maxLength, 1 + longestPath(from: neighbor))
            }
        }

        // Store result in memo and return it
        memo[node] = maxLength
        return maxLength
    }

    // Function to find the longest path for each node in the graph
    func findLongestPaths() -> [Int: Int] {
        var longestPaths: [Int: Int] = [:]
        
        // Calculate the longest path starting from each node
        for node in adjList.keys {
            longestPaths[node] = longestPath(from: node)
        }
        
        return longestPaths
    }
}

// Example usage:

// Define edges of the directed graph
let edges = [(1, 2), (1, 3), (2, 4), (3, 4), (4, 5), (5, 6)]

// Create the graph
let graph = Graph(edges: edges)

// Find the longest paths starting from each node
let longestPaths = graph.findLongestPaths()

// Print the result
for (node, length) in longestPaths {
    print("Node \(node): Longest path length = \(length)")
}
