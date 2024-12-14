import Foundation

let serialized: [Int?] = [1, 2, 4, nil, nil, 5, nil, nil, 3, nil, nil]
let expectedRoot = node(value: 1)
expectedRoot.left = node(value: 2)
expectedRoot.right = node(value: 3)
expectedRoot.left?.left = node(value: 4)
expectedRoot.left?.right = node(value: 5)

let res = preorderDeserialize(array: serialized)

traversePreorder(root: expectedRoot)
print("__")
traversePreorder(root: res)
