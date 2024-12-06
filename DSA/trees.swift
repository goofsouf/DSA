//
//  trees.swift
//  DSA
//
//  Created by Soufiane on 05/12/2024.
//

class node {
    var left: node?
    var right: node?
    var value: Int
    init(value: Int, left: node? = nil, right: node? = nil) {
        self.left = left
        self.right = right
        self.value = value
    }
}

func traversePreorder(root: node?, visit: (Int) -> Void = { print($0) }) {
    guard let root = root else { return }

    visit(root.value)
    traversePreorder(root: root.left, visit: visit)
    traversePreorder(root: root.right, visit: visit)
}

func traverseInorder(root: node?, visit: (Int) -> Void = { print($0) }) {
    guard let root = root else { return }

    traverseInorder(root: root.left, visit: visit)
    visit(root.value)
    traverseInorder(root: root.right, visit: visit)
}

func traversePostorder(root: node?, visit: (Int) -> Void = { print($0)}){
    guard let root = root else { return }
    
    traversePostorder(root: root.left, visit: visit)
    traversePostorder(root: root.right, visit: visit)
    visit(root.value)
}
