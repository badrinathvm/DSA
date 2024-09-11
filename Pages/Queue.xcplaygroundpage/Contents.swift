//: [Previous](@previous)

import Foundation

print("--- Moving average from data stream ---")
class MovingAverage {
    private var queue: [Int]
    private var maxSize: Int
    private var sum: Int
    
    init(maxSize: Int) {
        self.queue = []
        self.maxSize = maxSize
        self.sum = 0
    }
    
    func next(_ val: Int) {
        queue.append(val)
        sum += val
        
        // if queue exceeds the maximum size, remove the oldest one
        if queue.count > maxSize {
            sum -= queue.removeFirst()
        }
        
        //calculate the average
        return Double(sum) / Double(queue.count)
    }
}

let movingAverage = MovingAverage(3)
print(movingAverage.next(1)) // Output: 1.0
print(movingAverage.next(10)) // Output: 5.5
print(movingAverage.next(3)) // Output: 4.67
print(movingAverage.next(5)) // Output: 6.0
