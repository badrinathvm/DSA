//: [Previous](@previous)

import Foundation

/*
  Prefix Sum - find the sum of elements in the specific range
  This method is efficient for sum queries on sub arrays
   use the formula = P[j] - P[i-1]
 */
class SumOfElementsInSpecificRange {
    static func sumOfElements(arr: [Int], range: [Int]) -> Int {
        var resultArray = [Int]()
        resultArray.append(arr[0])
        var temp = arr[0]
        for index in 0..<arr.count - 1 {
            temp = temp + arr[index + 1]
            resultArray.append(temp)
        }
        print("Prefix Sum array :: \(resultArray)")
        //return resultArray[1..<3].reduce(0, +)
        
        let j = range[1]
        let i = range[0]
        let formula = resultArray[j] - resultArray[i - 1]
        return formula
    }
}

let result = SumOfElementsInSpecificRange.sumOfElements(arr: [1,2,3,4,5,6], range: [1,3])
print("sum of elements in specific range:\(result)")


let subArrayCount = SubArraySum().subArraySum(arr: [1,2,3], k: 3)
print(subArrayCount)
