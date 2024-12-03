//
//  LRUCache.swift
//  
//
//  Created by Rani Badri on 12/3/24.
//

class LRUCache<Key: Hashable, Value> {
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

    init(capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Key) -> Value? {
        guard let node = cache[key] else { return nil }
        moveToHead(node)
        return node.value
    }

    func put(_ key: Key, _ value: Value) {
        if let node = cache[key] {
            // Update the value if the key exists and move to the head
            node.value = value
            moveToHead(node)
        } else {
            // Create a new node
            let newNode = Node(key: key, value: value)
            cache[key] = newNode
            addToHead(newNode)

            if cache.count > capacity {
                if let tailNode = removeTail() {
                    cache.removeValue(forKey: tailNode.key)
                }
            }
        }
    }

    private func moveToHead(_ node: Node) {
        remove(node)
        addToHead(node)
    }

    private func addToHead(_ node: Node) {
        node.next = head
        node.prev = nil
        head?.prev = node
        head = node

        if tail == nil {
            tail = head
        }
    }

    private func remove(_ node: Node) {
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

    private func removeTail() -> Node? {
        if let tailNode = tail {
            remove(tailNode)
            return tailNode
        }
        return nil
    }
}


let lruCache = LRUCache<String, Int>(capacity: 3)

lruCache.put("a", 1)
lruCache.put("b", 2)
lruCache.put("c", 3)
print(lruCache.get("a")) // Output: 1

lruCache.put("d", 4) // "b" will be removed (Least Recently Used)
print(lruCache.get("b")) // Output: nil
print(lruCache.get("c")) // Output: 3

lruCache.put("e", 5) // "a" will be removed (Least Recently Used)
print(lruCache.get("a")) // Output: nil
print(lruCache.get("d")) // Output: 4
