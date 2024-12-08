import Foundation

let root = node(value: 1)
root.left = node(value: 2)
root.left?.left = node(value: 4)

let tree = buildTreeFromArray(array: [1, 2, 3, 4, 5, 6, 7, 8, 9,10,11], index: 0)


print(treeIsBalanced(tree: root ))
