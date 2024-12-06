import Foundation

let root = node(value: 1)
root.left = node(value: 2)
root.right = node(value: 3)
root.left?.left = node(value: 4)
root.left?.right = node(value: 5)


var test: [Int] = []
traversePreorder(root: root) { value in
    test.append(value)
}
print(test)
