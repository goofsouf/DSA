import Foundation

let serialized: [Int?] = [1, 2, 4, nil, nil, 5, nil, nil, 3, nil, nil]
let expectedRoot = node(value: 10)
expectedRoot.left = node(value: 5)
expectedRoot.right = node(value: 17)
expectedRoot.left?.left = node(value: 4)
expectedRoot.left?.right = node(value: 7)

let res = searchBSTNode(tree: expectedRoot, value: 8) ?? node(value: -1)

print(res.value)
