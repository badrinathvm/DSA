//
//  ShortesPath.swift
//  
//
//  Created by Rani Badri on 11/12/24.
//

/*
  Time Complexity : O(V+E), wher V is the number of vertices(nodes) , E is the number of edges.
 
  Space  Complexity : O(V+E) due to adjaceny list and the visited set and queue in BFS
 */

public class ShortesPath {
    public init() {}
    
    public func shortestPath(edges: [[Int]], from start: Int, to end: Int) -> Int {
        if start == end {
            return 0
        }
        
        let graph = Graph<Int>()
        graph.buildGraph(edges: edges)
        
        var visited = Set<Int>()
        var queue: Queue<(node: Int, distance: Int)> = Queue<(node: Int, distance: Int)>()
        queue.push((node: start, distance: 0))
        visited.insert(start)
        
        while !queue.empty() {
            let levelSize = queue.arr.count
            
            for _ in 0..<levelSize {
                let (node, currentDistance) = queue.front
                
                _ = queue.pop()
                
                for neighbor in graph.edges[node] {
                    if neighbor == end {
                        return currentDistance + 1
                    }
                    
                    if !visited.contains(neighbor) {
                        visited.insert(neighbor)
                        queue.push((node: neighbor, distance: currentDistance + 1))
                    }
                }
            }
        }
        return -1
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

/*
 Input : Graph connected like below
 
 1 -- 2 -- 3 -- 4 -- 5 -- 6 -- 7 -- 8 -- 9
 
 Output: Distance between 2 and 7 is 5
 
 */
