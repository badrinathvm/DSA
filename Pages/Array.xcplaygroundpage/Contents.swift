import UIKit

print("--- Two Sum Result ---")
let twoSumResult = TwoSum().twoSum(nums: [2,7,11,15], target: 9)
print(twoSumResult)


class Merge {
    static func merge(_ nums1: [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        let temp1 = nums1[0..<m]
        let temp2 = nums2[0..<n]
        let mergedArray = Array(temp1) + Array(temp2)
        print(mergedArray.sorted(by: <))
    }
}

//Merge.merge([1,2,3,0,0,0], 3, [2,5,6], 3)
//Merge.merge([1], 1, [], 0)
Merge.merge([0], 0, [1], 1)

print(" --- Move Zeros to End ---")
let moveZerosToEndResult = MoveZerosToEnd().moveZerosToEnd(input: [0,1,0,3,12])
print(moveZerosToEndResult)

let zigZgArrayInput = [4, 3, 7, 8, 6, 2, 1]
let zigZgArrayResult = ZigZag().convert(zigZgArrayInput)
print(zigZgArrayResult)

print(" --- Travsere Matrix in Spiral Order ---")
let matrixInput = [[1,2,3],[4,5,6],[7,8,9]]
let spiralResult =  MatrixSpiralOrder().spiralOrder(matrixInput)
print(spiralResult)

print(" --- Rotate Matrix ---")
var matrix1 = [[1,2,3],[4,5,6],[7,8,9]]
let rotateMatrixResult = MatrixRotate().matrixRotate(matrix1)
print(rotateMatrixResult)

class RemoveElement {
    static func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums = nums.filter { $0 != val }
        return nums.count
    }
}

// RemoveElement.removeElement([3,2,2,3], 3)
var nums = [0,1,2,2,3,0,4,2]
RemoveElement.removeElement(&nums, 2)

class CountNumberOfTeams {
    
    static func numberOfTeams(_ rating: [Int]) -> Int {
        // A team is valid if (rating[i] < rating[j] < rating [k])
        // or (rating[i] >rating[j]> rating[k])
        var n = rating.count
        var count = 0
        for i in 0..<n {
            for j in (i+1)..<n {
                for k in (j+1)..<n {
                    if (rating[i] < rating[j] && rating[j] < rating[k]) || (rating[i] > rating[j] && rating[j] > rating[k]) {
                        count += 1
                    }
                }
            }
        }
        return count
        
//        let n = rating.count
//        let pairs = (0..<n).flatMap { i in
//                (i+1..<n).flatMap { j in
//                    (j+1..<n).filter { k in
//                        (rating[i] < rating[j] && rating[j] < rating[k]) || (rating[i] > rating[j] && rating[j] > rating[k])
//                    }
//                }
//            }
//        print("Pairs \(pairs)")
//        return pairs.count
    }
}

CountNumberOfTeams.numberOfTeams([2,5,3,4,1])


//Minimum Punches
// Leetcode Question : https://leetcode.com/problems/minimum-number-of-pushes-to-type-word-ii/
class MinimumPunches {
    static func minimumPunches(_ word: String) -> Int {
        // Initilaze the arry with 0 for 26 alphabets
        var counts = Array(repeating: 0, count: 26)
        
        // in order to construct array from 0 to 25 ( counting the frequency of each of the lower case character
        for c in word {
            // get the ascii value of the character 'c'
            // 'Character("a").asciiValue!' gets the ASCII value of 'a' (which is 97)
            // Subtracting this value from 'asciiValue' gives a zero-based index:
            // 'a' -> 0, 'b' -> 1, ..., 'z' -> 25
            if let asciiValue = c.asciiValue {
                counts[Int(asciiValue) - Int(Character("a").asciiValue!)] += 1
            }
        }
        
        var res = 0
        var distinct = 0
        
        // why 8 ? because key pad 1 wont have any character
        for cnt in counts {
            // till 8 characaters it only single key press
            // after 8 till 15 it rquires 2 key press
            // from 15 till 25 it requires 3 key press that is teh formula below.
            res += cnt * ( 1 + distinct / 8 )
            // because as we going through each count we need to disctinct to be updated.
            // to handle the logic in batches.
            distinct += 1
        }
        
        return res
    }
}


