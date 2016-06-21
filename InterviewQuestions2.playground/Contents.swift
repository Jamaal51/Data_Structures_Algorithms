//: Playground - noun: a place where people can play

import UIKit

//1. write a program that gives count of common characters presented in an array of strings(array of characters array)
//str1: aghkafgklt, str2: dfghako, str3: qwemnaarkf, answer: a, f, k

func findCommonCharacters(array:[String]) -> Int {
    //1. return if array count is less than 2
    if array.count < 2 { return 0 }
    
    //2. take first element and create a set of characters, set it to prevSet
    let string1 = array[0]
    let strChars = Array(string1.characters)
    var prevSet = Set(strChars)
    
    //3. loop through the rest of array, taking the intersect between each newSet and making that equal to prevSet
    for i in 1 ..< array.count {
        let chars = Array(array[i].characters)
        let charSet = Set(chars)
        let newSet = prevSet.intersect(charSet)
        prevSet = newSet
    }
    //4. return count
    print(prevSet)
    return prevSet.count
}

//findCommonCharacters(["aghkafgklt","dfghako","qwemnaarkf"])

//2. 2. Given a string, reverse it. Can you do it recursively?

//a. Iteratively
func reverseString(str:String) -> String {
    
    //1. create newString variable, put string into character array
    var newString = ""
    var stringArray = Array(str.characters)
    
    //2. enumerate in reverse, removing the last element. Append last element to newString
    for _ in stringArray.enumerate().reverse(){
        let lastChar = stringArray.removeLast()
        newString.append(lastChar)
    }
    //3. return newString
    return newString
}
//reverseString("Hollywood")

//b. Recursively
func reverseStringRecursively(str:String) -> String {
    
        //1. base case - return str when its count is 1
    if str.characters.count == 1 { return str }
        //2. create an array of characters
    var strArray = Array(str.characters)
        //3. remove the last character
    let lastChar = strArray.removeLast()
        //4. concatenate last character with recursive call of remaining string array
    return String(lastChar) + reverseStringRecursively(String(strArray))
}
//reverseStringRecursively("Hollywood")

//3. Write a function that takes a number and returns the square root. Recursively? /  Determine whether a number has an integer square root?

func returnSquareRoot(number:Int) -> Int {
    //1. return for 0 and 1
    if number <= 0 { return 0 }
    if number == 1 { return 1 }
    //2. take half number
    let half = number/2
    //3. loop from 1 to half, if i * i equals number return product of i * i, the square root
    for i in 1 ..< half {
        let product = i * i
        if product == number {
            return i
        }
    }
    return -1
}
//returnSquareRoot(64)

//4.Given a sorted integer and a number, find the start and end indexes of the number in an array ex. Array = [0,0,2,3,3,3,3,4,7,7,9] and Number = 3 -> Output = (3,6)

func findStartEndIndexes(arrayInts:[Int], number:Int) -> (Int,Int) {
    //1. create an array to store indexes
    var indexes = [Int]()
    //2. enumarate through array, if value equals number, store that index in indexes array
    for (index, value) in arrayInts.enumerate() {
        if value == number {
            indexes.append(index)
        }
    }
    //3. return the first and last elements in the index array
    return (indexes.first!, indexes.last!)
}

findStartEndIndexes([0,0,2,3,3,3,3,4,7,7,0], number: 0)

//5. Write a func to determine if a string is a number without using built in functions
// valid numbers - only one decimal, negative sign is first

func isStringANumber(str:String) -> Bool {
    //1. create an array of string characters and decimal bool of false
    let strArray = Array(str.characters)
    var decimal = false
    //2. loop through array. a) negative sign, must be first index only b) there cannot be more than one decimal and decimal cannot be last number c) value must be less than "0" or greater than "9" in unicode
    for i in 0..<strArray.count {
        if strArray[i] == "-" {
            if i > 0 {
                return false
            }
        } else if strArray[i] == "."{
            if decimal {
                return false
            } else {
                decimal = true
            }
            
            if i == strArray.count - 1 {
                return false
            }
        } else if strArray[i] < "0" || strArray[i] > "9"{
            return false
        }
    }
    //3. if conditions meet, return true
    return true
}

//isStringANumber("22356")
//isStringANumber("-555")
//isStringANumber("-55-5")
//isStringANumber(".59000")
//isStringANumber(".576.20")
//isStringANumber("89.000")
//isStringANumber("hello")

