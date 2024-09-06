//: [Previous](@previous)

import Foundation

// MARK:- Reduce Tricks
let list = [1,2,2,3,3,4]
let output = list.reduce(into: [:]) { dict, element in
    dict[element, default: 0] += 1
}
print(output)

// find the max
let maxElement = [1,2,4,4,5,6].reduce(Int.min, { max($0, $1) } )
print(maxElement)

let minElement = [1,2,4,4,5,6].reduce(Int.max, { min($0,$1) } )
print(minElement)

// contains element
let containsElement = [1,2,4,4,5,6].reduce(false, { $1 == 12 || $0 })
print(containsElement)

// merge alternate positions
let mergedArray = zip([1,3,5],[2,4,6]).reduce([],{
    $0 + [$1.0, $1.1]
})
print(mergedArray)

// consecutives
var list1 = [1,2,3,4,5,6]
let consecutive = list1.map { $0 - 1 }.dropFirst() == list1.map { $0 }.dropLast()
print(consecutive)

// contains duplicates
let removeDuplicates = [1,1,3,3,4].reduce([], { a, b in
    return a.contains(b) ? a : a + [b]
})
print(removeDuplicates)

// sort dictionary values and keys
var valueDictionary = ["b": [1,32,4], "a": [9,10,8]]
let sortedDictionary = valueDictionary.mapValues { $0.sorted { $0 < $1 } }.sorted { $0.0 < $1.0 }
print(sortedDictionary)

// fetch indexes
let indexesArray = [1,3,3,2].enumerated().reduce([], {
    $1.element == 3 ? $0 + [$1.offset] : $0
})
print(indexesArray)

