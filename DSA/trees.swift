//
//  trees.swift
//  DSA
//
//  Created by Soufiane on 05/12/2024.
//

class node: Equatable {
    var left: node?
    var right: node?
    var value: Int
    init(value: Int, left: node? = nil, right: node? = nil) {
        self.left = left
        self.right = right
        self.value = value
    }

    static func == (lhs: node, rhs: node) -> Bool {
        return lhs === rhs
    }
}

func traversePreorder(root: node?, visit: (Int) -> Void = { print($0) }) {
    guard let root = root else { return }

    visit(root.value)
    traversePreorder(root: root.left, visit: visit)
    traversePreorder(root: root.right, visit: visit)
}

func traverseInorder(root: node?, visit: (node) -> Void = { print($0.value) }) {
    guard let root = root else { return }

    traverseInorder(root: root.left, visit: visit)
    visit(root)
    traverseInorder(root: root.right, visit: visit)
}

func traversePostorder(root: node?, visit: (Int) -> Void = { print($0) }) {
    guard let root = root else { return }

    traversePostorder(root: root.left, visit: visit)
    traversePostorder(root: root.right, visit: visit)
    visit(root.value)
}

func buildTreeFromArray(array: [Int?], index: Int) -> node? {
    guard index < array.count, let value = array[index] else { return nil }

    let left = index * 2 + 1
    let right = index * 2 + 2

    let leftNode = buildTreeFromArray(array: array, index: left)
    let rightNode = buildTreeFromArray(array: array, index: right)

    let root = node(value: value, left: leftNode, right: rightNode)

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

func treeIsBalanced(tree: node?) -> Bool {
    func TreeHeights(tree: node?) -> Int {
        guard let tree = tree else { return 0 }

        let rightHeight = TreeHeights(tree: tree.right)
        if rightHeight == -1 { return -1 }
        let leftHeight = TreeHeights(tree: tree.left)
        if leftHeight == -1 { return -1 }

        if abs(rightHeight - leftHeight) > 1 {
            return -1
        }

        return 1 + max(rightHeight, leftHeight)
    }

    return TreeHeights(tree: tree) != -1
}

func lowestCommonAncestor(tree: node?, node1: node?, node2: node?) -> node? {
    guard let tree = tree else { return nil }
    if tree == node1 || tree == node2 {
        return tree
    }
    let leftLCA = lowestCommonAncestor(
        tree: tree.left, node1: node1, node2: node2)
    let rightLCA = lowestCommonAncestor(
        tree: tree.right, node1: node1, node2: node2)

    if leftLCA != nil, rightLCA != nil {
        return tree
    }
    return leftLCA ?? rightLCA
}

func preorderSerializeTree(tree: node?) -> [Int?] {
    var result: [Int?] = []
    func walkTree(tree: node?) {
        guard let tree = tree else {
            result.append(nil)
            return
        }
        result.append(tree.value)
        walkTree(tree: tree.left)
        walkTree(tree: tree.right)
    }
    walkTree(tree: tree)
    return result
}

func levelOrderSerializationTree(tree: node?) -> [Int?] {
    var result: [Int?] = []
    var queue: [node?] = [tree]

    while !queue.isEmpty {
        let current = queue.removeFirst()
        if let currentNode = current {
            result.append(currentNode.value)
            queue.append(currentNode.left)
            queue.append(currentNode.right)
        } else {
            result.append(nil)
        }
    }
    // Remove trailing nil values
    while let last = result.last, last == nil {
        result.removeLast()
    }
    return result
}

func preorderDeserialize(array: [Int?]) -> node? {
    var index: Int = 0
    func walkTree(array: [Int?]) -> node? {
        guard array.count > index, let value = array[index] else {
            index += 1
            return nil
        }
        let tree: node = node(value: value)

        index += 1
        tree.left = walkTree(array: array)
        tree.right = walkTree(array: array)
        return tree

    }
    return walkTree(array: array)
}

func insertBSTNode(tree: node?, value: Int) -> node? {
    guard let tree else { return node(value: value) }

    if value < tree.value {
        tree.left = insertBSTNode(tree: tree.left, value: value)
    } else {
        tree.right = insertBSTNode(tree: tree.right, value: value)
    }
    return tree
}

func searchBSTNode(tree: node?, value: Int) -> node? {
    guard let tree else { return nil }
    if tree.value == value {
        return tree
    }
    if value < tree.value {
        return searchBSTNode(tree: tree.left, value: value)
    } else {
        return searchBSTNode(tree: tree.right, value: value)
    }
}

func deleteBSTNode(tree: node?, value: Int) -> node? {
    guard let tree = tree else { return nil }

    if value < tree.value {
        tree.left = deleteBSTNode(tree: tree.left, value: value)
    } else if value > tree.value {
        tree.right = deleteBSTNode(tree: tree.right, value: value)
    } else {
        if tree.left == nil, tree.right == nil {
            return nil
        }
        if tree.right == nil {
            return tree.left
        }
        if tree.left == nil {
            return tree.right
        }

        if let successor = findMinBST(tree: tree.right) {
            tree.value = successor.value
            tree.right = deleteBSTNode(tree: tree.right, value: successor.value)
        }
    }
    return tree
}

func findMinBST(tree: node?) -> node? {
    var current = tree
    while let next = current!.left {
        current = next
    }
    return current
}

func findMaxBST(tree: node?) -> node? {
    var current = tree
    while let next = current?.right {
        current = next
    }
    return current
}
