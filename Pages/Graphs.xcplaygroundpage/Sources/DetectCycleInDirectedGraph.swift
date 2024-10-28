//
//  DetectCycleInDirectedGraph.swift
//  
//
//  Created by Rani Badri on 10/27/24.
//

public class DetectCycleInDirectedGraph {
    public init() {
        
    }
    
    public func detectCycle(_ edges: [[Int]]) -> Bool {
        let graph = Graph<Int>()
        
        graph.buildGraph(edges: edges)
        
        return graph.detectCycle()
    }
}

extension Graph {
    func detectCycle() -> Bool {
        var visited = Set<T>()
        var recusionStack = Set<T>()
        
        for node in nodes.values {
            if detectCycleDFS(node, &visited, &recusionStack) {
                return true
            }
        }
        return false
    }
    
    func detectCycleDFS(_ node: Node<T>, _ visited: inout Set<T>, _ recursionStack: inout Set<T>) -> Bool {
        if recursionStack.contains(node.value) {
            return true
        }
        
        if visited.contains(node.value) {
            return false
        }
        
        visited.insert(node.value)
        recursionStack.insert(node.value)
        
        for neighbor in node.neighbors {
            if detectCycleDFS(neighbor, &visited, &recursionStack) {
                return true
            }
        }
        
        recursionStack.remove(node.value)
        return false
    }
}
