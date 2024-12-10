import Foundation

let root = node(value: 3)
root.left = node(value: 5)
root.right = node(value: 1)
root.left?.left = node(value: 6)
root.left?.right = node(value: 2)
root.left?.right?.left = node(value: 7)
root.left?.right?.right = node(value: 4)
root.right?.left = node(value: 0)
root.right?.right = node(value: 8)

let tree = buildTreeFromArray(array: [1, 2, 3, 4, nil, nil, 5], index: 0)
var maxDiameter = TreeDiameter(tree: tree)
print(levelOrderSerializationTree(tree: buildTreeFromArray(array: levelOrderSerializationTree(tree: tree), index: 0) ))

