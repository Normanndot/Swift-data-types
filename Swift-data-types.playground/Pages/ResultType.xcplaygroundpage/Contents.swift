//: [Previous](@previous)

import Foundation

enum StringError: Error {
    case nullString
    case spaceIncluded
}

extension StringError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .nullString:
            return "Cannot use a null name here."
        case .spaceIncluded:
            return "Cannot use a name with a space."
        }
    }
}

//Before Result-Type

func sayHello(_ name: String) throws -> String {
    guard !name.isEmpty else {throw StringError.nullString}
    return ("hello \(name)")
}

do {
    let result = try sayHello("")
    print (result)
}
catch StringError.nullString {
    print ("null error:", StringError.nullString.localizedDescription)
}
catch StringError.spaceIncluded {
    print ("spcae error:", StringError.spaceIncluded.localizedDescription)
}

//After Result-Type
func sayHelloResult(_ name: String) -> Result<String, StringError> {
    guard !name.isEmpty else {return .failure(.nullString)}
    return .success("hello \(name)")
}

let result1 = sayHelloResult("") // returns either success or failure

switch result1 {
case.success(let message):
    print (message)
case.failure(let error):
    print (error.localizedDescription)
}
