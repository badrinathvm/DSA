//: [Previous](@previous)

import Foundation

// Define marker types to represent different states
enum Loading {}
enum Success {}
enum Failure {}

// Generic `Request` type with a phantom type `State`
struct Request<State> {
    let data: Data?
    let error: Error?
    
    // Private initializer to control instances only through factory methods
    private init(data: Data? = nil, error: Error? = nil) {
        self.data = data
        self.error = error
    }
    
    // Factory method to create a loading request
    static func loading() -> Request<Loading> {
        return Request<Loading>()
    }
    
    // Factory method to create a success request
    static func success(data: Data) -> Request<Success> {
        return Request<Success>(data: data)
    }
    
    // Factory method to create a failure request
    static func failure(error: Error) -> Request<Failure> {
        return Request<Failure>(error: error)
    }
}

// Usage Example
let loadingRequest: Request<Loading> = Request.loading() // Creates a `Request<Loading>`
let successRequest: Request<Success> = Request.success(data: Data()) // Creates a `Request<Success>`
let failureRequest: Request<Failure> = Request.failure(error: NSError(domain: "Network", code: 404, userInfo: nil)) // Creates a `Request<Failure>`
