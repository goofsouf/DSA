//
//  heap.swift
//  DSA
//
//  Created by Soufiane on 29/11/2024.
//

/// Ensures the subtree rooted at the given index satisfies the max-heap property.
/// - Parameters:
///   - array: The array representing the heap.
///   - index: The root index of the subtree to heapify.
///   - size: The size of the heap (portion of the array to consider).
func heapify(array: inout [Int], index: Int, size: Int) {
    var largest = index
    let left = 2 * index + 1
    let right = 2 * index + 2

    if left < size, array[left] > array[largest] {
        largest = left
    }
    if right < size, array[right] > array[largest] {
        largest = right
    }

    if largest != index {
        array.swapAt(largest, index)
        heapify(array: &array, index: largest, size: size)
    }
}

/// Converts an unordered array into a max-heap.
/// - Parameter array: The array to be converted into a max-heap.
func buildHeap(array: inout [Int]) {
    // Start from the last parent node
    let lastParentIndex = (array.count / 2) - 1

    // Move from the last parent node to the root
    for index in stride(from: lastParentIndex, through: 0, by: -1) {
        // Ensure the subtree rooted at 'index' satisfies the heap property
        heapify(array: &array, index: index, size: array.count)
    }
}

/// Removes and returns the maximum value (root) of the max-heap.
/// - Parameter array: The array representing the heap.
/// - Returns: The maximum value in the heap.
/// - Precondition: The heap must not be empty.
func extractMax(array: inout [Int]) -> Int {
    precondition(
        !array.isEmpty, "Heap underflow: Cannot extract from an empty heap")
    let max = array[0]

    array.swapAt(0, array.count - 1)
    array.removeLast()
    heapify(array: &array, index: 0, size: array.count)

    return max
}

/// Inserts a new value into the max-heap and ensures the heap property is maintained.
/// - Parameters:
///   - array: The array representing the heap.
///   - value: The value to insert into the heap.
func insert(array: inout [Int], value: Int) {
    array.append(value)
    var index = array.count - 1

    while index > 0 {
        let parentIndex = (index - 1) / 2
        if array[parentIndex] < array[index] {
            array.swapAt(parentIndex, index)
        } else {
            break
        }
        index = parentIndex
    }
}
