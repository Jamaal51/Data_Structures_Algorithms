//: Playground - noun: a place where people can play

import UIKit

func pairSumSequence(n: Int) -> (Int) {
    var sum: Int = 0
    
    for i in 0..<n {
        sum += pairSum(i, b: i+1)
        print(sum)
    }
    print(sum)
    return sum
}

func pairSum(a: Int, b: Int)->Int{
    print(a,b)
    return a + b
}

pairSumSequence(10)

// Run Times

// Fastest -> Slowest
 
// O(log x) -> O(x) -> O(x log x) -> O(x^2) -> O(2^x) -> O(x!)

// example 10 - finding if its prime or not

func isPrime(n: Int) -> Bool {
    var x: Int
    
    let sq = sqrt(Double(n))
    
    for x = 2; x*x <= n; x += 1{    //go from 2 to the square root of N
        if (n % x == 0){            //if you find a number that is equally divisible by N then
            return false            //it isn't prime and you return False
        }
    }
    return true                     //Find no numbers and returns True
}
//isPrime(7)

// example 11 - computes factorial recursively

func factorial(n: Int) -> Int {
    if n < 0 {                      //return -1 if negative number
        return -1
    } else if n == 0 {              //return 1 when recursive hits 0
        return 1
    }
    return n * factorial(n-1)       // factorial equation -> N * (N-1)
}
factorial(4)

// ex. 12 - all permutations of string <---- work on this

func permutation(string: String){
    permutation(string, prefix: "")
}

func permutation(string: String, prefix: String){
    if string.characters.count == 0{
        print(prefix)
    } else {
        for n in 0..<string.characters.count{
            //let range = NSMakeRange(0, n)
            //let rem = string.substringWithRange(Range<Int>(start:0, end:n)) + string.substringToIndex(n+1)
        }
    }
}

// ex. 13 - Fibonacci


func fibonacci(n: Int) -> Int {
    //print(n)
    if n <= 0 {
        return 0
    } else if n == 1 {
        return 1
    } else {
        return fibonacci(n-1) + fibonacci(n-2)
    }
}

//fibonacci(6)

// ex. 16 - prints power of 2 up to N

func powersOfTwo(n:Int) -> Int {
    if n == 1 {
        print(1)
        return 1
    } else {
        let prev = powersOfTwo(n/2)    //divides by 2 all the way to one then multiplies current
        print("Prev: \(prev)")
        let curr = prev * 2
        print("Curr: \(curr)")
        return curr
    }
}
//powersOfTwo(50)




