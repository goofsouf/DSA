//
//  TreesTesting 2.swift
//  DSA
//
//  Created by Soufiane on 21/12/2024.
//


//
//  DSATesting.swift
//  DSATesting
//
//  Created by Soufiane on 29/11/2024.
//

import Testing

@testable import DSA

struct GraphTesting
{
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
    
    
}
