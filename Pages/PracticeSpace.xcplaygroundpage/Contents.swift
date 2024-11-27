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

// arr = [2,3,7,9] target = 7
func combinationSet(_ arr: [Int], _ target: Int) -> [[Int]] {
    var result = [[Int]]()
    var combination = [Int]()
    
    func backtrack(_ currentSum: Int, _ start: Int) {
        if currentSum == target {
            result.append(combination)
            return
        }
        
        for index in start..<arr.count {
            let candidate = arr[index]
            let newSum = currentSum + candidate
            
            if newSum <= target {
                combination.append(arr[index])
                backtrack(newSum, index)
                combination.removeLast()
            }
        }
    }
    
    backtrack(0, 0)
    return result
}

print(combinationSet([2,3,6,7], 7))

// Input: [2.1, 2.5, 3.4, 4.2, 5.1, 3.8, 2.9, 1.8, 0.5], withDifference: 1.0

func longestSubSequence(with limit: Double, array: [Double]) -> [Double] {
    var longestSequence = [Double]()
    var currentSequence = [array[0]]
    
    for index in 1..<array.count {
        let difference = abs(array[index] - array[index-1])
        
        if difference <= limit {
            currentSequence.append(array[index])
        } else {
            if currentSequence.count > longestSequence.count {
                longestSequence = currentSequence
            }
            currentSequence = [array[index]]
        }
    }
    
    if currentSequence.count > longestSequence.count {
        longestSequence = currentSequence
    }
    
    return longestSequence
}

print(longestSubSequence(with: 1.0, array: [2.1, 2.5, 3.4, 4.2, 5.1, 3.8, 2.9, 1.8, 0.5]))

var matrix = [
    ["1", "0", "1", "0", "0"],
    ["1", "0", "1", "1", "1"],
    ["1", "1", "1", "1", "1"],
    ["1", "0", "0", "1", "0"]
  ]

func largestRectangle(_ heights: [Int]) -> Int {
    var maxArea = 0
    var stack = [Int]()
    var heights = heights + [0] // for sential
    for i in 0..<heights.count {
        while let last = stack.last, heights[i] < heights[last]  {
            let height = heights[stack.removeLast()]
            let width = stack.isEmpty ? i : i - stack.last! - 1
            maxArea = max(maxArea, height * width)
        }
        stack.append(i)
    }
    return maxArea
}

func findMaximalSquare(_ matrix: [[String]]) -> Int {
    var maxArea = 0
    let rows = matrix.count, cols = matrix[0].count
    
    var heights = Array(repeating: 0, count: cols)
    
    for row in 0..<rows {
        for col in 0..<cols {
            heights[col] = matrix[row][col] == "1" ? heights[col] + 1 : 0
        }
        
        maxArea = max(maxArea, largestRectangle(heights))
    }
    return maxArea
}


print(findMaximalSquare(matrix))


//Input: target = 7, nums = [2,3,1,2,4,3]
//Output: 2

func minSubArraySize(nums: [Int], target: Int) -> Int {
    var minLength = Int.max
    var currentSum = 0
    var left = 0
    
    for right in 0..<nums.count {
        currentSum += nums[right]
        
        while currentSum >= target {
            minLength = min(minLength, right - left + 1)
            currentSum -= nums[left]
            left += 1
        }
    }
    
    return minLength == Int.max ? 0 : minLength
}

print(minSubArraySize(nums: [2,3,1,2,4,3], target: 8))


// Input: arr = [1,2,3,4,5], k = 4, x = 3

func findKClosetElements(arr: [Int], k: Int, x: Int) -> [Int] {
    var left = 0
    var right = arr.count - k
    
    while left < right {
        var mid = (left + right) / 2
        
        if x - arr[mid] > arr[mid + k] - x {
            left = mid + 1
        } else {
            right = mid
        }
    }
    
    return Array(arr[left..<left+k])
}

findKClosetElements(arr: [1,2,3,4,5], k: 4, x: 3)


