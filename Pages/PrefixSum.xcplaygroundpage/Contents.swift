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


class SubArrayEqualsK {
    // Note: Mskr use of dictionry concepy ( sum - target)
    static func subArraySum(arr: [Int], k: Int) -> Int {
        var count = 0
        var cumulativeSum = 0
        var sumFrequency = [0: 1] // Dictionary to store cumulative sum frequencies, starting with 0 sum having 1 count
        
        for num in arr {
            cumulativeSum += num
            
            print(cumulativeSum)
            // Check if there is a previous cumulative sum that satisfies the condition
            if let frequency = sumFrequency[cumulativeSum - k] {
                count += frequency
            }
            
            // Update the frequency of the current cumulative sum
            sumFrequency[cumulativeSum, default: 0] += 1
            
            print(sumFrequency)
        }
        
        return count
    }
}

let count = SubArrayEqualsK.subArraySum(arr: [1,1,1], k: 2)
