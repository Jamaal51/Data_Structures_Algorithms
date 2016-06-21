//: Playground - noun: a place where people can play

import UIKit

/* Questions:
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
//more efficient way to reverse string

func reverseStringTwo(str:String) -> String {
    var newString = ""
    
    for i in str.characters.reverse(){
        newString.append(i)
    }
    return newString
}

//reverseStringTwo("hello my name is bob")


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

//hasSquareRoot(72)


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

isNumber("hello")

// 6. Searching through an array using binary search

func searchForElementInArray(array:[Int], element: Int) -> Bool {
    
    let mid = array.count/2
    let min = array[0]
    let max = array[array.count-1]
    
    let leftSplit: ArraySlice<Int> = array[0 ..< mid]
    let rightSplit: ArraySlice<Int> = array[mid ..< array.count]
   
    if element >= min && element <= max{
        if element == array[mid] || element == max || element == min{
            print(true)
            return true
        } else if element < array[mid]{
            searchForElementInArray(Array(leftSplit), element: element)
        } else if element > array[mid]{
            searchForElementInArray(Array(rightSplit), element: element)
        }
    }
    
    return false
}

let arrayInts = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

searchForElementInArray(arrayInts, element:16)

// 7. Max Value - Continuous Subsequence
//Given array, find continuous subsequence for which sum is max
//    ex. [-2, 11, -4, 13, -5, -2] -> 11-4+13 = 20 (hint: Kadane's)

func maxSubsequentSum(array:[Int]) -> [Int] {
    
    let count = array.count             //set array count
    var maxSum = 0                      //have a maxSum var that holds the final sum
    var runningSum = array[0]           //set the runningSum equal to first element in array
    var j = 0                           //set j
    var start = 0
    var finish = 0
    
    for i in 1 ..< count {              //enumerate from 1 to count-1
        if runningSum > 0 {             //if the running sum > 0
            print(runningSum)
            runningSum += array[i]      //add the array[i] to it
        } else {                        // if running sum is < 0
            runningSum = array[i]       //make array[i] the new running sum
            j = i                       //set j equal to i to hold that index
        }
        if runningSum > maxSum {        //if the runningSum is greater than maxSum
            maxSum = runningSum         //set runningSum as maxSum
            start = j                   //make start index = j
            finish = i                  //make finish = i
        }
        
    }
    print(maxSum)
    print("start:\(start) finish:\(finish)")
    let newArray: ArraySlice<Int> = array[start...finish]
    
    return Array(newArray)
}

//maxSubsequentSum([-2, 11, -4, 13, -5, -2])

func findMaxInSequence(array:[Int]) -> [Int] {
    
    let count = array.count
    var maxSum = 0
    var runningSum = array[0]
    var j = 0     //start
    var start = 0
    var finish = 0
    
    //1. figure out running sum
    
    for i in 1 ..< count {
        if runningSum > 0 {
            runningSum += array[i]   //if runningSum > 0 add to next index value
        } else {
            runningSum = array[i]    // else we make the next index value our running sum
            j = i                    // keep track of index i by keeping it at j
        }
        if runningSum > maxSum {
            maxSum = runningSum
            start = j
            finish = i
        }
    }
    let newArray: ArraySlice<Int> = array[start...finish]
    
    return Array(newArray)
}

//findMaxInSequence([-2, 11, -4, 13, -5, -2])

// 8. Given a string array ex: [1,2,3] find permutation in best time

//func swap(first:Int, second:Int) -> [Int] {
//    var a = first
//    var b = second
//    var temp: Int
//    
//    temp = a
//    a = b
//    b = temp
//    
//    return [a, b]
//}
//
//swap(5,second: 4)

var newString: String = ""

func printPermutationsOfString(word:String){
    print("called function")
    if word.characters.count == 1 {
         print("A. word count = 1, word = \(word)")
        newString.appendContentsOf(word)
         print("B. newString1 = \(newString)")
        newString = newString.stringByReplacingOccurrencesOfString(word, withString: "")
         print("C. newString2 = \(newString)")
    } else {
        for i in word.characters{
             print("D. word = \(word), i = \(i)")
            newString.append(i)
             print("E. newString3 = \(newString)")
            printPermutationsOfString(word.stringByReplacingOccurrencesOfString(String(i), withString: ""))
            newString = newString.stringByReplacingOccurrencesOfString(String(i), withString: "")
             print("F. newString4 = \(newString)")
        }
    }
}

printPermutationsOfString("rob")

// 9. Two-Sum Problem. Given array, write function that checks if there are two entries that add up to k. Basically a[i] + a[j] == k ?

func twoSumProblem(array:[Int], k:Int) -> (Int,Int)? {
    
    
    var dict = [Int:Int]()
    
    //1. return if i is in the dictionary
    for i in 0 ..< array.count {
        if let newK = dict[array[i]]{   //if you have element in the dictionary, then you let it be newK (return value of
            return (newK, i)        //return index values (1,3)
        } else {
            dict[k - array[i]] = i  //if not in the dictionary we add it as a key
        }
    }
    return nil
}

//Another way to solve this
//func twoSumProblem(a: [Int], k: Int) -> ((Int, Int))? {
//    var i = 0
//    var j = a.count - 1
//    
//    while i < j {
//        let sum = a[i] + a[j]
//        if sum == k {
//            return (i, j)
//        } else if sum < k {
//            ++i
//        } else {
//            --j
//        }
//    }
//    return nil
//}

//let thisArray = [ 7, 2, 23, 8, -1, 0, 11, 6]

//twoSumProblem(thisArray, k: 10)



//////

//func merge(leftPile leftPile:[Int], rightPile:[Int]) -> [Int] {
//   //1  two indexes to keep track of your progress for the two arrays while merging.
//    var leftIndex = 0
//    var rightIndex = 0
//  
//    //2 initiate merged array to be returned
//    var orderedPile = [Int]()
//    
//    //3 compare the elements from the left and right sides, and append them to the orderedPile while making sure that the result stays in order
//    while leftIndex < leftPile.count && rightIndex < rightPile.count {
//        if leftPile[leftIndex] < rightPile[rightIndex] {
//            orderedPile.append(leftPile[leftIndex])
//            leftIndex += 1
//        } else if leftPile[leftIndex] > rightPile[rightIndex] {
//            orderedPile.append(rightPile[rightIndex])
//            rightIndex += 1
//        } else {
//            orderedPile.append(leftPile[leftIndex])
//            leftIndex += 1
//            orderedPile.append(rightPile[rightIndex])
//            rightIndex += 1
//        }
//    }
//    
//    //4 
//    while leftIndex < leftPile.count {
//        orderedPile.append(leftPile[leftIndex])
//        leftIndex += 1
//    }
//    
//    while rightIndex < rightPile.count {
//        orderedPile.append(rightPile[rightIndex])
//        rightIndex += 1
//    }
//    
//    print("Ordered Pile:\(orderedPile)")
//    return orderedPile
//}
//
//func mergeSort(array:[Int]) -> [Int]{
//    
//    if array.count <= 1 { return array }
//    
//    let middle = array.count/2
//    
//    let firstHalf = mergeSort(Array(array[0..<middle]))
//    
//    let secondHalf = mergeSort(Array(array[middle..<array.count]))
//    
//    print("first:\(firstHalf)")
//    
//    print("second:\(secondHalf)")
//    
//    return merge(leftPile: firstHalf, rightPile: secondHalf)
//}

//mergeSort([10,2,12,3,9,4,17,6])


// HASH TABLES

public struct HashTable<Key: Hashable, Value> {
    
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element]
    
    private var buckets: [Bucket]
    private(set) var count = 0
    
    public init(capacity:Int){
        assert(capacity>0)
        buckets = .init(count: capacity, repeatedValue: [])
    }
    
    public var isEmpty: Bool {
        return count == 0
    }
    
}
var hashTable = HashTable<String, String>(capacity: 5)

// Practice Implement Merge Sort

func mergeSort(array:[Int]) -> [Int] {
    
    if array.count <= 1 { return array }
    
    let middle = array.count / 2
    
    let firstHalf = mergeSort(Array(array[0 ..< middle]))
    
    let secondHalf = mergeSort(Array(array[middle ..< array.count]))
    
    return merge(leftPile: firstHalf, rightPile: secondHalf)
}

func merge(leftPile leftPile:[Int], rightPile:[Int]) -> [Int]{
    //create tracking indexes
    var leftIndex = 0
    var rightIndex = 0
    
    //initiate array for ordered array
    var orderedPile = [Int]()
    
    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex]{
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }
    
        while leftIndex < leftPile.count {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < rightPile.count {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    print(orderedPile)
    return orderedPile
    }


//mergeSort([10,2,12,3,9,4,17,6])

// 10. Tic-Tac-Toe Proof

// how to win tic tac toe - if you are X or O and you score 1. same row, column or diagonal

let ticTacToeBox: [[Character]] = [["X", "X", "O"],  //0.0 0.1 0.2
                                   ["O", "X", "X"],  //1.0 1.1 1.2
                                   ["X", "O", "O"]]  //2.0 2.1 2.2

func isTicTacToeWin(gameBox:[[Character]]) -> (Bool, Character?)? {
    var gameWon = false
    var winner = Character?()
    
    //check rows
    for i in 0 ..< gameBox.count {
        var xCount = 0
        var oCount = 0
        for j in 0 ..< gameBox[i].count {
            print("Rows i,j - \(i),\(j)")
            
            if gameBox[i][j] == "X" {
                xCount += 1
            } else {
                oCount += 1
            }
            
            if xCount == 3 {
                print("X wins - Row")
                gameWon = true
                winner = "X"
                return (gameWon, winner)
            } else if oCount == 3 {
                print("O wins - Row")
                gameWon = true
                winner = "O"
                return (gameWon, winner)
            }
        }
    }
    
    //checkColumns
    for i in 0 ..< gameBox.count {
        var xCount = 0
        var oCount = 0
        for j in 0 ..< gameBox[i].count {
            
            print("Col i,j - \(i),\(j)")
            
            if gameBox[j][i] == "X" {
                xCount += 1
            } else {
                oCount += 1
            }
           
            if xCount == 3 {
                print("X wins - Col")
                gameWon = true
                winner = "X"
                return (gameWon, winner)
            } else if oCount == 3 {
                print("O wins - Col")
                gameWon = true
                winner = "O"
                return (gameWon, winner)
            }
        }
    }
    
    //checkDiagonals
    
    var xCount1 = 0
    var oCount1 = 0
    var xCount2 = 0
    var oCount2 = 0

    for i in 0 ..< gameBox.count {
        for j in 0 ..< gameBox[i].count {
            if i == j {
                print("Diag i,j - \(i),\(j)")
                //decline diagonal
                if gameBox[i][j] == "X" {
                    print(gameBox[i][j])
                    xCount1 += 1
                } else {
                    oCount1 += 1
                }
                
                //incline diagonal
                if gameBox[i][2-j] == "O"{
                    print(gameBox[i][j])
                    oCount2 += 1
                } else {
                    xCount2 += 1
                }
                
                if xCount1 == 3 || xCount2 == 3 {
                    print("X wins - Diag")
                    gameWon = true
                    winner = "X"
                    return (gameWon, winner)
                } else if oCount1 == 3 || oCount2 == 3 {
                    print("O wins - Diag")
                    gameWon = true
                    winner = "O"
                    return (gameWon, winner)
                }
            }
        }
    }
    return (gameWon,"T")
}

//isTicTacToeWin(ticTacToeBox)

