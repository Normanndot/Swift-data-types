//: [Previous](@previous)

import Foundation

// Unicode scalar value of "A" is 65.
let unicodeScalarValueOfA = 65

// Return type is String.UnicodeScalarView.
let convertedA = "A".unicodeScalars

// $0 is of type UnicodeScalar.
let mappedA = convertedA.map { $0.value }

let reducedA = mappedA.reduce(0, +)

let anotherUnicodeScalarValueOfA = "A".unicodeScalars.map { $0.value }.reduce(0, +)
