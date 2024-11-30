//
//  heap.swift
//  DSA
//
//  Created by Soufiane on 29/11/2024.
//

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

func buildHeap(array: inout [Int]) {
    // Start from the last parent node
    let lastParentIndex = (array.count / 2) - 1

    // Move from the last parent node to the root
    for index in stride(from: lastParentIndex, through: 0, by: -1) {
        // Ensure the subtree rooted at 'index' satisfies the heap property
        heapify(array: &array, index: index, size: array.count)
    }
}

func extractMax(array: inout [Int]) -> Int {
    precondition(
        !array.isEmpty, "Heap underflow: Cannot extract from an empty heap")
    let max = array[0]

    array.swapAt(0, array.count - 1)
    array.removeLast()
    heapify(array: &array, index: 0, size: array.count)

    return max
}

func insert(array: inout [Int], value: Int) {
    array.append(value)
    var index = array.count - 1
    
    while index > 0 {
        let parentIndex = (index - 1)/2
        if array[parentIndex] < array[index] {
            array.swapAt(parentIndex, index)
        }else{
            break
        }
        index = parentIndex
    }
}

