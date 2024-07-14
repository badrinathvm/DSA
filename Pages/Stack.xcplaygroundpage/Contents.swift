//: [Previous](@previous)

class ValidParenthesis {
    
    static func isValid(string: String) -> Bool {
        let openingBrackets = "({[", closingBrackets = ")}]"
        let matchingDictinary:[Character: Character] = ["}":"{", "]":"[", ")": "("]
        var stack = [Character]()
        for bracket in string {
            switch bracket {
            case _ where openingBrackets.contains(bracket):
                stack.append(bracket)
            case _ where closingBrackets.contains(bracket):
                if stack.count == 0 { return false }
                if let lastElement = stack.last, lastElement == matchingDictinary[bracket] {
                    _ = stack.popLast()
                } else {
                    return false
                }
            default:
                break
            }
        }
        return stack.count == 0
    }
}

let result = ValidParenthesis.isValid(string: "(]")
print(result)

class RemoveAdjacentDuplicates {
    static func removeDuplicates(_ s: String, _ k: Int) -> String {
        var stack = [(Character, Int)]()
        for element in s {
            if let lastElement = stack.last, lastElement.0 == element {
                //increment the count of the top
                stack[stack.count - 1].1 += 1
                
                // the count reaches k, pop the element from the stack
                if stack[stack.count - 1].1 == k {
                    stack.removeLast()
                }
            } else {
                // push the current element on to stack with a count 1
                stack.append((element, 1))
            }
        }
        
        var result = ""
        for (char, count) in stack {
            result.append(String(repeating: char, count: count))
        }
        print(result)
        return result
    }
}

RemoveAdjacentDuplicates.removeDuplicates("deeedbbcccbdaa", 3)


//: [Next](@next)
