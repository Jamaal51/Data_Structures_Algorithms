//: Playground - noun: a place where people can play

import UIKit

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
