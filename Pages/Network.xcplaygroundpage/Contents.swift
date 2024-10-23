//: [Previous](@previous)

import Foundation
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

public enum HTTPError: Error {
    case invalidResponse
    case invalidURL
    case invalidStatusCode
}

public struct Post: Decodable, Identifiable {
    public let id: Int
    public let userId: Int
    public let title: String
    public let body: String
    
    public enum CodingKeys: String, CodingKey {
        case id
        case userId
        case title
        case body
    }
}

@available(iOS 15.0, macOS 12.0, *)
public class ApiClient {
    
    public init() {}
    
    private var cancellables = Set<AnyCancellable>()
    
    public func decode<T: Decodable>(url: URL) -> AnyPublisher<T, HTTPError> {
        let session = URLSession.shared.dataTaskPublisher(for: url)
        return session
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode) else {
                    throw HTTPError.invalidStatusCode
                }
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                return HTTPError.invalidResponse
            }
            .eraseToAnyPublisher()
    }
    
    public func getPosts() async -> [Post] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        return await withCheckedContinuation { continuation in
            let publisher: AnyPublisher<[Post], HTTPError> = decode(url: url)
            publisher.sink { completion in
                switch completion {
                case .finished:
                    print(completion)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { posts in
                continuation.resume(returning: posts)
            }
            .store(in: &cancellables)
        }
    }
}


Task {
    let apiClient = ApiClient()
    let posts = await apiClient.getPosts()
    print(posts)
    
    // Stop Playground execution once async task completes
    PlaygroundPage.current.finishExecution()
}
