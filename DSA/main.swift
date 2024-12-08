import Foundation

let root = node(value: 1)
root.left = node(value: 2)
root.right = node(value: 3)
root.left?.left = node(value: 4)
root.left?.right = node(value: 5)

let tree = buildTreeFromArray(array: [1, 2, 3, 4, 5, 6, 7, 8, 9], index: 0)


print(TreeDiameter(tree: tree))
