import Foundation

var unsortedArray: [Int] = [
    9, 2, 88, 24, 6, 71, 65, 75, 81, 53, 49, 5, 2, 48, 42, 67, 2, 76, 94, 59,
    26, 88, 44, 80, 16, 90, 56, 78, 82, 35, 42, 99, 46, 11, 36, 57, 65, 83, 3,
    23, 52, 33, 56, 0, 90, 14, 53, 56, 51, 94, 49, 71, 40, 100, 90, 83, 73,
    67,
    35, 55, 71, 80, 72, 7, 90, 78, 89, 49, 16, 24, 52, 91, 19, 9, 37, 74, 79,
    78, 62, 65, 86, 95, 0, 49, 61, 90, 69, 8, 37, 5, 36, 8, 63, 4, 15, 84, 69,
    69, 48, 40, 98,
]

var array3: [Int] = [4,6,52,10,17,28,39,43,11]
buildHeap(array: &array3)
print(array3)
