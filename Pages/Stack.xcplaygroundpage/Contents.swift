//: [Previous](@previous)


print(" --- Valid Parenthesis ---")
let result = ValidParentheses().isValid("()()")
print(result)


print(" --- Remove Adjacent elements in string ---")
let removeAdjacentStringResult = RemoveAllAdjacenDuplicates().removeAdjacentDuplicates("deeedbbcccbdaa", 3)
print(removeAdjacentStringResult)


class EvaluateReversePolyNomial{
    static func evaluateRPN(tokens: [String]) -> Int {
        var stack = [Int]()
        
        for token in tokens {
            if let element = Int(token) {
                stack.append(element)
            } else {
                guard let postNum = stack.popLast(), let preNum = stack.popLast() else {
                    fatalError("Invalid Input")
                }
                let result = operate(operation: token, num1: postNum, num2: preNum)
                stack.append(result)
            }
        }
        guard let last = stack.last else { fatalError("Error") }
        return last
    }
    
    static func operate(operation: String, num1: Int, num2 : Int ) -> Int {
        switch operation {
        case "+": num1 + num2
        case "-": num1 - num2
        case "*": num1 * num2
        case "/": num1 / num2
        default: fatalError("Invalid operation")
        }
    }
}

EvaluateReversePolyNomial.evaluateRPN(tokens: ["2","1","+","3","*"])

print(" --- Decode String ---")
let decodedStringResult = DecodeString().decodeString("3[a]2[bc]") //aaabcbc
print(decodedStringResult)

print("--- Minimum Remove to Make Valid Parentheses ---")

class MinimumValidParenthesis {
    static func minimumValidParentheses(_ s: String) -> String {
        var sArray = Array(s)
        var stack = [Int]() // to keep track of '(' indices
        var toRemove = Set<Int>()
        
        for (i, char) in sArray.enumerated() {
            if char == "(" {
                stack.append(i)
            } else if char == ")" {
                if !stack.isEmpty {
                    stack.removeLast()
                } else {
                    toRemove.insert(i) //there is no unmatched '(' to match this ')'
                }
            }
        }
        
        // Add any unmatched '(' indices left in the stack to the removal set
        while !stack.isEmpty {
            toRemove.insert(stack.removeLast())
        }
        
        // Build the result string, skipping indices that need to be removed
        var result = ""
        for (i, char) in sArray.enumerated() {
            if !toRemove.contains(i) {
                result.append(char)
            }
        }
        
        return result
        
    }
}

MinimumValidParenthesis.minimumValidParentheses("a)b(c)d")
print(MinimumValidParenthesis.minimumValidParentheses("(a(b(c)d")) // executes the while case

print("--- Stack Implemenetaation ---")



var stack = Stack<Int>()
stack.push(10)
stack.push(20)
stack.push(30)

print(stack.top)
let _ = stack.pop()
print(stack.top)
stack.disp()

print("--- Min Stack Implementation ---")
// Time Complexity - O(1)
class MinStack {
    private var stack: [Int]
    private var minStack: [Int]
    
    init() {
        stack = []
        minStack = []
    }
    
    func push(_ element: Int) {
        stack.append(element)
        
        if minStack.isEmpty || element <= minStack.last! {
            minStack.append(element)
        }
    }
    
    func pop() {
        if stack.last == minStack.last {
            minStack.removeLast()
        }
        stack.removeLast()
    }
    
    var top: Int {
        guard let element = stack.last else { return -1 }
        return element
    }
    
    func getMin() -> Int {
        return minStack.last!
    }
}

let minStack = MinStack()
minStack.push(-2)
minStack.push(0)
minStack.push(-3)
print(minStack.getMin()) // Output: -3
minStack.pop()
print(minStack.top)    // Output: 0
print(minStack.getMin()) // Output: -2
