//: [Previous](@previous)


print(" --- Combinations ---")
let combinations = Combinations().combine(4, 2)
print(combinations)

print(" --- Subsets ----")
let subsets = SubSets().subsets([1, 2, 3])
print(subsets)

print(" --- Combination Sums ---")
let combinationSumResult = CombinationSum().combinationSum([2,3,6,7], 7)
print(combinationSumResult)

print(" --- Generate Parentheses ---")
let generateParenthesesResult = GenerateParentheses().generateParentheses(3)
print(generateParenthesesResult)


func prefixSum(nums: [Int]) {
    var result = [Int]()
//    for i in 0..<nums.count {
//        if i == 0 {
//            for j in i+1...nums.count {
//                let sum = nums[i..<j].reduce(0, +)
//                result.append(sum)
//            }
//        }
//    }
//    print(result)
    
    var newResult = [nums[0]]
    
    var prev = nums[0]
    for i in 1..<nums.count {
        prev += nums[i]
        newResult.append(prev)
    }
    print(newResult)
}

prefixSum(nums: [1,2,3,4])
