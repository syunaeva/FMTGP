//: [Previous](@previous)

import Foundation
var str = "Hello, playground"


func odd(_ n: Int) -> Bool { return n&0x1 == 1 }
func half(_ n: Int) -> Int { return n >> 1 }

// 1a = a ; (n + 1) * a = na + a
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

//: Egyptian multiplication with less recursive calls
func mult_acc0(_ r: Int, _ n: Int, _ a: Int) -> Int {
    if (n == 1) { return r + a}
    if (odd(n)) {
        return mult_acc0(r + a, half(n), a + a)
    } else {
        return mult_acc0(r, half(n), a + a)
    }
}

//: Egyptian multiplication with less recursive calls, simplified
func mult_acc1( _ r: Int, _ n: Int, _ a: Int) -> Int {
    var r = r
    if (n == 1) { return r + a}
    if (odd(n)) { r = r + a }
    return mult_acc0(r, half(n), a + a)
}

//: Egyptian multiplication with less recursive calls, more simplification - n is rarely 1.
// If n is even, no point to check if it is 1
// TODO: how to avoid var r = r
func mult_acc2( _ r: Int, _ n: Int, _ a: Int) -> Int {
    var r = r
    if (odd(n)) {
        r = r + a
        if (n == 1) { return r}
    }
    return mult_acc0(r, half(n), a + a)
}
// strictly tail-recursive
func mult_acc3(_ r: Int, _ n: Int, _ a: Int )-> Int {
    var r = r
    if (odd(n)) {
        r = r + a
        if (n == 1) {return r}
    }
    let n = half(n)
    let a = a + a
    return mult_acc3(r, n, a)
}

multiply1(21, 5)
mult_acc1(0, 21, 5)
mult_acc3(0, 21, 5)
