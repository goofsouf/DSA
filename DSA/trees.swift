//
//  trees.swift
//  DSA
//
//  Created by Soufiane on 05/12/2024.
//
/// A class representing a node in a binary tree.
class node: Equatable {
    var left: node?  // The left child node.
    var right: node?  // The right child node.
    var value: Int  // The value stored in the node.

    /// Initializes a new binary tree node.
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
    ///   - lhs: The first node to compare.
    ///   - rhs: The second node to compare.
    /// - Returns: `true` if the two nodes are the same instance, otherwise `false`.
    static func == (lhs: node, rhs: node) -> Bool {
        return lhs === rhs
    }
}

// MARK: Preorder Traversal
/// Performs a preorder traversal of a binary tree (root, left, right).
/// - Parameters:
///   - root: The root of the tree.
///   - visit: A closure to process each visited node (default is to print the value).
func traversePreorder(root: node?, visit: (Int) -> Void = { print($0) }) {
    guard let root = root else { return }  // Base case: return if the node is nil.

    visit(root.value)  // Visit the current node.
    traversePreorder(root: root.left, visit: visit)  // Recursively traverse the left subtree.
    traversePreorder(root: root.right, visit: visit)  // Recursively traverse the right subtree.
}

// MARK: Inorder Traversal
/// Performs an inorder traversal of a binary tree (left, root, right).
/// - Parameters:
///   - root: The root of the tree.
///   - visit: A closure to process each visited node (default is to print the node's value).
func traverseInorder(root: node?, visit: (node) -> Void = { print($0.value) }) {
    guard let root = root else { return }  // Base case: return if the node is nil.

    traverseInorder(root: root.left, visit: visit)  // Recursively traverse the left subtree.
    visit(root)  // Visit the current node.
    traverseInorder(root: root.right, visit: visit)  // Recursively traverse the right subtree.
}

// MARK: Postorder Traversal
/// Performs a postorder traversal of a binary tree (left, right, root).
/// - Parameters:
///   - root: The root of the tree.
///   - visit: A closure to process each visited node (default is to print the value).
func traversePostorder(root: node?, visit: (Int) -> Void = { print($0) }) {
    guard let root = root else { return }  // Base case: return if the node is nil.

    traversePostorder(root: root.left, visit: visit)  // Recursively traverse the left subtree.
    traversePostorder(root: root.right, visit: visit)  // Recursively traverse the right subtree.
    visit(root.value)  // Visit the current node.
}

// MARK: Build Tree from Array
/// Builds a binary tree from a level-order array representation.
/// - Parameters:
///   - array: The array containing the level-order representation of the tree. Use `nil` for missing nodes.
///   - index: The current index in the array being processed.
/// - Returns: The root node of the constructed binary tree.
func buildTreeFromArray(array: [Int?], index: Int) -> node? {
    guard index < array.count, let value = array[index] else { return nil }  // Return nil if the index is out of bounds or the value is `nil`.

    let left = index * 2 + 1  // Calculate the index of the left child.
    let right = index * 2 + 2  // Calculate the index of the right child.

    // Recursively build the left and right subtrees.
    let leftNode = buildTreeFromArray(array: array, index: left)
    let rightNode = buildTreeFromArray(array: array, index: right)

    // Create the root node with its left and right children.
    let root = node(value: value, left: leftNode, right: rightNode)
    return root
}

// MARK: Tree Height
/// Calculates the height of a binary tree.
/// - Parameter tree: The root node of the tree.
/// - Returns: The height of the tree. A tree with only one node has a height of 1.
func TreeHeight(tree: node?) -> Int {
    guard let tree = tree else { return 0 }  // Base case: the height of an empty tree is 0.

    // Calculate the height of the tree as 1 + the maximum height of its subtrees.
    return 1 + max(TreeHeight(tree: tree.left), TreeHeight(tree: tree.right))
}