//6. Count number of occurences of element in array (easy)

//7. Searching through an array using binary search

func findElementInArray(array:[Int], number:Int) -> Bool {
    //1. find midpoint index, min value and max value
    let midpoint = array.count / 2
    let minElement = array[0]
    let maxElement = array.last
    //2. split arrays in half left and right
    let leftHalf = Array(array[0..<midpoint])
    let rightHalf = Array(array[midpoint..<array.count])
    //3. as long as number is between min and max element continue. if number equals midpoint, max or min values then return true. if number is less than midpoint, call func on leftHalf else if number is greater than midpoint, call func on rightHalf
    if minElement <= number && number <= maxElement{
        if number == array[midpoint] || number == minElement || number == maxElement {
            return true
        } else if number < array[midpoint]{
            findElementInArray(leftHalf, number: number)
        } else if number > array[midpoint]{
            findElementInArray(rightHalf, number: number)
        }
    }
    return false
}
//findElementInArray([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20], number: 31)

//8. Max Value - Continuous Subsequence - Given array, find continuous subsequence for which sum is max ex. [-2, 11, -4, 13, -5, -2] -> 11-4+13 = 20
func maxSubsequentSum(array:[Int]) -> [Int]{
    
    let count = array.count    //1. set array count
    var runningSum = array[0]  //create runningSum variable starting with first element
    var maxSum = 0             //store maxSum in variable
    var start = 0              //create start variable
    var finish = 0             //create finish variable
    var j = 0                  //create j variable
    
    for i in 1 ..< count {           //2. loop through array
        if runningSum > 0 {          //if runningSum > 0
            runningSum += array[i]   //add the array[i] to it
        } else {
            runningSum = array[i]    //if not > 0, make array[i] new runningSum
            j = i                    //hold that i in j variable
        }
        if runningSum > maxSum {     //3. if runninnSum > maxSum
            maxSum = runningSum      // make runningSum current maxSum
            start = j                // put the j index in start variable
            finish = i               // put the i index in finish variable
        }
    }
    let subArray = Array(array[start...finish]) //4. create a subArray from start to finish
    return subArray
}
//maxSubsequentSum([-2, 11, -4, 13, -5, -2])
//maxSubsequentSum([-2, -3, -4, 2, 1, -3])

//9. Given a string, print all permutations of string

var newString = ""                  //1. outside of func, create newString variable
var permutations = [String]()       // and an empty array to store permutations

func printPermutationsOfString(word:String) -> [String]{
    
    if word.characters.count == 1 {
        newString.appendContentsOf(word)
        permutations.append(newString)
        newString = newString.stringByReplacingOccurrencesOfString(word, withString: "")
    }
    
    for i in word.characters {    //2. loop through characters in word
        newString.append(i)       //append the letter to newString
        //call the function again taking out each letter
        printPermutationsOfString(word.stringByReplacingOccurrencesOfString(String(i), withString: ""))
        newString = newString.stringByReplacingOccurrencesOfString(String(i), withString: "")
    }
    return permutations
}
//printPermutationsOfString("run")

//10.Two-Sum Problem. Given array, write function that checks if there are two entries that add up to k. Basically a[i] + a[j] == k ?
//approach - create a dictionary, loop through array, checking if the difference between i and k is already a value in that dictionary. if yes, that means there are two entries that add up to k
func twoNumberSum(array:[Int], k:Int) -> (Int,Int)?{
    //1. create empty dictionary variable
    var dict = [Int:Int]()
    //2. loop through array
    for i in 0..<array.count {
        if let newK = dict[array[i]] { //3. if dict[array[i]] has a value in the dictionary
            return (newK, i)           // return value of dict[array[i]] as newK and i
        } else {
           dict[k - array[i]] = i      //4. if not, create a value of i, with key being the difference between k and array[i]
        }
        print(dict)
    }
    return nil
}
//twoNumberSum([5,6,7,2,1,11,4], k: 10)

//11. Implement an algorithm to determine if a string has all unique charaters. What if you cannot use additional data structures?
func stringHasUniqueCharacters(str:String) -> Bool {
    //1. Create a dictionary taking a key,value pair of character and int
    var dict = [Character:Int]()
    //2. put string in array of characters
    let charArray = Array(str.characters)
    //3. loop through array, check to see if the key character already has a value
    for i in charArray {
        if dict[i] != nil{
            return false //4. if it does have a value, then return false since we used it already
        } else {
            dict[i] = 1  //5. if no value for key, create value of 1 for key
        }
        print(dict)
    }
    return true
}