print(MinimumPunches.minimumPunches("abc"))

print(" --- Sort Colors ---")
let colors = [2,0,2,1,1,0]
let sortColorsResult = SortColors().sortColors(colors)
print(sortColorsResult)


var intervals = [[1,3],[8,10],[15,18],[2,6]]
let mergeIntervalResult = MergeInterval.merge(intervals)
print("Merge Interval:\(mergeIntervalResult)")

let insertIntervals = [[1,3],[6,9]], newInterval = [2,5]
let insertIntervalResult = InsertInterval.insert(insertIntervals, newInterval)
print("Insert Interval:\(insertIntervalResult)")

let firstList = [[0,2],[5,10],[13,23],[24,25]], secondList = [[1,5],[8,12],[15,24],[25,26]]
let intervalListInteractionResult = IntervalListInteraction.intervalIntersection(firstList, secondList)
print("Interval List Interaction:\(intervalListInteractionResult)")

print(" --- Find Commomom Characters ---")
//FindCommonCharacters.findCommonChars(["bella","labell","roller"])
let commonLetters = FindCommonCharacters().findCommon(["cool","lock","cook"])
print(commonLetters)

// MARK:-

class RemoveDuplicatesFromDortedArray {
    static func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else { return nums.count }
        
        var i = 0
        for j in 1..<nums.count {
            if nums[i] != nums[j] {
                i += 1
                nums[i] = nums[j]
            }
        }
        
        return i + 1
        
        // functinal programmign approach
//        nums = nums.reduce(into: [], { partialResult, element in
//            if partialResult.last != element {
//                partialResult.append(element)
//            }
//        })
//        
//        return nums.count
    }
 }

var array = [0,0,1,1,1,2,2,3,3,4]
let count = RemoveDuplicatesFromDortedArray.removeDuplicates(&array)
print(count)

class UniqueNumberOfOccurrences {
    static func uniqueOccurrences(_ arr: [Int]) -> Bool {
        let uniqueArray = arr.reduce(into: [:]) { partialDict, element in
            partialDict[element, default: 0] += 1
        }.map { $0.1 }
        
        return hasUniqueElements(uniqueArray)
    }
    
    static func hasUniqueElements<T:Hashable>(_ array: [T]) -> Bool {
        array.count == Set(array).count
    }
}

let uniqElementstatus = UniqueNumberOfOccurrences.uniqueOccurrences([1,2,2,1,1,3])
print(uniqElementstatus)

print("----  Squares of Sorted Array -----")
class SquareSortedArray {
    static func squareSortedArray(_ nums: [Int]) -> [Int] {
        let squareNumsArray = nums.map{ $0 * $0 }.sorted(by: <)
        return squareNumsArray
    }
}

let squareNumsArray = SquareSortedArray.squareSortedArray([-4,-1,0,3,10])
print(squareNumsArray)

print("----  Intersection of two arrays -----")
class IntersectionTwoArrays {
    static func intersection(nums1: [Int], nums2: [Int]) -> [Int] {
        let set1 = Set(nums1)
        let set2 = Set(nums2)
        return Array(set1.intersection(set2))
    }
    
    static func intersection_1(nums1: [Int], nums2: [Int]) -> [Int] {
       var result = [Int]()
        for i in nums1 {
            for j in nums2 {
                if i == j && !result.contains(i) {
                    result.append(i)
                }
            }
        }
        return result
    }
}

let intersectionResult = IntersectionTwoArrays.intersection_1(nums1: [4,9], nums2: [9,4,9,8,4])
print(intersectionResult)

class GroupAnagrams {
    //Time Complexity - O(N∗K∗Log(K))
    static func groupAnagrams(_ strs: [String]) -> [[String]] {
        guard strs.count > 0 else { return [[""]] }
        
        let result = strs.reduce(into: [String: [String]]()) { dict, element in
            dict[String(element.sorted()), default: []] += [element]
        }
        
        let groupedAnagrams = result.values.map { $0 }
        return groupedAnagrams
    }
}

