import Foundation

///Codable
//let json = """
//[
//    {
//        "name": "Paul",
//        "age": 38
//    },
//    {
//        "name": "Andrew",
//        "age": 40
//    }
//]
//"""
//
//let data = Data(json.utf8)
//
//struct User: Codable {
//    var name: String
//    var age: Int
//}
//
//let decoder = JSONDecoder()
//
//do {
//    let decoded = try decoder.decode([User].self, from: data)
//    print(decoded[0].name)
//} catch {
//    print("Failed to decode JSON")
//}




///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
let json = """
{
    "title": "A weekly Swift Blog on Xcode and iOS Development - SwiftLee",
    "url": "https://www.avanderlee.com",
    "total_visitors": 378483,
    "number_of_posts": 47093
}
"""

let jsonData = Data(json.utf8)

struct Blog: Decodable {

    enum CodingKeys: String, CodingKey {
        case title, totalVisitors, numberOfPosts

        case htmlLink = "url"
    }

    let title: String
    let htmlLink: URL
    let totalVisitors: Int
    let numberOfPosts: Int
}


let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase

let blog: Blog = try! decoder.decode(Blog.self, from: jsonData)
print(blog.numberOfPosts) // Prints: 47093
