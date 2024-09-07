import Foundation

public struct Stack<T>{
    private var arr: [T]
    
    public init() {
        self.arr = [T]()
    }
    
    public mutating func push(_ element: T) {
        arr.append(element)
    }
    
    public mutating func pop() -> T {
        return arr.removeLast()
    }
    
    public var top: T {
        guard let element = arr.last else { return -1 as! T}
        return element
    }
    
    public func disp() {
        print("Stack Content=\(self.arr)")
        print(self.arr)
    }
}
