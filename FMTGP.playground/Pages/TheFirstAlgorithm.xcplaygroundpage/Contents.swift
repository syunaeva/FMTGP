//: [Previous](@previous)

import Foundation
var str = "Hello, playground"

// 1a = a ; (n + 1) * a = na + a
func odd(_ n: Int) -> Bool { return n&0x1 == 1 }
func half(_ n: Int) -> Int { return n >> 1 }

func multiply0(_ n: Int, _ a: Int) -> Int {
    if (n == 1) { return a }
    return multiply0( n - 1, a) + a
}

//: Egyptian multiplication
//  4a = ((a + a) + a) = (a + a) + (a + a)
func multiply1(_ n: Int, _ a: Int) -> Int {
    if (n == 1) { return a }
    var result = multiply1(half(n), a + a)
    
    if (odd(n)) { result = result + a }
    return result
}

multiply1(21, 5)
