import Foundation

public class LinkedList {
    public var value: Int
    public var link: LinkedList?
    
    public init(value: Int, link: LinkedList? = nil) {
        self.value = value
        self.link = link
    }
    
    public func addMany(values: [Int]) -> LinkedList {
        var current = self
        while current.link != nil {
            current = current.link!
        }
        
        for value in values {
            current.link = LinkedList(value: value)
            current = current.link!
        }
        
        return self
    }
    
    public func getValues(_ list: LinkedList) -> [Int] {
        var values = [Int]()
        var current: LinkedList = list
        while current != nil  {
            values.append(current.value)
            current = current.link!
        }
        return values
    }
    
    public func disp() {
        var current: LinkedList? = self
        
        var length = 0
        
        while current != nil {
            length += 1
            current = current?.link
        }
        
        current = self
        (0..<length).forEach { index in
            print((current?.value)!, terminator: (index == length - 1) ? "" : "--->")
            current = current?.link
        }
    }
    
    public func getNthNode(n: Int) -> LinkedList {
        var counter = 1
        var current = self
        
        while counter < n {
            counter += 1
            
            if let next = current.link {
                current = next
            }
        }
        return current
    }
}

