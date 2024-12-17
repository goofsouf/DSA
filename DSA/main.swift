import Foundation

let root = node(value: 20)
root.left = node(value: 10)
root.right = node(value: 30)

root.left?.left = node(value: 5)
root.left?.right = node(value: 15)
root.left?.left?.left = node(value: 3)
root.left?.left?.right = node(value: 7)

root.right?.left = node(value: 25)
root.right?.right = node(value: 40)
root.right?.left?.left = node(value: 22)
root.right?.left?.right = node(value: 27)

var test = 0

traverseInorder(root: deleteBSTNode(tree: root, value: 10))
