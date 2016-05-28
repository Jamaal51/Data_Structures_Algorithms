//: Playground - noun: a place where people can play

import UIKit

/* Hashing
 
 1. compute the keys hash code (usually Int or long) - two different keys can have same hash code
 2. Map has code to an index in an array like hash(key) % array_length. two different hash codes can have same index
 3. At this index, there is a linked list of keys and values.
 */






//1 - Implement an algorithm to determine if a string has all unique charaters. What if you cannot use additional data structures?
// for example - "stair" are all the characters unique, yes. but "stairs" they are not

func stringHasUniqueChars(str:String) -> Bool {
    
    let characterSet = Set(str.characters)
    
    if str.characters.count == characterSet.count{
        return true
    }
    print(str.characters.count)
    print(characterSet)
    print(characterSet.count)
    return false
}

//ask if ASCII characters or UNICODE characters

//stringHasUniqueChars("ball")

//func stringHasUniqueCharsTwo(str:String) -> Bool {
//    var newString = String()
//    
//    for i in 0..<str.characters.count {
//        let char = str.characters.removeAtIndex(i) as Character
//        if newString.characters.contains(){
//            
//        }
//    }
//    return true
//}

//2 - check if one string is permutation of another
// sort one string and see if it ever ends up as the other string

//var usedStrings = [Any]()

func isPermutation(str1:String, str2:String) -> Bool {
    
    let strArray1 = Array(str1.characters)
    let strArray2 = Array(str2.characters)
    
    if str1.characters.count != str2.characters.count { return false }
    
    return strArray1.sort() == strArray2.sort()
}

//isPermutation("heoll", str2: "hlleo")

/* 
 ASCII (128 different values) mininum unsigned integer (in one byte) = 0, max unsigned integer = 127
 Only needed to use 7-bit byte

 Unicode UTF-8, UTF-16, UTF-32
*/

//3 - convert a string so that all the white space turns into %20 for example "Mr. John Smith    " ==> "Mr.%20John%20Smith" without using language library

func convertStringToURLString(input:String) -> String {
    
    var stringArray = [String]()
    
    for c in input.characters {
        let charString = String(c)
        stringArray.append(charString)
    }
    
    //loop through string like looping through array
    for i in 0 ..< stringArray.count{
        if (stringArray[i] == " "){
            stringArray[i] = "%20" as String
        }
    }
    print(stringArray)
    return String(stringArray)
}

//convertStringToURLString("Print this string")

//my steps (this is without having to create new spaces in array) - 1. create a new array 2. take each character and turn them each intro strings 3. append each string into new array 4. loop through new array and replace each " " string with "%20" so we don't have to add new spaces to the array 5. DOESN'T HANDLE all "%20" at the end of string

//other method

//func replaceSpaces(string:String,length: Int) -> String {
//    var spaceCount = 0
//    var newLength = Int()
//    var i = Int()
//    
//    var stringArray = Array(string.characters)
//    print(stringArray)
//    
//    for i in 0 ..< length {
//        if stringArray[i] == " " {
//            spaceCount++
//        }
//        print(spaceCount)
//    }
//    
//    newLength = length + spaceCount * 2
//    print(newLength)
//    stringArray[newLength] = "\0"
//    
//    let n = length-1
//    
//    for i in n.stride(to: 0, by: -1){
//        if stringArray[i] == " "{
//          stringArray[newLength-1] =
//            
//        
//        
//        }
//    }
//
//    return ""
//}
//replaceSpaces("big ass cobra    ", length:13)



//4. Palindrome Permutation given a string, write a function to check it its a permutation of a palindrome input: TACT COA output: True (TACO CAT, ATCO CTA)

// Even length string - all characters must have even counts
// Odd length string - must have exactly ONE char with an ODD count
// even string cant have an odd number of just ONE character

//To be a permutation of a palindrome, a string can have no more than one character that is odd. This covers both odd and even cases

//if more than one letter shows up an odd number of times then cannot be perm of pal
func checkMaxNumberOfOdds(dict:[Character:Int]) -> Bool {
    var oddCounter = 0
    let allValues = Array(dict.values)
    
    for i in 0 ..< allValues.count{
        if allValues[i] % 2 == 1 {
            oddCounter += 1
            print(i)
        }
    }
    print(allValues)
    print(oddCounter)
    
    return oddCounter <= 1
}