var groupedAnagrams = GroupAnagrams.groupAnagrams(["eat","tea","tan","ate","nat","bat"])
print(groupedAnagrams)

groupedAnagrams = GroupAnagrams.groupAnagrams(["a"])
print(groupedAnagrams)

let rotateArray = RotateArray()
var rotArray = [1,2,3,4,5,6,7]
rotateArray.rotateArray(&rotArray, 3)


let subArraySum = [1,1,1]
let subArrayCount = SubArraySum.subArraySum(subArraySum, 2)
print(subArrayCount)

let subArrayDiv = [4,5,0,-2,-3,1], k = 5
let subArrayDivCount = SubArrayDiv.subArrayDivByK(subArrayDiv, k)
print(subArrayDivCount)

let largestNumInput = [3,30,34,5,9]
let largestNum = LargestNumber.largestNumber(largestNumInput)
print(largestNum)

print(" --- Pascal Triangle ---")
let pascalTriangleOuput = PascalTriangle().pascalTriangle(rows: 5)
print(pascalTriangleOuput)

print(" -- Minimum Abs Difference --")
var minAbsDiff = MiniminAbsDifference().minimumAbsDifference([4,2,1,3])
print(minAbsDiff)

// using functional programming approach
let minAbsDiff2 = MiniminAbsDifference().minimumAbsDifference2([4,2,1,3])
print(minAbsDiff2)


print(" --- Majority Element --")
let majorityElement = MajorityElement().majorityElement([5,5,5,2,3])
print(majorityElement)

print(" --- Sum of Diagonal --")
let diagonalArr = [
    [ 1,  2,  3 ],
    [ 5,  6,  7 ],
    [ 9, 10, 11 ],
  ]
let sumDiagonals = SumOfDiagonals().sumDiagonals(arr: diagonalArr)
print(sumDiagonals)

print(" --- Sort Array By Parity ---")
let parityArrayResult = SortArrayByParity().sortArrayByParity([3,1,2,4])
print(parityArrayResult)

print("\n -- K th Largest Element ---")
let kthLargestElement = KthLargestElement().findKthLargetsElement([1,2,3,4,5], 2)
print(kthLargestElement)

print("\n --- Maximum Consecutive Ones ---")
let maxConsecutiveOnes = MaximumConsecutiveOnes().maxConsecutiveOnes([1,1,0,1,1,1])
print(maxConsecutiveOnes)




func findCommonFreeTime(_ timeslots: [[(Int, Int)]]) -> [(Int, Int)] {
    guard !timeslots.isEmpty else { return [] }
    
    // Merge all timeslots into one array and sort by start time.
    let mergedSlots = timeslots.flatMap { $0 }.sorted { $0.0 < $1.0 }
    
    var result = [(Int, Int)]()
    var currentStart = mergedSlots[0].0
    var currentEnd = mergedSlots[0].1
    
    for slot in mergedSlots.dropFirst() {
        let start = slot.0
        let end = slot.1
        
        if start <= currentEnd {
            // Overlapping intervals, merge them
            currentEnd = max(currentEnd, end)
        } else {
            // Non-overlapping interval, add the previous interval to result
            result.append((currentStart, currentEnd))
            currentStart = start
            currentEnd = end
        }
    }
    
    // Add the last interval
    result.append((currentStart, currentEnd))
    
    return result
}

// Example usage:
print("\n -- Employee Free Time ---")
let schedule = [
    [(start: 1, end: 2), (start: 5, end: 6)],
    [(start: 1, end: 3)],
    [(start: 4, end: 10)]
]

let commonFreeTime = EmployeeFreeTime().employeeFreeTime(schedule: schedule)
print(commonFreeTime)

print("\n --- Valid Abbrevation --")
let validAbbrevation = ValidWordAbbrevation().validWordAbbreviation("internationalization", "i12iz4n")
print(validAbbrevation)

