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
    
}