//stringHasUniqueCharacters("hoH!")

//12. Check if one string is permutation of another

func arePermutations(str1:String, str2:String) -> Bool {
    //if same string return true, if count unequal return false
    if str1 == str2 { return true }
    
    if str1.characters.count != str2.characters.count { return false }
    //if the two strings are sorted and are equal, return true else false
    return str1.characters.sort() == str2.characters.sort()
}
//arePermutations("heloo", str2: "heloo")

//13. Convert a string so that all the white space turns into %20 for example "Mr. John Smith    " ==> "Mr.%20John%20Smith" without using language library

func converStringSpacesToURL(str:String) -> String {
    
    var newString = [String]()
    
    for i in str.characters {
        newString.append(String(i))
    }
    
    for i in 0..<newString.count {
        if (newString[i] == " "){
            newString[i] = "%20" as String
        }
    }
    print(newString)
    return String(newString)
}
//converStringSpacesToURL("  print this string    ")

//14. Rotate Matrix - Given an image represented by an NxN matrix write a method to rotate it 90 degrees
var matrix = [["A","B","C"],
              ["D","E","F"],
              ["G","H","I"]]

func rotateMatrix(matrix:[[String]]) -> [[String]]{
    //1. create a new matrix
    var newMatrix = [[String]]()
    
    for i in 0..<matrix.count {    //2. loop through each string array in the array
        var newArr = [String]()    //3. create a new string array after each i
        for j in 0..<matrix[i].count {
            let element = matrix[j][i]   //4. matrix[j][i] - grabs the the same index at different arrays
            newArr.insert(element, atIndex: newArr.startIndex) //5. insert element at the start of a newArray
        }
        newMatrix.insert(newArr, atIndex: newMatrix.endIndex) //6. insert the newArray into endIndex of new matrix
    }
    print(newMatrix)
    return newMatrix
}

//rotate 180 degrees
//for i in 0..<matrix.count {
//    var newArr = [String]()
//    for j in 0..<matrix[i].count {
//        let element = matrix[i][j]
//        newArr.insert(element, atIndex: newArr.startIndex)
//    }
//    newMatrix.insert(newArr, atIndex: newMatrix.startIndex)
//}
//
//rotate 270 / 90 degrees counter clockwise
//for i in 0..<matrix.count {
//    var newArr = [String]()
//    for j in 0..<matrix[i].count {
//        let element = matrix[j][i]
//        newArr.insert(element, atIndex: newArr.endIndex)
//    }
//    newMatrix.insert(newArr, atIndex: newMatrix.startIndex)
//}

//rotateMatrix(matrix)

//15. Zero Matrix - write an algorithm such that if an element in an MxN matrix is 0, its entire row and column are set to 0

func changeValueAtRowAndColumn(matrix:[[String]], newString:String, row:Int, column:Int) -> [[String]]{
    //1. put given matrix into new variabl
    var matrix1 = matrix
    //2. loop through matrix, if i equals row || j equals column then turn all matrix[i][j] into newString
    for i in 0 ..< matrix.count {
        for j in 0 ..< matrix[i].count {
            if i == row || j == column {
                matrix1[i][j] = newString
            }
        }
    }
    return matrix1
}

var mnMatrix = [["a","b","c"],
                ["d","e","f"],
                ["g","h","i"],
                ["j","k","l"]]

changeValueAtRowAndColumn(mnMatrix, newString: "*", row: 0, column: 1)

// 16. String Rotation - Given two strings s1 and s2 write code to check if s2 is a rotation of s1 using one call to isSubstring. ex: "waterbottle" is a rotation of "erbottlewat"
func isSubstring(str1:String, str2:String) -> Bool {
    //1. create string array variable and length variable
    var strArray = Array(str1.characters)
    let length = strArray.count
    //2. striding in reverese, remove last element and insert in the beginning
    for _ in length.stride(to: 1, by: -1){
        let element = strArray.removeLast()
    
        strArray.insert(element, atIndex: 0)
    //3. check to see if string Array equals other string, if so then it is a substring
        if String(strArray) == str2 {
            return true
        }
    }
    return false
}

// 17. 5. One Away: There are 3 types of edits - insert, remove, replace a character. Given 2 strings write a function to check if they are one edit (or 0) away

