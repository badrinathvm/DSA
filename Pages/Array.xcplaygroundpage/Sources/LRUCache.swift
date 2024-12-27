//
//  LRUCache.swift
//  
//
//  Created by Rani Badri on 12/3/24.
//

public class LRUCache<Key: Hashable, Value> {
    private class Node {
        var key: Key
        var value: Value
        var prev: Node?
        var next: Node?

        init(key: Key, value: Value) {
            self.key = key
            self.value = value
        }
    }

    private var capacity: Int
    private var cache: [Key: Node] = [:]
    private var head: Node?
    private var tail: Node?

    public init(capacity: Int) {
        self.capacity = capacity
    }

    public func get(_ key: Key) -> Value? {
        /*
          Let's imagine
            Head → {a:1}  → {b:2}  → {c:3}  ← Tail
          Need to access "b"
          Since b is being accessed, it becomes the most recently used.
         
          Remove Node(b:2) from its current position in the list.
          Add Node(b:2) to the head of the list.
         
         Head → {b:2}  → {a:1}  → {c:3}  ← Tail
        */
        guard let node = cache[key] else { return nil }
        moveToHead(node)
        return node.value
    }

    public func put(_ key: Key, _ value: Value) {
        if let node = cache[key] {
            // Update the value if the key exists and move to the head
            node.value = value
            moveToHead(node)
        } else {
            /*
             Let's imagine the
             
             head -> a:1 -> b:2 -> c:3 <- tail
             cache = ["a": Node(a:1), "b": Node(b:2), "c": Node(c:3)]
             
             Now, we execute the operation put("d", 4) ,
             In this case d is not present in cache, we create a new node and "d" is the most recently used one
             
             head -> d:4 -> a:1 -> b:2 -> c:3 <- tail
             cache = ["a": Node(a:1), "b": Node(b:2), "c": Node(c:3), "d": Node(d:4)]
             
             The cache now contains 4 items, which exceeds the capacity (3).
             1. To fix this, we evict the least recently used item, which is always at the tail of the linked list.
             
             head -> d:4 -> a:1 -> b:2 <- tail
             cache = ["a": Node(a:1), "b": Node(b:2) , "d": Node(d:4)]
            */
            
            // Create a new node
            let newNode = Node(key: key, value: value)
            // add it to the cache dictionary
            cache[key] = newNode
            // making sure the newly created one is added to head since it is mostly recently used one.
            addToHead(newNode)

            // if it exceeds the size of the capacity, we need to evict the tail of the linked list
            if cache.count > capacity {
              removeTail()
            }
        }
    }

    private func moveToHead(_ node: Node) {
        // Remove the node from its current position
        remove(node)
        // Add the node to the head of the list
        addToHead(node)
    }

    private func addToHead(_ node: Node) {
        // Point the node's next to the current head
        node.next = head
        node.prev = nil
        // If the current head exists, update its previous pointer
        head?.prev = node
        
        // Update the head to the new node
        head = node

        // If the list was empty, the new node is also the tail
        if tail == nil {
            tail = head
        }
    }

    private func remove(_ node: Node) {
        // Update the previous node's next pointer
        
        let prev = node.prev
        let next = node.next

        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }

        if let next = next {
            next.prev = prev
        } else {
            tail = prev
        }
    }

    private func removeTail() {
        // Guard against an empty list
        guard let tailNode = tail else { return }
        
        // Remove the tail node from the dictionary
        cache.removeValue(forKey: tailNode.key)
        
        // Remove the tail node from the linked list
        remove(tailNode)
    }
}
