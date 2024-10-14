//
//  LevelOrderTravsersal.swift
//  
//
//  Created by Rani Badri on 10/13/24.
//

public class LevelOrderTraversal {
    
    public static func levelOrderTraversal(_ root: Tree?) {
        if root == nil { return }
        
        var queue = Queue<Tree>()
        queue.push(root!)
        
        while !queue.empty() {
            let node = queue.front
            print(node.value, terminator: ",")
            
            _ = queue.pop()
            
            if node.left != nil {
                queue.push(node.left!)
            }
            
            if node.right != nil {
                queue.push(node.right!)
            }
        }
    }
    
    public static func maxLevelSum(_ root: Tree?) -> Int {
        guard let root else { return -1 }
        
        var dict: [Int: [Int]] = [:]
        var queue = Queue<(Tree, Int)>()
        
        queue.push((root, 1))
        dict[1, default: []] += [ root.value ]
        
        while !queue.empty() {
            let (node, level) = queue.front
            print("value=\(node.value), level=\(level)")
            
            _ = queue.pop()
            
            if node.left != nil {
                queue.push((node.left!, level + 1))
                dict[level + 1, default: []] += [ node.left!.value ]
            }
            
            if node.right != nil {
                queue.push((node.right!, level + 1))
                dict[level + 1, default: []] += [ node.right!.value ]
            }
        }
        
        /* Traditional Approach
        var maxLevel = 0
        var maxSum = Int.min // Start with the smallest possible value
        for (key, value) in dict {
            let sum = value.reduce(0, +)
            if sum > maxSum {
                maxSum = sum // // Directly assign sum to maxSum
                maxLevel = key
            }
        }
         */
        
        // Adopt functional programming way
        let result = dict
            .mapValues { $0.reduce(0, +) }
            .max {
                // First compare sums, and if they are equal, choose the smaller key (level)
                if $0.value != $1.value {
                    return $0.value < $1.value
                } else {
                    return $0.key > $1.key
                }
            } ?? (0,0)
        
        return result.key
    }
}

struct Queue<T> {
    
    var arr:[T] = []
    
    mutating func push(_ item: T) {
        arr.append(item)
    }
    
    mutating func pop() -> T? {
        guard !arr.isEmpty else { return nil }
        return arr.removeFirst()
    }
    
    func empty() -> Bool {
        arr.isEmpty
    }
    
    var front: T { arr.first! }
    
    var rear: T { arr.last! }
}
