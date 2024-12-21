//
//  sorting.swift
//  DSA
//
//  Created by Soufiane on 29/11/2024.
//

// MARK: Bubble Sort
/// Sorts an array using the Bubble Sort algorithm.
/// - Parameter array: The array to sort.
/// - Returns: A sorted array.
func bubbleSort<T: Comparable>(array: [T]) -> [T] {
    var sortedArray = array
    for pass in 0...sortedArray.count {
        var swapped: Bool = false
        for index in 0..<sortedArray.endIndex - 1 - pass {
            if sortedArray[index] > sortedArray[index + 1] {
                (sortedArray[index], sortedArray[index + 1]) = (
                    sortedArray[index + 1], sortedArray[index]
                )
                swapped = true
            }
        }
        if !swapped { break }
    }
    return sortedArray
}

// MARK: Selection Sort
/// Sorts an array using the Selection Sort algorithm.
/// - Parameter array: The array to sort.
/// - Returns: A sorted array.
func selectionSort(array: [Int]) -> [Int] {
    var sortedArray = array
    for pass in 0..<sortedArray.count {
        var tempMaxIndex = 0
        for index in 0..<sortedArray.count - pass {
            if sortedArray[index] > sortedArray[tempMaxIndex] {
                tempMaxIndex = index
            }
        }
        (
            sortedArray[tempMaxIndex],
            sortedArray[sortedArray.endIndex - 1 - pass]
        ) =
            (
                sortedArray[sortedArray.endIndex - 1 - pass],
                sortedArray[tempMaxIndex]
            )
    }
    return sortedArray
}

// MARK: Insertion Sort
/// Sorts an array using the Insertion Sort algorithm.
/// - Parameter array: The array to sort.
/// - Returns: A sorted array.
func insertionSort(array: [Int]) -> [Int] {
    var sortedArray = array
    for index in 1..<sortedArray.count {
        for iteration in 0...index {
            if sortedArray[index] < sortedArray[iteration] {
                let tmp: Int = sortedArray[index]
                for position in stride(from: index, to: iteration, by: -1) {
                    sortedArray[position] = sortedArray[position - 1]
                }
                sortedArray[iteration] = tmp
                break
            }
        }
    }
    return sortedArray
}

// MARK: Merge Sort
/// Sorts an array using the Merge Sort algorithm.
/// - Parameter array: The array to sort.
/// - Returns: A sorted array.
func mergeSort(array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    let mid = array.count / 2
    let leftArray = Array(array[0..<mid])
    let rightArray = Array(array[mid...])
    return mergeArrays(
        left: mergeSort(array: leftArray), right: mergeSort(array: rightArray))
}

/// Merges two sorted arrays into one sorted array.
/// - Parameters:
///   - leftArray: The left sorted array.
///   - rightArray: The right sorted array.
/// - Returns: A merged sorted array.
func mergeArrays(left leftArray: [Int], right rightArray: [Int]) -> [Int] {
    var workingArray: [Int] = []
    var rightIndex = 0
    var leftIndex = 0
    while rightIndex < rightArray.count, leftIndex < leftArray.count {
        if rightArray[rightIndex] < leftArray[leftIndex] {
            workingArray.append(rightArray[rightIndex])
            rightIndex += 1
        } else {
            workingArray.append(leftArray[leftIndex])
            leftIndex += 1
        }
    }
    workingArray.append(contentsOf: leftArray[leftIndex...])
    workingArray.append(contentsOf: rightArray[rightIndex...])
    return workingArray
}

// MARK: Quick Sort
/// Sorts an array using the Quick Sort algorithm (recursive implementation).
/// - Parameter array: The array to sort.
/// - Returns: A sorted array.
func quickSort(array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    let pivotIndex = Int.random(in: 0..<array.count)
    let pivot = array[pivotIndex]
    let leftArray = array.filter { $0 < pivot }
    let rightArray = array.filter { $0 > pivot }
    return quickSort(array: leftArray) + [pivot] + quickSort(array: rightArray)
}

