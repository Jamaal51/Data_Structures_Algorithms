//: Playground - noun: a place where people can play

import UIKit

class Node<T:Equatable> {
    var value: T? = nil
    var next: Node? = nil
    //var prev: Node? = nil
    
    init(value: T){
        self.value = value
    }
}

class LinkedList<T:Equatable> {
    //var count: Int = 0
    var head = Node<T>?()
    //var tail: Node<T>?
    
    init(head: Node<T>){
        self.head = head
    }
    
    //Linked List methods
    
    func insert(value:T){
        //find to see if empty list
        if self.head!.value == nil{
            self.head!.value = value
        } else {
            //find the last node without a value
            var lastNode = self.head
            while lastNode!.next != nil {
                lastNode = lastNode!.next!
            }
            //once found, create a new node and connect the linked list
            let newNode = Node<T>(value: value)
            lastNode!.next = newNode
        }
    }
}

let newList = LinkedList(head: Node(value: 5))


newList.insert(4)

//newList.insert(4)
//newList.insert(3)

print(newList)

