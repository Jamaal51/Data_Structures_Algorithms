//: Playground - noun: a place where people can play

import UIKit

/*
 Count the number of occurrences of an element in a sorted array
 
 Max Value - Continuous Subsequence 
 Given array, find continuous subsequence for which sum is max
 ex. [-2, 11, -4, 13, -5, -2] -> 11-4+13 = 20 (hint: Kadane's)
 
 Given a string array ex: [1,2,3] find permutation in best time
 
 Compute the value of an expression in Reverse Polish Notation
 
 Write a func to determine if a string is a number without using built in functions
 

 */



// 1. write a program that gives count of common characters presented in an array of strings(array of characters array)
//str1: aghkafgklt, str2: dfghako, str3: qwemnaarkf, answer: a, f, k


//let str1 = "aghkafgklt"
//let str2 = "dfghako"
//let str3 = "qwemnaarkf"
//
//var stringSet1 = Set(str1.characters)
//var stringSet2 = Set(str2.characters)
//var stringSet3 = Set(str3.characters)
//
//let newSet = stringSet1.intersect(stringSet2)
//let newerSet = stringSet3.intersect(newSet)

func findTheCommonCharacters(arrayOfStrings:[String]) -> Int {
    
    if arrayOfStrings.count < 2 { return 0 }
    
    var prevSet = Set(arrayOfStrings[0].characters)
    
    for i in 1 ..< arrayOfStrings.count {

        let stringSet = Set(arrayOfStrings[i].characters)
        let newSet = stringSet.intersect(prevSet)
        prevSet = newSet
    }
    
    print(prevSet)
    return prevSet.count
}

//findTheCommonCharacters([str1, str2, str3])

// 2. Given a string, reverse it. Then recursively?

func reverseString(str:String) -> String {
    
    var strArray = Array(str.characters)
    var reverseString = [Character]()
    
    for _ in strArray.reverse().enumerate() { //enumerate through string in reverse
        let letter = strArray.removeLast()    //take the last letter
        reverseString.append(letter)          //append that to reverseString
    }
    //print(reverseString)
    return String(reverseString)              //return reverseString array cast as String
}

//reverseString("balboa")

func reverseStringRecursively(str:String) -> String {
    
    var strArray = Array(str.characters)  //turn string into Array of chars
    
    if strArray.count == 0 { return str } //catch case when the array char count is 0 just return the string

    let lastChar = strArray.removeLast() //else take last element in char array
    let lastString = String(lastChar)    //cast into string
    let stringRem = String(strArray)     //cast the remaining array into string
    
    return lastString + reverseStringRecursively(stringRem)  //return lastString with recursive call
}

//reverseStringRecursively("bigbossman")

// 3.  Write a function that takes a number and returns the square root. Recursively? /  Determine whether a number has an integer square root?

func returnSquareRoot(int:Int) -> Int {
    
    if int == 0 { return 0 }
    if int == 1 { return 1 }
    
    let max = int/2
    
    for i in 1 ... max {
        if i * i == int {
            return i
        }
    }
    return 0
    }

func hasSquareRoot(int:Int) -> Bool {
    if int <= 0 { return false }
    if int == 1 { return true }
    
    let max = int/2
    for i in 1 ... max {
        if i * i == int {
            return true
        }
    }
    
    return false
}

hasSquareRoot(72)


//returnSquareRoot(99)

//func returnSqRtRecursively(num:Int, prev:Int) -> Int {
//    return returnSqRtRecursively(0, prev: 0)
//}

// 4.  -Given a sorted integer and a number, find the start and end indexes of the number in an array ex. Array = [0,0,2,3,3,3,3,4,7,7,9] and Number = 3 -> Output = (3,6)

func findStartAndEndIndexes(array:[Int], number:Int) -> (Int, Int){
    
    var firstIndex = Int?()
    //var currentLastIndex = Int?()
    var lastIndex = Int?()
    
    for i in array.enumerate() {
        if firstIndex == nil {
            if number == array[i.element] {
                firstIndex = array[i.index]
                print("First Index: \(firstIndex!) Element: \(array[i.element])")
            }
        }
    }
    
    for j in array.enumerate().reverse(){
        if lastIndex == nil {
            if number == array[j.element]{
                let firstIndexReversed = array[j.index]
                lastIndex = array.count - 1 - firstIndexReversed
                 print("Last Index: \(lastIndex!) Element: \(array[j.element])")
                }
            }
        }
    
    return (firstIndex!,lastIndex!)
}


//findStartAndEndIndexes([0,0,2,3,3,3,3,4,7,7,9], number: 3)

//findStartAndEndIndexes([2,1,3,4,5,2,5], number: 2)





