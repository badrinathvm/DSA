//: [Previous](@previous)

import Foundation


//let graph = Graph<String>()
//graph.addNode(value: "A")
//graph.addNode(value: "B")
//graph.addNode(value: "C")
//
//graph.addEdge(from: "A", to: "B", bidirectional: false)
//graph.addEdge(from: "B", to: "C")
//graph.addEdge(from: "A", to: "C")
//
//graph.printGraph()

print("--- Valid Path ---")
let edges = [[0,1],[1,2],[2,0]], source = 0, destination = 2
let result = ValidPath().validPath(3, edges, source, destination)
print(result)
