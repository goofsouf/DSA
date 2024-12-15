import Foundation

let serialized: [Int?] = [1, 2, 4, nil, nil, 5, nil, nil, 3, nil, nil]
let expectedRoot = node(value: 10)
expectedRoot.left = node(value: 5)
expectedRoot.right = node(value: 17)
expectedRoot.left?.left = node(value: 4)
expectedRoot.left?.right = node(value: 7)


traverseInorder(root: expectedRoot)
traverseInorder(root: insertBSTNode(tree: expectedRoot, value: 10))
