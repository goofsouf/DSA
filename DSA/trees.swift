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

func traversePostorder(root: node?, visit: (Int) -> Void = { print($0) }) {
    guard let root = root else { return }

    traversePostorder(root: root.left, visit: visit)
    traversePostorder(root: root.right, visit: visit)
    visit(root.value)
}

func buildTreeFromArray(array: [Int], index: Int) -> node? {
    guard index < array.count else { return nil }

    let left = index * 2 + 1
    let right = index * 2 + 2

    let leftNode = buildTreeFromArray(array: array, index: left)
    let rightNode = buildTreeFromArray(array: array, index: right)

    let root = node(value: array[index], left: leftNode, right: rightNode)

    return root
}

func TreeHeight(tree: node?) -> Int {
    guard let tree = tree else { return 0 }

    return 1 + max(TreeHeight(tree: tree.left), TreeHeight(tree: tree.right))
}

func TreeDiameter(tree: node?) -> Int {
    var maxDiameter = 0

    func walkTree(tree: node?) -> Int {
        guard let tree = tree else { return 0 }
        let leftDiameter = walkTree(tree: tree.left)
        let rightDiameter = walkTree(tree: tree.right)

        maxDiameter = max(maxDiameter, leftDiameter + rightDiameter)

        return 1 + max(leftDiameter, rightDiameter)
    }

    _ = walkTree(tree: tree)
    return maxDiameter
}
