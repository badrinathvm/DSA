//: [Previous](@previous)

import Foundation
//import Algorithms
import UIKit

// Tip - 1
// The @unknown default case serves as safety net, ensuring that the function remains operational even when new enum cases are added, and prompting a review of the handling code.
//func displayImage(component: Calendar.Component) -> String {
//    switch component {
//    case .day:
//        return "Day"
//    case .month:
//        return "Month"
//    case .year:
//        return "Year"
//    @unknown default:
//        // Log and handle any unexpected case gracefully
//        return "Unknown Component"
//    }
//}

// Overloading the pattern matching operator for custom matching behaviour
// By Overloading the ~= operatorm we can tailor the pattern matching process to suit our custom types.
struct Circle {
    let radius: Double
    
    static func ~= (pattern: Double, value: Circle) -> Bool {
        return value.radius == pattern
    }
    
    static func ~= (pattern: ClosedRange<Double>, value: Circle) -> Bool {
        return pattern.contains(value.radius)
    }
}

func overload() {
    let myCircle = Circle(radius: 11)
    switch myCircle {
    case 5:
        print("Circle with radius 5")
    case 10:
        print("Circle with radius 10")
    case 10...15:
        print("Small Circle with radius between 10 and 15")
    default:
        print("Circle with radius \(myCircle.radius)")
    }
}

overload()

// Tip 2
// Switch on multiple optional values simultaneously
func multipleOptionalValues() {
    let optionalInt1: Int? = 1
    let optionalInt2: Int? = 2

    switch (optionalInt1, optionalInt2) {
    case (.some(let int1), .some(let int2)):
        print("Both integers are \(int1) and \(int2)")
    case (.some(let int1), .none):
        print("Int1 is \(int1)")
    case (.none, .some(let int2)):
        print("Int2 is \(int2)")
    default:
        print("No integers")
    }
}

multipleOptionalValues()

// Tip 3
func optionalUnwrappingShorthand() {
    let bookTitle: String? = "The Swift Programming Language"
    if let bookTitle = bookTitle {
        print("The title of the book is \(bookTitle)")
    }
    
    // shorthand method
    if let bookTitle {
        print("The title of book is \(bookTitle)")
    }
}

optionalUnwrappingShorthand()

// Modify unwrapped optional within the if statement block
func modifyUnwrappedOptionalWithoinIfStatementBlock() {
    let numberString: String = "2"
    if var number = Int(numberString) {
        number *= number
        // Prints `Squared value: 4`
        print("Squared value: \(number)")
    }
}

modifyUnwrappedOptionalWithoinIfStatementBlock()

func useMapForOptional(string: String) -> URLRequest? {
    URL(string: string).map { URLRequest(url: $0) }
}

let result = useMapForOptional(string: "http://www.apple.com")
print(result)

// Execute Loop for non nil elements
func executeLoopForNonNilElements() {
    let numbers: [Int?] = [1, 2, 3, nil, 4, 5]
    
    // 1st way
//    for number in numbers where number != nil {
//        print(number!)
//    }
    
    // 2nd way
    for case let name? in numbers {
        print(name, terminator: ",")
    }
}
executeLoopForNonNilElements()

// Iterate over items and indices in collections
func iterateOverItemsAndIndicesInCollections() {
    let ingredients: [String] = ["eggs", "flour", "sugar"]
    var doubleIngredients = ingredients
    
    // 1st way
    for (i, ingredient) in zip(doubleIngredients.indices, doubleIngredients) {
        doubleIngredients[i] = "\(ingredient) x 2"
    }
    
    print("\n\(doubleIngredients)")
    
//    for (i, ingredient) in doubleIngredients.indexed() {
//        doubleIngredients[i] = "\(ingredient) x 2"
//    })
//    
//    print("\n\(doubleIngredients)")
}

iterateOverItemsAndIndicesInCollections()

// Filter elements within the loop structure using where clause
enum TransportationEvent {
    case busArrival(busNumber: Int, passenger: Int)
    case trainArrival(trainNumber: Int, passenger: Int, cargoLoad: Int)
    case bicycleArrival
}

func filterElementsWithinTheLoopStructureUsingWhereClause() {
    // filter the busArrival events where passenger > 10
    let transportationEvents :[TransportationEvent] = [
        .busArrival(busNumber: 1, passenger: 5),
        .busArrival(busNumber: 2, passenger: 15),
        .trainArrival(trainNumber: 10, passenger: 50, cargoLoad: 100),
        .busArrival(busNumber: 3, passenger: 20),
        .bicycleArrival
    ]
    
    for case let .busArrival(busNumber, passenger) in transportationEvents where passenger > 10 {
        print("Bus \(busNumber) has \(passenger) passengers")
    }
}

filterElementsWithinTheLoopStructureUsingWhereClause()

// Property Observeres
class MyClass {
    var myProperty: String {
        willSet {
            print("Will set myProperty to \(newValue)")
        }
        didSet {
            print("""
            Did set myProperty to \(myProperty), \
            previously \(oldValue)
            """)
        }
    }
    
    // defer block here ensures that the property is set withing the scope of initilization while still triggering willset and disSet observers
    init(value: String) {
        defer {
            myProperty = value
        }
        myProperty = "Initial value"
    }
}

let myObject = MyClass(value: "New value")


// Usage of private(set)

class Account {
    private(set) var balance: Double = 0.0
    
    func deposit(amount: Double) {
        balance += amount
        print("Balance=\(balance)")
    }
    
    func withdraw(amount: Double) -> Bool {
        if amount <= balance {
            balance -= amount
            return true
        }
        return false
    }
}

