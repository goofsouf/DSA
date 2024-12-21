//
//  trees.swift
//  DSA
//
//  Created by Soufiane on 05/12/2024.
//

/// A class representing a node in a binary tree.
class node: Equatable {
    var left: node?
    var right: node?
    var value: Int

    /// Initializes a new tree node.
    /// - Parameters:
    ///   - value: The value of the node.
    ///   - left: The left child node (optional).
    ///   - right: The right child node (optional).
    init(value: Int, left: node? = nil, right: node? = nil) {
        self.left = left
        self.right = right
        self.value = value
    }

    /// Compares two nodes for equality.
    /// - Parameters:
    ///   - lhs: The first node.
    ///   - rhs: The second node.
    /// - Returns: `true` if the nodes are identical, otherwise `false`.
    static func == (lhs: node, rhs: node) -> Bool {
        return lhs === rhs
    }
}

/// Performs a preorder traversal of a binary tree.
/// - Parameters:
///   - root: The root of the tree.
///   - visit: A closure to process each visited node.
func traversePreorder(root: node?, visit: (Int) -> Void = { print($0) }) {
    guard let root = root else { return }
    visit(root.value)
    traversePreorder(root: root.left, visit: visit)
    traversePreorder(root: root.right, visit: visit)
}

/// Performs an inorder traversal of a binary tree.
/// - Parameters:
///   - root: The root of the tree.
///   - visit: A closure to process each visited node.
func traverseInorder(root: node?, visit: (node) -> Void = { print($0.value) }) {
    guard let root = root else { return }
    traverseInorder(root: root.left, visit: visit)
    visit(root)
    traverseInorder(root: root.right, visit: visit)
}

/// Performs a postorder traversal of a binary tree.
/// - Parameters:
///   - root: The root of the tree.
///   - visit: A closure to process each visited node.
func traversePostorder(root: node?, visit: (Int) -> Void = { print($0) }) {
    guard let root = root else { return }
    traversePostorder(root: root.left, visit: visit)
    traversePostorder(root: root.right, visit: visit)
    visit(root.value)
}

/// Builds a binary tree from an array representation.
/// - Parameters:
///   - array: The array containing values (use `nil` for empty nodes).
///   - index: The starting index in the array.
/// - Returns: The root of the constructed tree.
func buildTreeFromArray(array: [Int?], index: Int) -> node? {
    guard index < array.count, let value = array[index] else { return nil }
    let leftNode = buildTreeFromArray(array: array, index: 2 * index + 1)
    let rightNode = buildTreeFromArray(array: array, index: 2 * index + 2)
    return node(value: value, left: leftNode, right: rightNode)
}

/// Computes the height of a binary tree.
/// - Parameter tree: The root of the tree.
/// - Returns: The height of the tree.
func TreeHeight(tree: node?) -> Int {
    guard let tree = tree else { return 0 }
    return 1 + max(TreeHeight(tree: tree.left), TreeHeight(tree: tree.right))
}

/// Computes the diameter (longest path) of a binary tree.
/// - Parameter tree: The root of the tree.
/// - Returns: The diameter of the tree.
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

/// Checks if a binary tree is balanced.
/// - Parameter tree: The root of the tree.
/// - Returns: `true` if the tree is balanced, otherwise `false`.
func treeIsBalanced(tree: node?) -> Bool {
    func TreeHeights(tree: node?) -> Int {
        guard let tree = tree else { return 0 }
        let rightHeight = TreeHeights(tree: tree.right)
        if rightHeight == -1 { return -1 }
        let leftHeight = TreeHeights(tree: tree.left)
        if leftHeight == -1 { return -1 }
        if abs(rightHeight - leftHeight) > 1 { return -1 }
        return 1 + max(rightHeight, leftHeight)
    }
    return TreeHeights(tree: tree) != -1
}

/// Finds the lowest common ancestor (LCA) of two nodes in a binary tree.
/// - Parameters:
///   - tree: The root of the tree.
///   - node1: The first node.
///   - node2: The second node.
/// - Returns: The LCA node if both nodes exist, otherwise `nil`.
func lowestCommonAncestor(tree: node?, node1: node?, node2: node?) -> node? {
    guard let tree = tree else { return nil }
    if tree == node1 || tree == node2 { return tree }
    let leftLCA = lowestCommonAncestor(
        tree: tree.left, node1: node1, node2: node2)
    let rightLCA = lowestCommonAncestor(
        tree: tree.right, node1: node1, node2: node2)
    if leftLCA != nil, rightLCA != nil { return tree }
    return leftLCA ?? rightLCA
}

/// Serializes a binary tree into a preorder array representation.
/// - Parameter tree: The root of the tree.
/// - Returns: An array representing the tree.
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

/// Deserializes a binary tree from a preorder array representation.
/// - Parameter array: The array containing values.
/// - Returns: The root of the deserialized tree.
func preorderDeserialize(array: [Int?]) -> node? {
    var index = 0
    func walkTree(array: [Int?]) -> node? {
        guard array.count > index, let value = array[index] else {
            index += 1
            return nil
        }
        let tree = node(value: value)
        index += 1
        tree.left = walkTree(array: array)
        tree.right = walkTree(array: array)
        return tree
    }
    return walkTree(array: array)
}
