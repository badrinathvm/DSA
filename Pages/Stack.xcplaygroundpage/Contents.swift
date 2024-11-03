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
let minValidParentheses = MinimmValidParentheses().minimumValidParentheses("a)b(c)d")
print(minValidParentheses)
//print(MinimumValidParenthesis.minimumValidParentheses("(a(b(c)d")) // executes the while case

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
let minStack = MinStack<Int>()
minStack.push(-2)
minStack.push(0)
minStack.push(-3)
print(minStack.getMin()) // Output: -3
minStack.pop()
print(minStack.top)    // Output: 0
print(minStack.getMin()) // Output: -2
