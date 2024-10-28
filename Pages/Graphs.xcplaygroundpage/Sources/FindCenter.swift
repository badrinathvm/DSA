//
//  FindCenter.swift
//  
//
//  Created by Rani Badri on 10/26/24.
//

public class FindCenter {
    public init() {
        
    }
    
    public func findCenter(_ edges: [[Int]]) -> Int {
        let graph = Graph<Int>()
        graph.buildGraph(edges: edges)
        
        let center = graph.findCenter()
        return center
    }
}

extension Graph {
    public func findCenter() -> T {
        // Ensure there are at least two edges to work with
        guard edges.count >= 2 else { fatalError("Graph does not have enough edges") }
        
//        // Get the first two edges
        let firstEdge = edges[0]
        let secondEdge = edges[1]
        
        
        // Extract the nodes from the edges
        let u1 = firstEdge[0]
        let v1 = firstEdge[1]
        let u2 = secondEdge[0]
        let v2 = secondEdge[1]
//        
        // Check for the center node
        if u1 == u2 || u1 == v2 {
            return u1
        } else {
            return v1
        }
    }
    
    func fincCenterUsingCount() -> T {
        // second approach
        var frequency = [T: Int]()
        for edge in edges {
            for node in edge {
                frequency[node, default: 0] += 1
            }
        }
        
        // Find the max
        let centerNode = frequency.max(by: { $0.value < $1.value })?.key
        
        // Ensure that we have found a center node
        guard let center = centerNode else { fatalError("No center found") }
        return center
    }
}
