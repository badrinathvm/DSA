//: [Previous](@previous)

import Foundation

// Define Protocols
protocol Observer: AnyObject {
    func update(value: Int)
}

//
protocol Observerable {
    func add(observer: Observer)
    func remove(observer: Observer)
}

// Implementation of Observabel
class Sensor: Observerable {
    private var observers =  [Observer]()
    private var value: Int = 0 {
        didSet {
            notifyObservers()
        }
    }
    
    func add(observer: Observer) {
        observers.append(observer)
    }
    
    func remove(observer: Observer) {
        if let index = getObserverIndex(observer) {
            self.observers.remove(at: index)
        }
    }
    
    // Method to get the index of an observer in the observers array
    private func getObserverIndex(_ observer: Observer) -> Int? {
        return observers.firstIndex { $0 === observer }
    }
    
    func notifyObservers(){
        print("Sensor - Notifying Observers")
        for observer in observers {
            observer.update(value: value)
        }
    }
    
    func setSensor(to value: Int) {
        self.value = value
    }
}

// Example

class DisplayDevice: Observer {
    private let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func update(value: Int) {
        print("DisplayDevice \(id) - Temperature updated to \(value)°C")
    }
}

let sensor = Sensor()
let display1 = DisplayDevice(id: 1)

sensor.add(observer: display1)

sensor.setSensor(to: 20)