// MARK: Quick Sort by Ref
/// Sorts an array in place using the Quick Sort algorithm.
/// - Parameters:
///   - array: The array to sort (in place).
///   - low: The starting index of the subarray to sort.
///   - high: The ending index of the subarray to sort.
func quickSortByRef(array: inout [Int], low: Int, high: Int) {
    if low < high {
        let pivotIndex = partition(array: &array, low: low, high: high)
        quickSortByRef(array: &array, low: low, high: pivotIndex - 1)
        quickSortByRef(array: &array, low: pivotIndex + 1, high: high)
    }
}

/// Partitions the array for Quick Sort.
/// - Parameters:
///   - array: The array to partition.
///   - low: The starting index.
///   - high: The ending index.
/// - Returns: The pivot index after partitioning.
func partition(array: inout [Int], low: Int, high: Int) -> Int {
    let pivot = array[high]
    var pivotIndex = low - 1
    for pass in low..<high {
        if array[pass] < pivot {
            pivotIndex += 1
            array.swapAt(pivotIndex, pass)
        }
    }
    array.swapAt(pivotIndex + 1, high)
    return pivotIndex + 1
}

// MARK: Heap Sort
/// Sorts an array using the Heap Sort algorithm.
/// - Parameter array: The array to sort.
/// - Returns: A sorted array.
func heapSort(array: [Int]) -> [Int] {
    var copyArray = array
    var sortedArray: [Int] = []
    buildHeap(array: &copyArray)
    while !copyArray.isEmpty {
        let max = extractMax(array: &copyArray)
        sortedArray.append(max)
    }
    return sortedArray.reversed()
}

// MARK: Counting Sort
/// Sorts an array using the Counting Sort algorithm.
/// - Parameter array: The array to sort.
/// - Returns: A sorted array.
func countingSort(array: [Int]) -> [Int] {
    guard !array.isEmpty else { return array }
    let min = array.min()!
    let range = array.max()! - min + 1
    var countArray = Array(repeating: 0, count: range)
    for element in array {
        countArray[element - min] += 1
    }
    for index in 1..<countArray.count {
        countArray[index] += countArray[index - 1]
    }
    var sortedArray = Array(repeating: 0, count: array.count)
    for pass in stride(from: array.count - 1, through: 0, by: -1) {
        let element = array[pass]
        let position = countArray[element - min] - 1
        sortedArray[position] = element
        countArray[element - min] -= 1
    }
    return sortedArray
}

// MARK: Radix Sort
/// Sorts an array using the Radix Sort algorithm.
/// - Parameter array: The array to sort.
/// - Returns: A sorted array.
func radixSort(array: [Int]) -> [Int] {
    guard let max = array.max() else { return array }
    var sortedArray = array
    var place = 1
    while place <= max {
        sortedArray = countingSortByDigit(array: sortedArray, place: place)
        place *= 10
    }
    return sortedArray
}

/// Sorts an array by digit for Radix Sort.
/// - Parameters:
///   - array: The array to sort.
///   - place: The digit place to sort by.
/// - Returns: A partially sorted array based on the given digit place.
func countingSortByDigit(array: [Int], place: Int) -> [Int] {
    let range = 10
    var countArray = Array(repeating: 0, count: range)
    var sortedArray = Array(repeating: 0, count: array.count)
    for element in array {
        let digit = (element / place) % 10
        countArray[digit] += 1
    }
    for index in 1..<countArray.count {
        countArray[index] += countArray[index - 1]
    }
    for pass in stride(from: array.count - 1, through: 0, by: -1) {
        let element = array[pass]
        let digit = (element / place) % 10
        let position = countArray[digit] - 1
        sortedArray[position] = element
        countArray[digit] -= 1
    }
    return sortedArray
}
