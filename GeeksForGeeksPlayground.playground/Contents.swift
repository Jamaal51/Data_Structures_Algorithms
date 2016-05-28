//: Playground - noun: a place where people can play

import UIKit

//GEEK FOR GEEKS

//Given three distinct numbers, find the number with value in middle (Try to do it with minimum comparisons).

func showTheMiddle(a:Int, b:Int, c:Int) -> Int {
    
    var intArray = [a, b, c]
    
    let n = intArray.count
    
    for _ in 0 ..< n {
        for i in 0 ..< n-1 {
        if intArray[i] > intArray[i+1] {
            let temp = intArray[i+1]
            intArray[i+1] = intArray[i]
            intArray[i] = temp
        }
    }
}
    return intArray[1]
}

showTheMiddle(16, b: 100, c: 15)

