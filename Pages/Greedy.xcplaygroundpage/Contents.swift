//: [Previous](@previous)

import Foundation

// Leetcode 134 : https://leetcode.com/problems/gas-station/
class GasStation {
    static func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        // Check if the total gas is less than the total cost
        if gas.reduce(0, +) < cost.reduce(0, +) {
            return -1
        }

        var total = 0
        var res = 0

        for i in 0..<gas.count {
            total += gas[i] - cost[i]

            // If total becomes negative, reset total and update the starting index
            if total < 0 {
                total = 0
                res = i + 1
            }
        }

        return res
    }
}

var gas = [1,2,3,4,5]
var cost = [3,4,5,1,2]
GasStation.canCompleteCircuit(gas, cost)

/*
 
 Input: gas = [1,2,3,4,5], cost = [3,4,5,1,2]
 Output: 3
 
 Explanation:
 Start at station 3 (index 3) and fill up with 4 unit of gas. Your tank = 0 + 4 = 4
 Travel to station 4. Your tank = 4 - 1 + 5 = 8
 Travel to station 0. Your tank = 8 - 2 + 1 = 7
 Travel to station 1. Your tank = 7 - 3 + 2 = 6
 Travel to station 2. Your tank = 6 - 4 + 3 = 5
 Travel to station 3. The cost is 5. Your gas is just enough to travel back to station 3.
 Therefore, return 3 as the starting index.
 
 
 
 */
