//
//  DSATesting.swift
//  DSATesting
//
//  Created by Soufiane on 29/11/2024.
//

import Testing

@testable import DSA

struct TreesTesting {
    // MARK: Preorder Traverse
    @Test func testPreorderTraverse() async throws {
        let root = node(value: 1)
        root.left = node(value: 2)
        root.right = node(value: 3)
        root.left?.left = node(value: 4)
        root.left?.right = node(value: 5)

        var result: [Int] = []
        let expected = [1, 2, 4, 5, 3]
        traversePreorder(root: root) { value in
            result.append(value)
        }
        #expect(result == expected, "Preorder traverse not working")
    }

    // MARK: Inorder Traverse
    @Test func testInorderTraverse() async throws {
        let root = node(value: 4)
        root.left = node(value: 2)
        root.right = node(value: 6)
        root.left?.left = node(value: 1)
        root.left?.right = node(value: 3)
        root.right?.left = node(value: 5)
        root.right?.right = node(value: 7)

        var result: [Int] = []
        let expected = [1, 2, 3, 4, 5, 6, 7]
        traverseInorder(root: root) { value in
            result.append(value)
        }
        #expect(result == expected, "Inorder traverse not working")
    }

    // MARK: Postorder Traverse
    @Test func testPostorder() async throws {
        let root = node(value: 4)
        root.left = node(value: 2)
        root.right = node(value: 6)
        root.left?.left = node(value: 1)
        root.left?.right = node(value: 3)
        root.right?.left = node(value: 5)
        root.right?.right = node(value: 7)

        var result: [Int] = []
        let expected = [1, 3, 2, 5, 7, 6, 4]
        traversePostorder(root: root) { value in
            result.append(value)
        }
        #expect(result == expected, "ostorder traversal is not working")
    }

    // MARK: build tree from array
    @Test func testBuildTreeFromArray() async throws {
        let tree: node? = buildTreeFromArray(
            array: [1, 2, 3, 4, 5, 6, 7, 8, 9], index: 0)
        var result: [Int] = []
        let expected = [8, 4, 9, 2, 5, 1, 6, 3, 7]
        traverseInorder(root: tree) { value in
            result.append(value)
        }
        #expect(result == expected, "build tree from array is not working")
    }

    // MARK: Tree height
    @Test func testTreeHeight() async throws {
        let tree: node? = buildTreeFromArray(
            array: [1, 2, 3, 4, 5, 6, 7, 8, 9], index: 0)
        let height: Int = TreeHeight(tree: tree!)

        #expect(height == 4, "Tree Height not working")
    }

    // MARK: Tree diameter
    @Test func testTreeDiameter() async throws {
        let tree: node? = buildTreeFromArray(
            array: [1, 2, 3, 4, 5, 6, 7, 8, 9], index: 0)

        let diameter: Int = TreeDiameter(tree: tree)

        #expect(diameter == 5, "Tree diameter not work")
    }

    // MARK: Check if tree balanced
    @Test func testTreeBalanceCheck() async throws {
        let tree: node? = buildTreeFromArray(
            array: [1, 2, 3, 4, 5, 6, 7, 8, 9], index: 0)
        #expect(
            treeIsBalanced(tree: tree) == true,
            "Tree balance check is not working")

        let root = node(value: 1)
        root.left = node(value: 2)
        root.left?.left = node(value: 4)

        #expect(
            treeIsBalanced(tree: root) == false,
            "Tree balance check is not working")
    }

    // MARK: Lowest common ancestor
    @Test func testLCA() async throws {
        let root = node(value: 3)
        root.left = node(value: 5)
        root.right = node(value: 1)
        root.left?.left = node(value: 6)
        root.left?.right = node(value: 2)
        root.left?.right?.left = node(value: 7)
        root.left?.right?.right = node(value: 4)
        root.right?.left = node(value: 0)
        root.right?.right = node(value: 8)

        let node1 = root.left  // Node 5
        let node2 = root.left?.right?.right  // Node 4
        let lca = lowestCommonAncestor(tree: root, node1: node1, node2: node2)

        #expect(lca?.value == 5, "LCA is not working")
    }

    // MARK: Preorder tree serialization
    @Test func testPreorderSerialization() async throws {
        let root = node(value: 1)
        root.left = node(value: 2)
        root.right = node(value: 3)
        root.left?.left = node(value: 4)
        root.left?.right = node(value: 5)

        let serialized = preorderSerializeTree(tree: root)
        #expect(
            serialized == [1, 2, 4, nil, nil, 5, nil, nil, 3, nil, nil],
            "Preorder serialization not working")
    }

    // MARK: level order tree serialization
    @Test func testLevelOrderSerialization() async throws {
        let root = node(value: 1)
        root.left = node(value: 2)
        root.right = node(value: 3)
        root.left?.left = node(value: 4)
        root.left?.right = node(value: 5)

        let serialized = levelOrderSerializationTree(tree: root)
        #expect(
            serialized == [1, 2, 3, 4, 5],
            "Preorder serialization not working")
    }
}
