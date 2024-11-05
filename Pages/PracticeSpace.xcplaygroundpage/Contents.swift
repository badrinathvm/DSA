//: [Previous](@previous)

class LeverlOrderTraversalT {
    func levelOrder(_ root: Tree?) {
        guard let root else { return }
        
        var queue: Queue<Tree> = Queue<Tree>()
        queue.push(root)
        
        while !queue.isEmpty() {
            let levelSize = queue.arr.count
            
            for _ in 0..<levelSize {
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
    }
    
    
    func maxLevelOrderSum(_ root: Tree?) -> Int {
        guard let root else { return -1 }
        
        var queue: Queue<(Tree, Int)> = Queue<(Tree, Int)>()
        queue.push((root, 1))
        
        var dict: [Int: [Int]] = [:]
        dict[1, default: []] = [root.value]
        
        while !queue.isEmpty() {
            let levelSize = queue.arr.count
            
            for _ in 0..<levelSize {
                let (node, level) = queue.front
                print("value \(node.value) Level \(level)")
                
                _ = queue.pop()
                
                if node.left != nil {
                    queue.push((node.left!, level + 1))
                    dict[level + 1, default: []] += [node.left!.value]
                }
                
                if node.right != nil {
                    queue.push((node.right!, level + 1))
                    dict[level + 1, default: []] += [node.right!.value]
                }
            }
        }
        
        print(dict)
        var maxSum = Int.min
        var maxKey = 0
        for (key, value) in dict {
            let sum = value.reduce(0, +)
            if sum > maxSum {
                maxSum = sum
                maxKey = key
            }
        }
        
        let result = dict
                .mapValues { $0.reduce(0, +) }
                .max { $0.value < $1.value }

        print(result?.key)
        
        return maxKey
    }
    
    
    func zigZgLevelTraversal(_ root: Tree?)  -> [[Int]] {
        guard let root else { return [] }
        var result = [[Int]]()
        
        var queue: Queue<(Tree, Int)> = Queue<(Tree, Int)>()
        queue.push((root, 1))
        
        while !queue.isEmpty() {
            let levelSize = queue.arr.count
            let level = queue.front.1
            
            var currentLevel = [Int]()
            for _ in 0..<levelSize {
                let (node, level) = queue.front
                
                _ = queue.pop()
                
                currentLevel.append(node.value)
                
                if let left = node.left {
                    queue.push((left, level + 1))
                }
                
                if let right = node.right {
                    queue.push((right, level + 1))
                }
            }
            
            if level.isMultiple(of: 2) {
                currentLevel.reverse()
            }
            
            result.append(currentLevel)
        }
        
        return result
    }
    
    func rightSideTree(_ root: Tree?) -> [Int] {
        guard let root else { return [] }
        
        var result = [Int]()
        
        var queue: Queue<Tree> = Queue<Tree>()
        queue.push(root)
        
        while !queue.isEmpty() {
            var levelSize = queue.arr.count
            var lastNodeValue: Int?
            
            for index in 0..<levelSize {
                let node = queue.front
                
                _ = queue.pop()
                
                lastNodeValue = node.value
                
                if node.left != nil {
                    queue.push(node.left!)
                }
                
                if node.right != nil {
                    queue.push(node.right!)
                }
            }
            
            if let lastNodeValue {
                result.append(lastNodeValue)
            }
        }
        return result
    }
    
}

struct Queue<T> {
    var arr: [T] = []
    
    mutating func push(_ element: T){
        arr.append(element)
    }
    
    mutating func pop() -> T?{
        return arr.removeFirst()
    }
    
    var front: T {
        return arr.first!
    }
    
    var rear: T {
        return arr.last!
    }
    
    func isEmpty() -> Bool {
        return arr.isEmpty
    }
}

print("\n\n--- Practice space ---")
let levelTree = Tree(value: 1)
levelTree.left = Tree(value: 2)
levelTree.right = Tree(value: 3)
levelTree.right?.left = Tree(value: 5)
levelTree.right?.right = Tree(value: 4)

// LeverlOrderTraversalT().levelOrder(levelTree)

let maxLevel = LeverlOrderTraversalT().maxLevelOrderSum(levelTree)
print(maxLevel)

let zigzagLevel = LeverlOrderTraversalT().zigZgLevelTraversal(levelTree)
print(zigzagLevel)

print("\n\n --- right Side Tree ---")
let rightSideTree = LeverlOrderTraversalT().rightSideTree(levelTree)
print(rightSideTree)


class AverageSubTree {
    func averageTree(_ root: Tree?) -> Int {
        var result = 0
        
        func postOrderTraversal(_ root: Tree?, count: inout Int) -> (Int, Int) {
            guard let root else { return (0,0) }
            
            let (leftSum, leftCount) = postOrderTraversal(root.left, count: &count)
            let (rightSum, rightCount) = postOrderTraversal(root.right, count: &count)
            
            let totalSum = leftSum + rightSum + root.value
            let toatlCount = leftCount + rightCount + 1
            
            let average = totalSum / toatlCount
            
            if root.value == average {
                count += 1
            }
            
            return (totalSum, toatlCount)
        }
        
        _ = postOrderTraversal(root, count: &result)
        
        return result
    }
}

let avergaTree = Tree(value: 4)
avergaTree.left = Tree(value: 8)
avergaTree.right = Tree(value: 5)
avergaTree.left?.left = Tree(value: 0)
avergaTree.left?.right = Tree(value: 1)
avergaTree.right?.right = Tree(value: 6)
let averageCount = AverageSubTree().averageTree(avergaTree)
print(averageCount)

class SumtoLeaf {
    
    public func sumToLeaf(_ root: Tree?) -> Int {
        guard let root else { return -1 }
        
        func sumToLeafHelper(_ root: Tree?, _ sum :Int) -> Int {
            guard let root else { return sum }
            
            let newSum = sum * 10 + root.value
            
            if root.left == nil && root.right == nil {
                return newSum
            }
            
            let leftSum = sumToLeafHelper(root.left, newSum)
            let rightSum = sumToLeafHelper(root.right, newSum)
            
            return leftSum + rightSum
        }
        
        let sum = sumToLeafHelper(root, 0)
        
        return sum
    }
}

print("\n--- Sum to Leaf Result ---")
let sumToLeafTree = Tree(value: 1)
sumToLeafTree.left = Tree(value: 2)
sumToLeafTree.right = Tree(value: 3)

let sumToLeaftResult = SumtoLeaf().sumToLeaf(sumToLeafTree)
print(sumToLeaftResult)

func diameter(_ root: Tree?) -> Int {
    var diameter = 0
    
    func height(_ root: Tree?) -> Int {
        guard let root else { return 0 }
        
        let leftHeight = height(root.left)
        let rightHeight = height(root.right)
        
        diameter = max(diameter, leftHeight + rightHeight)
        
        return max(leftHeight, rightHeight) + 1
    }
    
    _ = height(root)
    
    return diameter
}

print("\n--- Diameter of Tree Result ---")
print(diameter(sumToLeafTree))


func flatten(_ root: Tree?) {
    var lastProcessed: Tree?
    
    func flattenHelper(_ node: Tree?) {
        guard let node else { return  }
        
        flattenHelper(node.right)
        flattenHelper(node.left)
        
        node.right = lastProcessed
        node.left = nil
        lastProcessed = node
    }
    
    flattenHelper(root)
}

func searchInSortedArray(_ nums: [Int], _ target: Int)  -> Int {
   // guard nums.count > 0 else { return -1 }
    
    var left: Int = 0
    var right = nums.count - 1
    
    while left <= right {
        let mid = (left + right) / 2
        
        if nums[mid] == target {
            return mid
        }
        
        if nums[left] <= nums[mid] {
            if nums[left] <= target && target < nums[mid] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        } else {
            if nums[mid] < target && target <= nums[right] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
    }
    
    return -1
}

print(searchInSortedArray([5, 6, 7, 8, 9], 5))


// Input: s = "deeedbbcccbdaa", k = 3

func removeAdjacentDuplicates(_ s: String, _ k: Int) -> String {
    var result = ""
    
    var stack = [(Character, Int)]()
    var sArray = Array(s)
    
    for element in sArray {
        if let lastElement = stack.last, lastElement.0 == element {
            stack[stack.count - 1].1 += 1
            if stack[stack.count - 1].1 == k {
                _ = stack.popLast()
            }
        } else {
            stack.append((element, 1))
        }
    }
    
    print(stack)
    
    for elment in stack {
        result.append(String(repeating: elment.0, count: elment.1))
    }
    
    return result
}

print(removeAdjacentDuplicates("deeedbbcccbdaa", 3))

func insertInterval(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    
    var _intervals = intervals
    _intervals.append(newInterval)
    
    // sort the intervals
    let sortedIntervals = _intervals.sorted { $0[0] < $1[0] }
    
    print(sortedIntervals)
    var output: [[Int]] = [sortedIntervals[0]]
    
    for element in sortedIntervals.dropFirst() {
        var start = element[0]
        var end = element[1]
        var lastEnd = output.last![1]
    
        if start <= lastEnd {
          output[output.count - 1][1] = max(end, lastEnd)
        } else {
            output.append(element)
        }
    }
    
    return output
}

let insertIntervalOutput = insertInterval([[1,3], [6,9]], [2,5])
print(insertIntervalOutput)


func largestNumber(_ input: String) -> String {
    let strNums = input.map { String($0) }
    
    let sortedNumbers = strNums.sorted {
        $0 + $1 > $1 + $0
    }
    
    print(sortedNumbers)
    
    let result = sortedNumbers.joined()
    
    return result.first == "0" ? "0" : result
}

print(largestNumber("123456"))


// class VOrderTraversal {
    func verticalOrderTraversak(_ root: Tree?) -> [[Int]] {
        var result = [[Int]]()
        guard let root else { return [] }
        
        // adopt BFS to go over each of the Level aling with x and Y co-ordinates
        var queue: Queue<(Tree, Int, Int)> = Queue<(Tree, Int, Int)>()
        queue.push((root, 0, 0))
        
        // have dictionary to keep track of [ X: [(y: nodevalue)]]
        var dict:[Int: [(Int, Int)]] = [:]
        dict[0, default: []] += [(0, root.value)]
        
        while !queue.isEmpty() {
            let levelSize = queue.arr.count
            
            for _ in 0..<levelSize {
                let (node, x, y) = queue.front
                
                _ = queue.pop()
                
                if let left = node.left {
                    queue.push((left, x-1, y+1))
                    dict[x-1, default: []] += [(y+1, left.value)]
                }
                
                if let right = node.right {
                    queue.push((right, x+1, y+1))
                    dict[x+1, default: []] += [(y+1, right.value)]
                }
            }
        }
        
        
        let sortedDict = dict.sorted { $0.key < $1.key }
        for (key, value) in sortedDict {
            result.append(value.map { $0.1 } )
        }
        
        return result
    }
//}

let sampleTree = Tree(value: 1)
sampleTree.left = Tree(value: 2)
sampleTree.right = Tree(value: 3)
sampleTree.left?.left = Tree(value: 4)

print(verticalOrderTraversak(sampleTree))

print("\n -- Employee Free Time ---")
let schedule = [
    [(start: 1, end: 2), (start: 5, end: 6)],
    [(start: 1, end: 3)],
    [(start: 4, end: 10)]
]

func employeeFreeTime(_ schedule: [[(start: Int, end: Int)]]) -> [(start: Int, end: Int)] {
    var allIntervals = [(start: Int, end: Int)]()
    
    for intervals in schedule {
        allIntervals.append(contentsOf: intervals)
    }
    
    // sort the intervals based on teh start time.
    allIntervals.sort { $0.start < $1.start || ($0.start == $1.start && $0.end < $1.end )}
    
    
    print("allIntervals \(allIntervals)")
    
    var merged = [(start: Int, end: Int)]()
    merged.append(allIntervals[0])
    
    for schedule in allIntervals[1...] {
        let start = schedule.start
        let end = schedule.end
        let lastEnd = merged.last?.end ?? 0
        
        if start <= lastEnd {
            // There is an overlap; extend the end of the last interval
            merged[merged.count - 1].end = max(lastEnd, end)
        } else {
            // No overlap; add current interval to merged list
            merged.append(schedule)
        }
    }
    
    print("Merged \(merged)")
    
    var freeTime = [(start: Int, end: Int)]()
    
    for index in 1..<merged.count {
        let prev = merged[index - 1]
        let current = merged[index]
        
        if prev.end < current.start {
            // The gap between the end of prev and start of curr is a free time interval
            freeTime.append((start: prev.end, end: current.start)) // just like (2,3) (4,6)
        }
    }
    
    
    return freeTime
}

print(employeeFreeTime(schedule))


func KthLargetsElement(_ nums: [Int], _ k : Int) -> Int {
    var minHeap = [Int]()
    
    for num in nums {
        minHeap.append(num)
        minHeap.sort()
        
        if minHeap.count > k {
            minHeap.removeFirst()
        }
    }
    
    return minHeap.first ?? 0
}

print(KthLargetsElement([1,2,3,4], 2))
