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
