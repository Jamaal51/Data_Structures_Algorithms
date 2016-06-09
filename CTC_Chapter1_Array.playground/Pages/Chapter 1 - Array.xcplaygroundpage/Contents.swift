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
    } else if lengthA + 1 == lengthB {           //if A is the smaller string
        return oneEditInsert(strA, strB: strB)
    } else if lengthA - 1 == lengthB {
        return oneEditInsert(strB, strB: strA)  // if B is the smaller string
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

    while (indexB < arrayB.count && indexA < arrayA.count){ //checks the index we're looking at to see if string A and string B are only one insertion away
        
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

//oneEditAwayTwo("pale", strB: "pal")

//6. String Compression - implement a method to perform basic string compression using repated characters. For example "aabcccccaaa" becomes "a2b1c5a3". if same length should return originl string. Assume string has only uppercase and lowercase letters. 

func formDictFromString(str:String) -> [[Character:Int]] {
    
    var dictArray = [[Character:Int]]()
    var sArray = Array(str.characters)
    var counter = 1
    var index = 0
    
    for i in 1...sArray.count{
            if sArray[i-1] == sArray[i] && i < sArray.count-1{ //if the letters are equal AND you havent reached the end of the array
                counter += 1
            } else if sArray[i-1] == sArray[i] && i == sArray.count-1{
                counter += 1
                var dict = [Character:Int]()
                dict[sArray[i]] = counter
                dictArray.append(dict)
                return dictArray
            } else if sArray[i-1] != sArray[i] && i < sArray.count-1{
                var dict = [Character:Int]()
                dict[sArray[i-1]] = counter
                dictArray.append(dict)
                counter = 1
            } else if sArray[i-1] != sArray[i] && i == sArray.count-1{
                var dict1 = [Character:Int]()
                var dict2 = [Character:Int]()
                dict1[sArray[i-1]] = counter
                dictArray.append(dict1)
                dict2[sArray[i]] = 1
                dictArray.append(dict2)
                return dictArray
            }
            print(sArray[i])
        }
        print("Dict Array:\(dictArray)")
        return dictArray
    }

//print("dict:\(formDictFromString("ffrrriiiccckkkussss"))")

func createNewStringFromDict(arrayOfDicts:[[Character:Int]]) -> String {
    
    var newCharArray = [String]()
    
    for i in 0 ..< arrayOfDicts.count {
        let dict = arrayOfDicts[i]
        let dictKey = dict.first?.0
        let dictVal = dict.first?.1
        newCharArray.append(String(dictKey!))
        newCharArray.append(String(dictVal!))
    }
    return newCharArray.joinWithSeparator("")
}

func stringCompression(input:String) -> String {
    
    let dict = formDictFromString(input)
    
    let newString = createNewStringFromDict(dict)
    
    return newString.characters.count < input.characters.count ? newString : input
}

//stringCompression("head")

//7. Rotate Matrix - Given an image represented by an NxN matrix where each pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees. Can you do this in place?

var matrix = [["a", "b", "c","m"],  //i = 0
              ["d","e","f","m"],    //i = 1
              ["g","h","i","m"],
              ["j","k","l","m"]]    //i = 2

func rotateMatrix(matrix:[[String]]) -> [[String]]{
    
    let n = matrix.count
    //print(n)
    
    var newMatrix = [[String]]()
    
    //take the nth element of EACH separate array...form a new array with them inserting each new element at the front
    
    for i in 0 ..< n {//loop through array of arrays
        var newArr = [String]()
        for j in 0 ..< matrix[i].count{  //loop through single array
            let element = matrix[j][i] //print matrix element 0,1,2 in matrix 0
            //print("Element i:\(i) in matrix j:\(j) element:\(element)")
            newArr.insert(element, atIndex: newArr.startIndex)
        }
        newMatrix.insert(newArr, atIndex: newMatrix.endIndex)
    }
    //put that array of nth element in n of new matrix
    //print(newMatrix)
    return newMatrix
}

//rotateMatrix(matrix)

//8. Zero Matrix - write an algorithm such that if an element in an MxN matrix is 0, its entire row and column are set to 0

var mnMatrix = [["a","b","c"],    //M = 2   M x N
                ["d","e","f"],
                ["g","h","i"],
                ["j","k","l"]]    //N = 3

let m = mnMatrix.count              //row
let n = mnMatrix.first?.count       //column

//i choose "c" and I want to print the 1. the row "c" is in and 2. the column "c" is in. 
//Every thing in column "c" will have the same x value and all the columns will have the same y value


// "c" (0,2)

var valueArray = [String]()

for i in 0 ..< m {
    for j in 0 ..< n! {
        if i == 0 || j == 2 {
        valueArray.append(mnMatrix[i][j])
        mnMatrix[i][j] = "X"
        }
    }
}
//print(mnMatrix)
//print


func changeValueAtRowAndColumn(matrix:[[String]], toNewString:String, row:Int, column:Int) -> [[String]]{
    
    var matrix1 = matrix
    
    let x = toNewString
    let m = matrix.count
    let n = matrix.first?.count
    
    for i in 0 ..< m {
        for j in 0 ..< n! {
            if i == row || j == column {
                matrix1[i][j] = x
            }
        }
    }
    print(matrix1)
    return matrix1
}

//changeValueAtRowAndColumn(mnMatrix, toNewString: "0", row: 0, column: 2)


//9. String Rotation - Assume you have a method isSubstring checks if word is substring of another. Given two strings s1 and s2 write code to check if s2 is a rotation of s1 using one call to isSubstring
//ex: "waterbottle" is a rotation of "erbottlewat"

func isSubstring(str1:String, str2:String) -> Bool {
    
    var strArray = Array(str1.characters)
    let length = strArray.count
    
    for _ in length.stride(to: 1, by: -1) {
        
        let element = strArray.removeLast()
        
        strArray.insert(element, atIndex: 0)
        
        if String(strArray) == str2 {
            return true
        }
    }
    return false
}

//isSubstring("pirate", str2: "ratepi")

//Sudoku Board Checker problem

let sudokuBoard: [[Int]] =  [[1,2,3,4,5,6,7,8,9], // [(0,0) ... (0,3) ... (0,6)]
    [4,5,6,7,8,9,1,2,3],
    [7,8,9,1,2,3,4,5,6],
    [2,3,4,5,6,7,8,9,1], // [(3,0) ... (3,3) ... (3,6)]
    [5,6,7,8,9,1,2,3,4],
    [8,9,1,2,3,4,5,6,7],
    [9,1,2,3,4,5,6,7,8], // [(6,0) ... (6,3) ... (6,6)]
    [3,4,5,6,7,8,9,1,2],
    [6,7,8,9,1,2,3,4,5]]

// Sudoku Board Checker - given a sudoku board, check if it's valid
//1. number must not be in same column
//2. number must not be in same row
//3. number must not be in same box

func checkSudokuBoard(sudokuBoard:[[Int]]) -> Bool{
    
    return checkColumns(sudokuBoard) && checkRows(sudokuBoard) && checkBoxes(sudokuBoard)
}

func checkRows(sudokuBoard:[[Int]]) -> Bool {
    
    let column = sudokuBoard.first!.count
    let row = sudokuBoard.count
    
    for i in 0 ..< row {
        var valid: Set<Int> = [1,2,3,4,5,6,7,8,9]
        for j in 0 ..< column {
            let value = sudokuBoard[i][j]
            //print(value)
            valid.remove(value)
        }
        if !valid.isEmpty { return false }
    }
    
    return true
}

func checkColumns(sudokuBoard:[[Int]]) -> Bool {
    
    let column = sudokuBoard.first!.count
    let row = sudokuBoard.count
    
    for i in 0 ..< row {
        var valid: Set<Int> = [1,2,3,4,5,6,7,8,9]
        for j in 0 ..< column {
            let value = sudokuBoard[j][i]
            //print("\(j),\(i),:\(value)")
            valid.remove(value)
        }
        //print("\n")
        if !valid.isEmpty { return false }
    }
    
    return true
}

func checkBoxes(sudokuBoard:[[Int]]) -> Bool {
    
    let column = sudokuBoard.first!.count
    let row = sudokuBoard.count
    let valid: Set<Int> = [1,2,3,4,5,6,7,8,9]
    
    for i in 0 ..< row {
        for j in 0 ..< column {
            if i % 3 == 0 && j % 3 == 0 {
                let box = printMatrixBox(sudokuBoard, startRow: i, startCol: j)
                if valid == Set(box){
                    return true
                }
            }
        }
    }
    return false
}

func printMatrixBox(sudokuBoard:[[Int]], startRow:Int, startCol:Int) -> [Int] {
    
    var numbers = [Int]()
    
    for i in 0 ..< 3 {
        for j in 0 ..< 3{
            numbers.append(sudokuBoard[startRow+i][startCol+j])
        }
    }
    print("Numbers:\(numbers)")
    return numbers
}


checkSudokuBoard(sudokuBoard)


