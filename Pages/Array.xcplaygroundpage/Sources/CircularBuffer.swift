//
//  CircularBuffer.swift
//  
//
//  Created by Rani Badri on 12/3/24.
//


import Foundation

public class CircularBuffer<T> {
    private var buffer: [T?]
    private let capacity: Int
    private var head = 0
    private var tail = 0
    private var size = 0
    private let lock = NSLock()
    
    public init(capacity: Int) {
        self.capacity = max(1, capacity) // Ensure capacity is at least 1
        self.buffer = Array(repeating: nil, count: capacity)
    }
    
    public func enqueue(_ value: T) {
        lock.lock()
        defer { lock.unlock() }
        
        if isFull() {
            // Overwrite the oldest value if the buffer is full
            head = (head + 1) % capacity
        } else {
            size += 1
        }
        
        buffer[tail] = value
        tail = (tail + 1) % capacity
    }
    
    public func dequeue() -> T? {
        lock.lock()
        defer { lock.unlock() }
        
        guard !isEmpty() else { return nil }
        
        let value = buffer[head]
        buffer[head] = nil
        head = (head + 1) % capacity
        size -= 1
        return value
    }
    
    public func first() -> T? {
        lock.lock()
        defer { lock.unlock() }
        return buffer[head]
    }
    
    public func isEmpty() -> Bool {
        lock.lock()
        defer { lock.unlock() }
        return size == 0
    }
    
    public func isFull() -> Bool {
        lock.lock()
        defer { lock.unlock() }
        return size == capacity
    }
}