//loop through the dictionary and count the number of times each letter shows up
func isPermOfPalindrome(str:String) -> Bool{
    
    let charArray = Array(str.characters)
    var lettersDict = createDictionaryOfKeys(charArray)
    
    for i in 0 ..< charArray.count {
        let key = charArray[i]
        //find charArray[i] in the dict
        var count = lettersDict.removeValueForKey(key)!
        //add the count
        count += 1
        //update the value
        lettersDict.updateValue(count, forKey: key)
    }
    
    return checkMaxNumberOfOdds(lettersDict)
}

//need to create a dictionary
func createDictionaryOfKeys(stringArray: Array<Character>) -> [Character:Int] {
    
    var dict = [Character:Int]()
    
    for i in 0 ..< stringArray.count {
        if !dict.keys.contains(stringArray[i]){
            dict[stringArray[i]] = 0
        }
    }
    
    return dict
}

let string1 = "baseball"
let stringArray = Array(string1.characters)

//createDictionaryOfKeys(stringArray)

//isPermOfPalindrome("baseball")

//5. One Away: There are 3 types of edits - insert, remove, replace a character. Given 2 strings write a function to check if they are one edit (or 0) away

//My guess...1. check if equal strings, if not then 2. check lengths...how many from the other if more than 1 then return false ... else if 3. same length count how many characters are different from each other

func countOutOfOrder(stringA:String, stringB:String) -> Int {
    var counter = 0
    
    let charArrayA = Array(stringA.characters)
    let charArrayB = Array(stringB.characters)
    
    var index1 = 0
    var index2 = 0
    //doesnt work
    for i in 0 ..< charArrayA.count {
        while (index1 < charArrayA.count && index2 < charArrayB.count){
            if charArrayA[i] != charArrayB[i]{
                counter += 1
            
            }
            index1+=1
            index2+=1
            
        }
    }
    
    return counter
}

func oneEditAway(stringA:String, stringB:String) -> Bool{
    
    var editCounter = 0
    
    //1. check if equal
    if stringA == stringB { return true }
    
    let orderCount = countOutOfOrder(stringA,stringB: stringB)
    print("Order count: \(orderCount)")
    editCounter += orderCount

    
    //2. check lengths. if one string is greater by 2 or more return false
    let a = max(stringA.characters.count, stringB.characters.count)
    let b = min(stringA.characters.count, stringB.characters.count)
    let diff = a - b
    editCounter += diff
    // add the difference if more than 1 return false
    if diff > 1 { return false }
    
    //3. check number of different characters - take the set of letters if the difference is more than 1 then return false
    
    let charSetA = Set(stringA.characters)
    let charSetB = Set(stringB.characters)
    print(charSetA)
    print(charSetB)
    
    let setDiff = charSetA.subtract(charSetB)
    print("Set Diff: \(setDiff.count)")
    
    if setDiff.count > 2 { return false }
    
    if diff >= 1 {
    editCounter += setDiff.count
    }
    
    //4. check the count of those out of order. 
    print("Edit count: \(editCounter)")
    return editCounter <= 1
}

//oneEditAway("string", stringB: "strin")

func oneEditAwayTwo(strA:String, strB:String) -> Bool{
    
    let lengthA = strA.characters.count
    let lengthB = strB.characters.count
    
    if lengthA == lengthB{                      //if both equal lengths then see if theres only onle letter to replace
        return oneEditReplace(strA, strB: strB)
    } else if lengthA + 1 == lengthB {           //if A is smaller than B
        return oneEditInsert(strA, strB: strB)
    } else if lengthA - 1 == lengthB {
        //return oneEditInsert(<#T##strA: String##String#>, strB: <#T##String#>)
    }
    
    return false
}

//This method checks to see if there are more than one indexes that need replacement

func oneEditReplace(strA:String, strB:String) -> Bool{
    var foundDifference = false
    
    let arrayA = Array(strA.characters)
    let arrayB = Array(strB.characters)
    
    for i in 0 ..< arrayA.count {
        if arrayA[i] != arrayB[i]{
            if (foundDifference == true){
                print("hit")                //hits this when it finds more than one difference
                return false
            }
            foundDifference = true
        }
    }
    return true
}

func oneEditInsert(strA:String, strB:String) -> Bool{
    var indexA = 0
    var indexB = 0
    
    let arrayA = Array(strA.characters)
    let arrayB = Array(strB.characters)

    while (indexB < arrayB.count && indexA < arrayA.count){
        
        if arrayA[indexA] != arrayB[indexB] {
            if indexA != indexB {               //if indexA is not equal to indexB then return false
                return false
            }
            indexB += 1
        } else {
            indexB += 1
            indexA += 1
        }
    }
    return true
}

oneEditAwayTwo("pale", strB: "pal")

//6. String Compression - implement a method tp perform basic string



