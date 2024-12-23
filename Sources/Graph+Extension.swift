//
//  Graph+Extension.swift
//  
//
//  Created by Rani Badri on 10/26/24.
//

public class Node<T: Hashable> {
    public var value: T
    public var neighbors: [Node]
    
    public init(value: T) {
        self.value = value
        self.neighbors = []
    }
}

public class Graph<T: Hashable> {
    public var nodes: [T: Node<T>]
    public var edges: [[T]]
    
    public init() {
        self.nodes = [:]
        self.edges = []
    }
    
    public func addNode(value: T) {
        // This check is for adding the same node again
        guard nodes[value] == nil else { return }
        nodes[value] = Node(value: value)
    }
    
    public func addEdge(from source: T, to destination: T, bidirectional: Bool = true) {
        // Ensure both the nodes are present in the graph
        guard let sourceNode = nodes[source],
              let destinationNode = nodes[destination] else { return }
        
        // Add the edge
        sourceNode.neighbors.append(destinationNode)
        
        // if it's a bidirectional edge, revers the connection
        if bidirectional {
            destinationNode.neighbors.append(sourceNode)
        }
    }
    
    public func printGraph() {
        for (key, node) in nodes {
            let neighbors = node.neighbors.map { $0.value }
            print("\(key): \(neighbors)")
        }
    }
    
    public func buildGraph(edges: [[T]]) {
        self.edges = edges
        edges.forEach { edge in
            let u = edge[0]
            let v = edge[1]
            
            // Add nodes
            self.addNode(value: u)
            self.addNode(value: v)
            
            self.addEdge(from: u, to: v)
        }
    }
}


public struct Queue<T> {
    
    var arr:[T] = []
    
    mutating public func push(_ item: T) {
        arr.append(item)
    }
    
    mutating public func pop() -> T? {
        guard !arr.isEmpty else { return nil }
        return arr.removeFirst()
    }
    
    public func empty() -> Bool {
        arr.isEmpty
    }
    
    public var front: T { arr.first! }
    
    public var rear: T { arr.last! }
}
