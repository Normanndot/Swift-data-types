
import Foundation

let count = 2
let stride = MemoryLayout<Int>.stride
let alignment = MemoryLayout<Int>.alignment
let byteCount = stride * count //total number of bytes
let pointer = UnsafeMutableRawPointer.allocate(byteCount: byteCount, alignment: alignment)

defer {
  pointer.deallocate()
}

pointer.storeBytes(of: 30, as: Int.self)
pointer.advanced(by: stride).storeBytes(of: 3, as: Int.self)
pointer.load(as: Int.self)
pointer.advanced(by: stride).load(as: Int.self)
let bufferPointer = UnsafeRawBufferPointer(start: pointer, count: byteCount)
for (index, byte) in bufferPointer.enumerated() {
  print("byte \(index) -> \(byte)")
}
