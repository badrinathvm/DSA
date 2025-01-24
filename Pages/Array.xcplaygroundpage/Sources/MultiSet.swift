//
//  MultiSet.swift
//  
//
//  Created by Rani Badri on 1/23/25.
//

import Foundation

struct MultiSet<T: Hashable> {
    private var elements: [T: Int] = [:]
    
    // Add an element to the multiset
    mutating func add(_ element: T) {
        elements[element, default: 0] += 1
    }
    
    // Remove an instance of an element from the multiset
    mutating func remove(_ element: T) {
        if let count = elements[element], count > 1 {
            elements[element] = count - 1
        } else {
            elements[element] = nil
        }
    }
    
    // Check if an element exists in the multiset
    func contains(_ element: T) -> Bool {
        return elements[element] != nil
    }
    
    // Get the count of an element
    func count(of element: T) -> Int {
        return elements[element] ?? 0
    }
    
    // Total number of elements (including duplicates)
    func totalCount() -> Int {
        return elements.values.reduce(0, +)
    }
    
    // Unique elements count
    func uniqueCount() -> Int {
        return elements.count
    }
    
    // Display all elements in the multiset
    func allElements() -> [T] {
        return elements.flatMap { Array(repeating: $0.key, count: $0.value) }
    }
}

// Example Usage
var multiset = MultiSet<String>()
multiset.add("apple")
multiset.add("apple")
multiset.add("banana")
multiset.add("apple")
multiset.remove("apple")

print("Contains 'apple':", multiset.contains("apple")) // true
print("Count of 'apple':", multiset.count(of: "apple")) // 2
print("Total count:", multiset.totalCount()) // 3
print("Unique count:", multiset.uniqueCount()) // 2
print("All elements:", multiset.allElements()) // ["apple", "apple", "banana"]
