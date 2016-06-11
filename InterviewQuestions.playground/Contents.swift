//: Playground - noun: a place where people can play

import UIKit

/*
 Max Value - Continuous Subsequence 
 Given array, find continuous subsequence for which sum is max
 ex. [-2, 11, -4, 13, -5, -2] -> 11-4+13 = 20 (hint: Kadane's)
 
 Given a string array ex: [1,2,3] find permutation in best time
 
 Compute the value of an expression in Reverse Polish Notation
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
    
    for i in 0 ..< array.count {
        if firstIndex == nil && number == array[i] {
            //print("number: \(number), i:\(i)")
            firstIndex = i
            print("First Index: \(firstIndex!) Element: \(array[i])")
        }
    }
    
    for j in array.enumerate().reverse(){
        if lastIndex == nil && number == array[j.element]{
            let indexReversed = array[j.index]
            lastIndex = array.count - 1 - indexReversed
            print("Last Index: \(lastIndex!) Element: \(array[j.element])")
        }
    }
    
    
    return (firstIndex!,lastIndex!)
}


//findStartAndEndIndexes([0,0,2,3,3,3,3,4,7,7,9], number: 3)

//findStartAndEndIndexes([0,2,1,3,4,5,2,5], number: 2)

// 5. Count the number of occurrences of an element in a sorted array

func countOccurrences(array:[String], element:String) -> Int {
    
    var counter = 0
    
    for i in 0 ..< array.count {
        if element == array[i] {
            counter += 1
        }
    }
    return counter
}

//countOccurrences(["dad","bob","john","dad","phil","dad","ronny"], element: "bob")

// 6.  Write a func to determine if a string is a number without using built in functions

func isNumber(string:String) -> Bool {
    
    //correct numbers: 5, 2500, -5, 0.25,
    let charArray = Array(string.characters) //put string in array of characters

    var decimal = false //is decimal? set a bool to check how many decimals
    
    for i in 0 ..< charArray.count { //loop through
        
        if charArray[i] == "-" || charArray[i] == "+" { //pos and neg signs only in 0 index
            if i != 0 { return false }                  // else its false
        } else if charArray[i] == "."{                  //if there's a decimal
            if decimal {                                //and decimal is true that means there
                return false                            //was already another decimal
            } else {
            decimal = true                              //set to true here
            }
            if i == charArray.count-1{                  //decimals cannot be in the last index
                return false
            }
        } else if charArray[i] < "0" || charArray[i] > "9" { //cannot be less than 0
            return false                                     //or greater than 9 in string code
        }
    }
    return true
}

//var word = "This saturday night we will party"
//
//let new = word.characters.split(" ").map(String.init)
//
//print(new)

isNumber("900000")


