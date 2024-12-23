//: [Previous](@previous)

import Foundation

class ListNode {
    var key: Int
    var value: Int
    var next: ListNode?
    
    init(key: Int = -1, value: Int = -1, next: ListNode? = nil) {
        self.key = key
        self.value = value
        self.next = next
    }
}

class MyHashMap {
    private var map: [ListNode]
    private let size = 1000
    
    init() {
        map = Array(repeating: ListNode(), count: size)
    }
    
    // Generates the hash (index) based on the key
    private func hash(_ key: Int) -> Int {
        return key % size
    }
    
    func put(_ key: Int, _ value: Int) {
        // get the index
        let index = self.hash(key)
        
        var current = self.map[index]
        while let nextNode = current.next {
            if nextNode.key == key  {
                // Update the value if key exists.
                nextNode.value = value
                return
            }
            current = nextNode
        }
        // Add a new node at the end of the chain
        current.next = ListNode(key: key, value: value)
    }
    
    func get(_ key: Int) -> Int {
        let index = hash(key)
        // Start with the first actual node
        var current: ListNode? = map[index].next
        while let node = current {
            if node.key == key {
                // Return the value if the key matches
                return node.value
            }
            // Move to the next node
            current = node.next
        }
        return -1 // Key not found
    }
    
    func remove(_ key: Int) {
        let index = self.hash(key)
        
        var current = self.map[index]
        while let nextNode = current.next {
            if nextNode.key == key  {
                // Remove the node by skipping it
                current.next = nextNode.next
            }
            current = nextNode
        }
    }
 }


let hashMap = MyHashMap()
hashMap.put(1, 1)
hashMap.put(2, 2)
print(hashMap.get(1))
print(hashMap.get(2))
hashMap.remove(2) // Re
print(hashMap.get(2))