func numberOFSubStringsAllCharacters(_ s: String) -> Int {
    let chars = Array(s)
    var result = 0
    var left = 0
    
    var count = [0,0,0]
    
    for right in 0..<chars.count {
        count[Int(chars[right].asciiValue! - Character("a").asciiValue!)] += 1
        
        while count[0] > 0 && count[1] > 0 && count[2] > 0  {
            result += (s.count - right)
            
            //shrink the window
            count[Int(chars[left].asciiValue! - Character("a").asciiValue!)] -= 1
            left += 1
        }
    }
    
    return result
}

print(numberOFSubStringsAllCharacters("abcabc"))

/*
   perform Post order traversal
   1 : node has camera
   0 : No camera
   2: Node is covered by camera
 */

func treeCamera(_ root: Tree?) -> Int {
    var cameraCount = 0
    
    func dfs(_ node: Tree?) -> Int {
        if node == nil {
            return 2
        }
        
        let left = dfs(node?.left)
        let right = dfs(node?.right)
        
        if left == 0 || right == 0 {
            cameraCount += 1
            return 1
        }
        
        // if either of the child has camera, then return 2
        if left == 1 || right == 1 {
            return 2
        }
        
        return 0
    }
    
    if dfs(root) == 0 {
        cameraCount += 1
    }
    
    return cameraCount
}

print("\n-- Binary tree Camera --")
let treeCamera = Tree(value: 0)
treeCamera.right = Tree(value: 0)
treeCamera.right?.right = Tree(value: 0)
let cameraCount = treeCamera(treeCamera)
print(cameraCount)


//Input:
// "abcdef", ["ab", "abc", "cd", "def", "abcd"]
//
//Output:
//  true

func canConstruct(_ target: String, _ wordBank: [String]) -> Bool {
    // Momization Dictionary
    var memo: [String: Bool] = [:]
    
    func canConsructHelper(_ target: String) -> Bool {
        // Base case: if the target is an empty string, it can be constructed by default
        if target.isEmpty { return true }
        
        if let result = memo[target] { return result }
        
        for word in wordBank {
            if target.hasPrefix(word) {
                let suffix = String(target.dropFirst(word.count))
                
                if canConsructHelper(suffix) {
                    memo[target] = true
                    return true
                }
            }
        }
        
        memo[target] = false
        return false 
    }
    
    let result = canConsructHelper(target)
    return result
}

print(canConstruct("abcdef", ["ab", "abc", "cd", "def", "abcd"]))


func rangeBST(_ root: Tree?, _ low: Int, _ high: Int) -> Int {
    func rangeBSTHelper(_ root: Tree?) -> Int {
        guard let root else { return 0 }
        var sum = 0
        
        if low < root.value {
            let leftSum = rangeBSTHelper(root.left)
            sum += leftSum
        }
        
        if high > root.value {
            let rightSum = rangeBSTHelper(root.right)
            sum += rightSum
        }
        
        if root.value >= low && root.value <= high {
            let currentSum = root.value
            sum += currentSum
        }
        
        return sum
    }
    
    let sum = rangeBSTHelper(root)
    
    return sum
}


// Longest Path in the graph

class LongestPath {
    var adj: [Int: [Int]] = [:]
    var memo: [Int : Int] = [:]
    
    // This constructs the graph
    init(edges:[(Int, Int)]) {
        for (src, dest) in edges {
            if adj[src] == nil  {
                adj[src] = []
            }
            
            adj[src]?.append(dest)
        }
    }
    
    func longestPath(from node: Int) -> Int {
        if let longest = memo[node] {
            return longest
        }
        
        var maxLength = 0
        
        if let neighbors = adj[node] {
            for neighbor in neighbors {
                maxLength = max(maxLength, 1 + longestPath(from: neighbor))
            }
        }
        
        // Store result in memo and return it
        memo[node] = maxLength
        return maxLength
    }
    
    public func findLongestPaths() -> [Int: Int] {
        var longestPaths = [Int: Int]()
        
        // Calculate the longest path starting from each node
        for node in adj.keys {
            longestPaths[node] = longestPath(from: node)
        }
        
        return longestPaths
    }
}


let graphEdges = [(1, 2), (1, 3), (2, 4), (3, 4), (4, 5), (5, 6)]

// Create the graph
let graph = LongestPath(edges: graphEdges)

// Find the longest paths starting from each node
let longestPaths = graph.findLongestPaths()
print(longestPaths)