let account = Account()
account.deposit(amount: 100)
//cannit assign the value
// account.balance = 1000


// Async Property
class UserProfile {
    struct ProfileData {
        let name: String
        let age: Int
    }
    
    var userID: String
    
    init(userID: String) {
        self.userID = userID
    }
    
    //async property
    var profileData: ProfileData? {
        get async {
            return await fetchProfileData()
        }
    }
    
    func fetchProfileData() async -> ProfileData? {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        return .init(name: "John", age: 20)
    }
}

let user = UserProfile(userID: "123456")
Task {
    if let data = await user.profileData {
        print("Name=\(data.name), Age=\(data.age)")
    } else {
        print("Failed to fetch user profile")
    }
}

// Handle mutable static properties in generic types

fileprivate var _gvalues: [ObjectIdentifier: Any] = [:]
struct MyValue<T> {
    // We use ObjectIdentifier(Self.self) to obtain a unique identifier for each type specialization of MyValue<T>. ObjectIdentifier provides a stable and hashable reference to the class, struct, or enum type, allowing us to use it as a key in our dictionary. ”

    static var a: Int {
        get {
            _gvalues[ObjectIdentifier(Self.self)] as? Int ?? 42
        }
        
        set {
            _gvalues[ObjectIdentifier(Self.self)] = newValue
        }
    }
}
MyValue<Int>.a = 100
print(MyValue<Int>.a)

MyValue<String>.a = 50
print(MyValue<String>.a)

// Property Warappers

@propertyWrapper
struct SafeString {
    var wrappedValue: String {
        didSet {
            wrappedValue = wrappedValue.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

struct User {
    @SafeString var name: String
}
var user1 = User(name: " John Doe ")
print(user1.name)


// Define type-specific protocol requirements with the Self keyword

protocol Copyable {
    func copy() -> Self
}

class Document: Copyable {
    var title: String
    
    // A required convenience initializer to allow `Self` in copy()
    required init(title: String) {
        self.title = title
    }
    
    func copy() -> Self {
        // Using `Self` allows returning a new instance of the conforming type
        return Self(title: self.title)
    }
}

class Book: Document {
    var author: String
    
    required init(title: String, author: String) {
        self.author = author
        super.init(title: title)
    }
    
    required convenience init(title: String) {
        self.init(title: title, author: "Unknown")
    }
    
    override func copy() -> Self {
        return Self(title: self.title, author: self.author)
    }
}

let originalDocument = Document(title: "My Document")
let copiedDocument = originalDocument.copy()

print("Original Document: \(originalDocument.title)")
print("Copied Document: \(copiedDocument.title)")

let originalBook = Book(title: "My Book", author: "Author A")
let copiedBook = originalBook.copy()

print("Original Book: \(originalBook.title), \(originalBook.author)")
print("Copied Book: \(copiedBook.title), \(copiedBook.author)")

// Accurately identify the dynamic type of values in generic context
protocol Animal { }
struct Dog: Animal { }
let dog: Animal = Dog()

func printGenericInfo<T>(_ value: T) {
    // By casting value to Any, we instruct Swift’s type system to evaluate the type at runtime, thereby obtaining the correct dynamic type, Dog, in this case
    let typeDescription = type(of: value as Any)
    print("Value is a \(typeDescription).")
}

printGenericInfo(dog)


// String Maniopulation

var greeting = "Hello, World!"

// Accessing the characters using index
let index = greeting.index(greeting.startIndex, offsetBy: 7)
print(greeting[index])

// Insert a character
greeting.insert("!", at: greeting.endIndex)
print(greeting)

// Removing a character
greeting.remove(at: index)
print(greeting)

let commaIndex = greeting.index(greeting.startIndex, offsetBy: 5)
greeting.insert(contentsOf: "dear", at: commaIndex)
print(greeting)


extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: Date, dateFormat: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        let dataString = formatter.string(from: value)
        appendLiteral(dataString)
    }
}

let today = Date()
let formmatedString = "Today is \(today, dateFormat: "yyyy-MM-dd")"
print(formmatedString)


let messyString = "S!w@i#f$t%"
let cleanedString  = messyString.filter { $0.isLetter }
print(cleanedString)


struct UserRole {
    let name: String
    let isActive: Bool
    let role: String
}
extension UserRole: CustomDebugStringConvertible {
    var debugDescription: String {
        """
        UserRole: \(name) \
        [isActive: \(isActive) , role: \(role)]
        """
    }
}

let userRole = UserRole(name: "JohnDoes", isActive: true, role: "Admin")
print(String(reflecting: userRole))

func logProperties(of object: Any) {
    //Mirror is a powerful tool for reflection, which allows us to introspect and explore the properties and values of instances at runtime
    let mirror = Mirror(reflecting: object)
    print("Logging properties for \(object):")
    for child in mirror.children {
        if let propertyName = child.label {
            print("\(propertyName): \(child.value)")
        }
    }
}
logProperties(of: userRole)


// Main Actor
@MainActor
func updateUI() {
    print("Updating UI")
}

DispatchQueue.main.async {
    updateUI()
}

// Task Priority

func fetchUserData() async {
    Task(priority: .high) {
        // Simulate a network request
        try await Task.sleep(nanoseconds: 1_000_000_000)
        print("User data received")
    }
}

func fetchBackgroundTask() async {
    Task(priority: .background) {
        // Simulate a network request
        try await Task.sleep(nanoseconds: 2_000_000_000)
        print("Backgroud Task Completed")
    }
}

Task {
    await fetchUserData()
    await fetchBackgroundTask()
}


