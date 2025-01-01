//
//  NestedListWeightSum.swift
//  
//
//  Created by Rani Badri on 12/31/24.
//

/*
Approach:
 
 1.    Queue for Breadth-First Traversal:
     •    Use a queue to store tuples of the current list and its depth.
     •    Start with the given nested list at depth 1.
 2.    Processing Elements:
     •    For each element, if it is an integer, multiply it by the depth and add it to the sum.
     •    If it is a nested list, add it to the queue with an incremented depth.
 3.    Continue Until Queue is Empty:
     •    The process continues until all elements in the nested structure are processed.
 
 Time Compelxity : O(n)
 Space Complexity: O(n)
 
 */

public class NestedListWeightSum {
    public init() { }
    
    public func depthSum(_ nestedList: [NestedInteger] ) -> Int {
        var queue = Queue<([NestedInteger], Int)>() // Tuple
        var sum = 0
        
        queue.push((nestedList, 1))
        
        while !queue.empty() {
            let (currentList, depth) = queue.front
            
            _ = queue.pop()
            
            for item in currentList {
                if item.isInteger() {
                    sum += item.getInteger() * depth
                } else {
                    queue.push((item.getList() , depth + 1))
                }
            }
        }
        
        return sum
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


public class NestedInteger {
    private var integer: Int?
    private var list: [NestedInteger]?

    // Initializes a single integer
    public init(_ value: Int) {
        self.integer = value
        self.list = nil
    }

    // Initializes a nested list
    public init(_ nestedList: [NestedInteger]) {
        self.integer = nil
        self.list = nestedList
    }

    // Returns true if this NestedInteger holds a single integer, rather than a nested list.
    func isInteger() -> Bool {
        return integer != nil
    }

    // Returns the single integer that this NestedInteger holds, if it holds a single integer.
    // If it holds a nested list, return nil.
    func getInteger() -> Int {
        return integer ?? 0
    }

    // Returns the nested list that this NestedInteger holds, if it holds a nested list.
    // If it holds a single integer, return nil.
    func getList() -> [NestedInteger] {
        return list ?? []
    }
}


/*
 
 Example 2:


 Input: nestedList = [1,[4,[6]]]
 Output: 27
 Explanation: One 1 at depth 1, one 4 at depth 2, and one 6 at depth 3. 1*1 + 4*2 + 6*3 = 27.
 
 
 */
