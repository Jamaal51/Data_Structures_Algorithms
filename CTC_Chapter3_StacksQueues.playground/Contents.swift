//: Playground - noun: a place where people can play

import UIKit

// http://alejandromp.com/blog/2015/9/4/swift-stack-for-fun/

// http://waynewbishop.com/swift/stacks-queues

//Stacks

public struct Stack<T:Comparable> {          //implement stack with public struct - just a wrapper on arrays
    
    private var array = [T]()     //create var array of type
    private var minArray = [T]()  //array of mins
    
    public var isEmpty: Bool {
        return array.isEmpty     //returns true if array is empty, false if not
    }
    
    public var count: Int {
        return array.count       //returns the count of the array
    }
    
    public mutating func push(element: T) { //mutating func - push appends element to top of stack
        array.append(element)
        if minArray.isEmpty {
            minArray.append(element)
        } else if element < minArray.last {
            minArray.append(element)
        }
    }
    
    public mutating func pop() -> T? { //mutating = pop removes last index in array (ie - top of stack)
        if array.last == minArray.last {
          minArray.removeLast()
        }
        return array.popLast()
    }
    
    public func peek() -> T? {      //peek returns last value in array
        return array.last
    }
    
    public func min() -> T? {
        return minArray.last
    }
}

//Queues

public struct Queue<T> {
    private var array = [T]()      //implement a queue with public struct - just a wrapper on arrays
    
    public var isEmpty: Bool {      //returns true if empty, false if contains elements
        return array.isEmpty
    }
    
    public var count: Int {           //returns count
        return array.count
    }
    
    public mutating func enqueue(element: T) {    //enqueue appends element to end of queue
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {          //dequeue removes first element in queue
        if isEmpty {
            return nil                              //if empty returns nil
        } else {
            return array.removeFirst()
        }
    }
    public func peek() -> T? {          //returns first element in queue
        return array.first
    }
}

/*
 Stack and Queues Questions
 
 1. Check for balanced parentheses in an expression - Given an expression string exp, write a program to examine whether the pairs and the orders of “{“,”}”,”(“,”)”,”[“,”]” are correct in exp. For example, the program should print true for exp = “[()]{}{[()()]()}” and false for exp = “[(])”

    1) Declare a character stack S.
    2) Now traverse the expression string exp.
        a) If the current character is a starting bracket (‘(‘ or ‘{‘ or ‘[‘) then push it to stack.
        b) If the current character is a closing bracket (‘)’ or ‘}’ or ‘]’) then pop from stack and if the popped character is the matching starting bracket then fine else parenthesis are not balanced.
    -need isMatchingPair func
    3) After complete traversal, if there is some starting bracket left in stack then “not balanced”
 
 2. Evaluation of Postfix Expression - The expressions written in postfix form are evaluated faster compared to infix notation as parenthesis are not required in postfix
 
    1) Create a stack to store operands (or values).
    2) Scan the given expression and do following for every scanned element.
        a) If the element is a number, push it into the stack
        b) If the element is a operator, pop operands for the operator from stack. Evaluate the operator and push the result back to the stack
    3) When the expression is ended, the number in the stack is the final answer

*/

// 1. Reverse a string using a stack

func reverseString(str:String) -> String {
    
    var myStack = Stack<Character>()
    var stringArray = Array(str.characters)
    var reversed = Array<Character>()
    
    for i in 0..<stringArray.count {
        myStack.push(stringArray[i])
    }
    
    for _ in 0..<myStack.count{
        let char = myStack.pop()
        reversed.append(char!)
    }
    
    let revString = String(reversed)
    
    return revString
}

//reverseString("tomorrow")

// 2. 2. Evaluation of Postfix Expression - The expressions written in postfix form are evaluated faster compared to infix notation as parenthesis are not required in postfix
// 235*8++

func evaluatePostfixExp(postFixString:String) -> String? {
    
    var myStack = Stack<Character>()
    
    var stringArray = Array(postFixString.characters)
  
    for i in 0..<stringArray.count{
        if stringArray[i] > "0" && stringArray[i] < "9" {
            myStack.push(stringArray[i])
        } else if stringArray[i] == "*" || stringArray[i] == "/" || stringArray[i] == "+" || stringArray[i] == "-"{
            let first = myStack.pop()
            let second = myStack.pop()
            let new = performOperation(first!, second: second!, operation: stringArray[i])
            let newChar = String(new!)
            myStack.push(Character(newChar))
        }
    }
    return String(myStack.peek())
}

func performOperation(first:Character, second:Character, operation:Character) -> Int? {
    let a = String(first)
    let b = String(second)
    let operatorLoc = String(operation)
    
    if operatorLoc == "+" {
        return Int(a)! + Int(b)!
    } else if operatorLoc == "-" {
        return Int(a)! - Int(b)!
    } else if operatorLoc == "*" {
        return Int(a)! * Int(b)!
    } else if operatorLoc == "/" {
        return Int(a)! / Int(b)!
    }
    return nil
}

//evaluatePostfixExp("23+6-7")

// 3. Check for balanced parentheses in an expression - Given an expression string exp, write a program to examine whether the pairs and the orders of “{“,”}”,”(“,”)”,”[“,”]” are correct.

func areMatchingParens(first:Character, second:Character) -> Bool {
    if first == "[" && second == "]" {
        return true
    } else if first == "(" && second == ")" {
        return true
    } else if first == "{" && second == "}" {
        return true
    }
    return false
}
func checkIfParensBalanced(str:String) -> Bool {
    
    var myStack = Stack<Character>()
    
    let strArray = Array(str.characters)
    
    for i in 0..<strArray.count {
        if strArray[i] == "[" || strArray[i] == "(" || strArray[i] == "{" {
            myStack.push(strArray[i])
        } else if strArray[i] == "]" || strArray[i] == ")" || strArray[i] == "}" {
            if !myStack.isEmpty {
                let top = myStack.pop()
                print(top, strArray[i])
                let matching = areMatchingParens(top!, second: strArray[i])
                if !matching {
                    return false
                }
            } else if myStack.isEmpty{
                return false
            }
        }
    }
    return myStack.isEmpty
}

//checkIfParensBalanced("[()]{}{[()()]()}")

var newStack = Stack<Int>()

newStack.push(4)
newStack.push(3)
newStack.push(10)
newStack.min()
newStack.push(2)
newStack.min()


