//
//  MinStack.swift
//  
//
//  Created by Rani Badri on 11/3/24.
//

// Time Complexity - O(1)

public class MinStack<T: Comparable> {
    var stack : [T]
    var minStack : [T]
    
    public init() {
        stack = [T]()
        minStack = [T]()
    }
    
    public func push(_ item: T) {
        stack.append(item)
        
        if minStack.isEmpty || item <= minStack.last! {
            minStack.append(item)
        }
    }
    
    public func pop()  {
        if minStack.last == stack.last {
            minStack.removeLast()
        }
        
        stack.removeLast()
    }
    
    public func getMin() -> T {
        minStack.last!
    }
    
    public var top: T {
        guard let lastElement = stack.last else {
            return -1 as! T
        }
        return lastElement
    }
    
    public func disp() {
        print(self.minStack)
    }
}
