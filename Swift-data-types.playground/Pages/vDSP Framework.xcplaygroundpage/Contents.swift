import Foundation
import Accelerate


let first: [Float] = [10, 20, 30, 40]
let second: [Float] = [ 1,  2,  3,  4]

///Tradional way of multiply each member of one array to the corresponding member of another array

var multiplied: [Float] = [0, 0, 0, 0]

for i in 0..<first.count {
    multiplied[i] = first[i] * second[i]
}

print("traditional Multiply: \(multiplied)")

/// With vDSP framework

let result = vDSP.multiply(first, second)
print("vDSP Multiply: \(result)")

//Now let’s try out another operation: Type Conversion.
//We have an array containing Double members. We want to round the members of the array and transform them into Ints, so we use the traditional .map function:

let source: [Double] = [1.2, 2.4, 3.6, 4.8]

let convertedInts = source.map { Int($0.rounded(.awayFromZero)) }

print(convertedInts)

//Let’s take a look at the vDSP version of that operation:
let sourceDSP: [Double] = [1.2, 2.4, 3.6, 4.8]
let ints = vDSP.floatingPointToInteger(sourceDSP, integerType: UInt16.self, rounding: .towardNearestInteger)
print(ints)
