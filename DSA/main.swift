import Foundation

let root = node(value: 1)
root.left = node(value: 2)
root.right = node(value: 3)

root.left?.left = node(value: 5)
root.left?.right = node(value: 6)
root.left?.left?.left = node(value: 7)
root.left?.left?.right = node(value: 8)

root.right?.left = node(value: 9)
root.right?.right = node(value: 10)
root.right?.left?.left = node(value: 11)
root.right?.left?.right = node(value: 12)

let tree = transformIntoBST(tree: root)

print(checkBSTProperty(tree: tree))