// MARK: Tree Diameter
/// Calculates the diameter of a binary tree.
/// The diameter is the length of the longest path between any two nodes in the tree (measured in edges).
/// - Parameter tree: The root node of the tree.
/// - Returns: The diameter of the tree.
func TreeDiameter(tree: node?) -> Int {
    var maxDiameter = 0  // Variable to store the maximum diameter encountered.

    /// Helper function to calculate the height of the tree while updating the maximum diameter.
    /// - Parameter tree: The current node.
    /// - Returns: The height of the subtree rooted at the current node.
    func walkTree(tree: node?) -> Int {
        guard let tree = tree else { return 0 }  // Base case: the height of an empty tree is 0.

        // Calculate the heights of the left and right subtrees.
        let leftDiameter = walkTree(tree: tree.left)
        let rightDiameter = walkTree(tree: tree.right)

        // Update the maximum diameter with the sum of the left and right subtree heights.
        maxDiameter = max(maxDiameter, leftDiameter + rightDiameter)

        // Return the height of the current subtree.
        return 1 + max(leftDiameter, rightDiameter)
    }

    _ = walkTree(tree: tree)  // Start the recursive traversal to calculate the diameter.
    return maxDiameter
}

// MARK: Tree Balance Check
/// Checks if a binary tree is balanced.
/// A balanced tree is defined as one where the height difference between the left and right subtrees of every node is at most 1.
/// - Parameter tree: The root node of the tree.
/// - Returns: `true` if the tree is balanced, otherwise `false`.
func treeIsBalanced(tree: node?) -> Bool {
    /// Helper function to calculate the height of the tree while detecting imbalance.
    /// - Parameter tree: The current node.
    /// - Returns: The height of the subtree, or -1 if it is imbalanced.
    func TreeHeights(tree: node?) -> Int {
        guard let tree = tree else { return 0 }  // Base case: the height of an empty tree is 0.

        // Recursively calculate the heights of the right and left subtrees.
        let rightHeight = TreeHeights(tree: tree.right)
        if rightHeight == -1 { return -1 }  // Early return if the right subtree is imbalanced.
        let leftHeight = TreeHeights(tree: tree.left)
        if leftHeight == -1 { return -1 }  // Early return if the left subtree is imbalanced.

        // Check the height difference for the current node.
        if abs(rightHeight - leftHeight) > 1 {
            return -1  // Mark the tree as imbalanced.
        }

        // Return the height of the current subtree.
        return 1 + max(rightHeight, leftHeight)
    }

    return TreeHeights(tree: tree) != -1  // The tree is balanced if the helper function does not return -1.
}

// MARK: Lowest Common Ancestor
/// Finds the lowest common ancestor (LCA) of two nodes in a binary tree.
/// The LCA is the deepest node that is an ancestor of both `node1` and `node2`.
/// - Parameters:
///   - tree: The root node of the tree.
///   - node1: The first node.
///   - node2: The second node.
/// - Returns: The lowest common ancestor node, or `nil` if one or both nodes are not present in the tree.
func lowestCommonAncestor(tree: node?, node1: node?, node2: node?) -> node? {
    guard let tree = tree else { return nil }  // Base case: if the tree is empty, return nil.

    // If the current node matches either of the target nodes, return it as a potential LCA.
    if tree == node1 || tree == node2 {
        return tree
    }

    // Recursively find the LCA in the left and right subtrees.
    let leftLCA = lowestCommonAncestor(
        tree: tree.left, node1: node1, node2: node2)
    let rightLCA = lowestCommonAncestor(
        tree: tree.right, node1: node1, node2: node2)

    // If both subtrees return non-nil values, the current node is the LCA.
    if leftLCA != nil, rightLCA != nil {
        return tree
    }

    // Otherwise, return the non-nil subtree (if any), or nil if neither contains the nodes.
    return leftLCA ?? rightLCA
}

// MARK: Preorder Serialization
/// Serializes a binary tree into a list using preorder traversal (root, left, right).
/// Missing nodes are represented as `nil`.
/// - Parameter tree: The root node of the tree.
/// - Returns: A list of integers and `nil` values representing the serialized tree.
func preorderSerializeTree(tree: node?) -> [Int?] {
    var result: [Int?] = []  // Array to store the serialized tree.

    /// Helper function for recursive preorder traversal.
    /// - Parameter tree: The current node.
    func walkTree(tree: node?) {
        guard let tree = tree else {
            result.append(nil)  // Append `nil` for missing nodes.
            return
        }
        result.append(tree.value)  // Append the current node's value.
        walkTree(tree: tree.left)  // Traverse the left subtree.
        walkTree(tree: tree.right)  // Traverse the right subtree.
    }

    walkTree(tree: tree)  // Start traversal from the root.
    return result
}

// MARK: Level Order Serialization
/// Serializes a binary tree into a list using level-order traversal (breadth-first).
/// Missing nodes are represented as `nil`.
/// - Parameter tree: The root node of the tree.
/// - Returns: A list of integers and `nil` values representing the serialized tree.
func levelOrderSerializationTree(tree: node?) -> [Int?] {
    var result: [Int?] = []  // Array to store the serialized tree.
    var queue: [node?] = [tree]  // Queue for level-order traversal, initialized with the root.

    // Perform level-order traversal.
    while !queue.isEmpty {
        let current = queue.removeFirst()  // Dequeue the next node.
        if let currentNode = current {
            result.append(currentNode.value)  // Append the node's value.
            queue.append(currentNode.left)  // Enqueue the left child.
            queue.append(currentNode.right)  // Enqueue the right child.
        } else {
            result.append(nil)  // Append `nil` for missing nodes.
        }
    }

    // Remove trailing `nil` values from the serialized output.
    while let last = result.last, last == nil {
        result.removeLast()
    }

    return result
}

// MARK: Preorder Deserialization
/// Deserializes a binary tree from a preorder traversal array representation (root, left, right).
/// Missing nodes are represented as `nil`.
/// - Parameter array: The array containing the serialized tree.
/// - Returns: The root node of the deserialized binary tree.
func preorderDeserialize(array: [Int?]) -> node? {
    var index: Int = 0  // Index tracker for the current position in the array.

    /// Helper function for recursive deserialization.
    /// - Parameter array: The array being processed.
    /// - Returns: The root node of the subtree.
    func walkTree(array: [Int?]) -> node? {
        // Check if the index is within bounds and the current value is not nil.
        guard array.count > index, let value = array[index] else {
            index += 1  // Increment the index for a `nil` placeholder.
            return nil  // Return nil for missing nodes.
        }
        let tree: node = node(value: value)  // Create a new node with the current value.

        index += 1  // Increment the index to process the left child.
        tree.left = walkTree(array: array)  // Recursively build the left subtree.
        tree.right = walkTree(array: array)  // Recursively build the right subtree.
        return tree
    }

    return walkTree(array: array)  // Start the recursive deserialization.
}

// MARK: Insert Node in BST
/// Inserts a value into a Binary Search Tree (BST).
/// - Parameters:
///   - tree: The root node of the BST.
///   - value: The value to insert.
/// - Returns: The root node of the updated BST.
func insertBSTNode(tree: node?, value: Int) -> node? {
    guard let tree else { return node(value: value) }  // If the tree is empty, create a new node.

    // Traverse the tree based on the value's comparison with the current node.
    if value < tree.value {
        tree.left = insertBSTNode(tree: tree.left, value: value)  // Insert into the left subtree.
    } else {
        tree.right = insertBSTNode(tree: tree.right, value: value)  // Insert into the right subtree.
    }
    return tree  // Return the updated root node.
}

// MARK: Search in BST
/// Searches for a value in a Binary Search Tree (BST).
/// - Parameters:
///   - tree: The root node of the BST.
///   - value: The value to search for.
/// - Returns: The node containing the value, or `nil` if the value is not found.
func searchBSTNode(tree: node?, value: Int) -> node? {
    guard let tree else { return nil }  // If the tree is empty, return nil.
    if tree.value == value {
        return tree  // Return the node if its value matches the search value.
    }
    // Traverse the tree based on the value's comparison with the current node.
    if value < tree.value {
        return searchBSTNode(tree: tree.left, value: value)  // Search in the left subtree.
    } else {
        return searchBSTNode(tree: tree.right, value: value)  // Search in the right subtree.
    }
}

// MARK: Delete Node from BST
/// Deletes a value from a Binary Search Tree (BST).
/// - Parameters:
///   - tree: The root node of the BST.
///   - value: The value to delete.
/// - Returns: The root node of the updated BST after deletion.
func deleteBSTNode(tree: node?, value: Int) -> node? {
    guard let tree = tree else { return nil }  // If the tree is empty, return nil.

    // Traverse the tree based on the value's comparison with the current node.
    if value < tree.value {
        tree.left = deleteBSTNode(tree: tree.left, value: value)  // Delete from the left subtree.
    } else if value > tree.value {
        tree.right = deleteBSTNode(tree: tree.right, value: value)  // Delete from the right subtree.
    } else {
        // If the node has no children, remove it.
        if tree.left == nil, tree.right == nil {
            return nil
        }
        // If the node has only one child, return the non-nil child.
        if tree.right == nil {
            return tree.left
        }
        if tree.left == nil {
            return tree.right
        }

        // If the node has two children, replace its value with the inorder successor's value.
        if let successor = findMinBST(tree: tree.right) {
            tree.value = successor.value  // Replace the value.
            // Delete the inorder successor from the right subtree.
            tree.right = deleteBSTNode(tree: tree.right, value: successor.value)
        }
    }
    return tree  // Return the updated root node.
}

// MARK: Check BST Property
/// Verifies if a binary tree satisfies the Binary Search Tree (BST) property.
/// - A BST is defined as a binary tree where, for each node:
///   - All values in the left subtree are less than the node's value.
///   - All values in the right subtree are greater than the node's value.
/// - Parameters:
///   - tree: The root node of the binary tree.
///   - min: The minimum value constraint (optional).
///   - max: The maximum value constraint (optional).
/// - Returns: `true` if the tree satisfies the BST property, otherwise `false`.
func checkBSTProperty(tree: node?, _ min: Int? = nil, _ max: Int? = nil) -> Bool
{
    guard let tree else { return true }  // An empty tree satisfies the BST property.

    // Check if the current node violates the min or max constraint.
    if let min = min, tree.value <= min { return false }
    if let max = max, tree.value >= max { return false }

    // Recursively check the left and right subtrees with updated constraints.
    return checkBSTProperty(tree: tree.left, min, tree.value)
        && checkBSTProperty(tree: tree.right, tree.value, max)
}

// MARK: Find Minimum in BST
/// Finds the node with the smallest value in a Binary Search Tree (BST).
/// - Parameter tree: The root node of the BST.
/// - Returns: The node with the minimum value, or `nil` if the tree is empty.
func findMinBST(tree: node?) -> node? {
    var current = tree  // Start from the root node.
    while let next = current?.left {  // Traverse left until no more left child exists.
        current = next
    }
    return current  // Return the leftmost node.
}

// MARK: Find Maximum in BST
/// Finds the node with the largest value in a Binary Search Tree (BST).
/// - Parameter tree: The root node of the BST.
/// - Returns: The node with the maximum value, or `nil` if the tree is empty.
func findMaxBST(tree: node?) -> node? {
    var current = tree  // Start from the root node.
    while let next = current?.right {  // Traverse right until no more right child exists.
        current = next
    }
    return current  // Return the rightmost node.
}

// MARK: Transform into BST
/// Transforms a binary tree into a Binary Search Tree (BST) by rearranging its node values.
/// - The structure of the tree remains unchanged, but the values are reassigned to satisfy the BST property.
/// - Parameters:
///   - tree: The root node of the binary tree.
/// - Returns: The root node of the transformed BST.
func transformIntoBST(tree: node?) -> node? {
    guard let tree else { return nil }  // Return nil for an empty tree.

    // Serialize the tree into a preorder array and sort it to obtain BST values.
    let array = preorderSerializeTree(tree: tree)  // Serialize the tree.
    let sorted = quickSort(array: array.compactMap { $0 })  // Sort the values while ignoring `nil`.

    var index: Int = 0  // Index to track the position in the sorted array.

    /// Helper function for inorder traversal to assign sorted values.
    /// - Parameter tree: The current node being visited.
    func inorderWalkTree(tree: node?) {
        guard let tree = tree else { return }  // Base case: do nothing for a nil node.

        inorderWalkTree(tree: tree.left)  // Traverse the left subtree.
        tree.value = sorted[index]  // Assign the next value from the sorted array.
        index += 1  // Move to the next index.
        inorderWalkTree(tree: tree.right)  // Traverse the right subtree.
    }

    inorderWalkTree(tree: tree)  // Start the inorder traversal from the root.
    return tree  // Return the root of the transformed BST.
}
