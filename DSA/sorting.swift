//
//  sorting.swift
//  DSA
//
//  Created by Soufiane on 29/11/2024.
//

// MARK: Bubble Sort
/// Sorts an array using the Bubble Sort algorithm.
/// - Parameter array: The array to sort. It must contain elements that conform to the `Comparable` protocol.
/// - Returns: A sorted array in ascending order.
func bubbleSort<T: Comparable>(array: [T]) -> [T] {
    var sortedArray = array
    for pass in 0...sortedArray.count {
        var swapped: Bool = false
        for index in 0..<sortedArray.endIndex - 1 - pass {
            if sortedArray[index] > sortedArray[index + 1] {
                // Swap values if they are out of order
                (sortedArray[index], sortedArray[index + 1]) = (
                    sortedArray[index + 1], sortedArray[index]
                )
                swapped = true
            }
        }
        // If no swaps occurred during this pass, the array is already sorted
        if !swapped { break }
    }
    return sortedArray
}

// MARK: Selection Sort
/// Sorts an array using the Selection Sort algorithm.
/// - Parameter array: The array to sort.
/// - Returns: A sorted array in ascending order.
func selectionSort(array: [Int]) -> [Int] {
    var sortedArray = array
    for pass in 0..<sortedArray.count {
        var tempMaxIndex = 0
        for index in 0..<sortedArray.count - pass {
            if sortedArray[index] > sortedArray[tempMaxIndex] {
                // Update the index of the largest value
                tempMaxIndex = index
            }
        }
        // Move the largest value to its correct position
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
/// - Returns: A sorted array in ascending order.
func insertionSort(array: [Int]) -> [Int] {
    var sortedArray = array
    for index in 1..<sortedArray.count {
        for iteration in 0...index {
            if sortedArray[index] < sortedArray[iteration] {
                // Store the current value
                let tmp: Int = sortedArray[index]
                // Shift elements to the right to make room
                for position in stride(from: index, to: iteration, by: -1) {
                    sortedArray[position] = sortedArray[position - 1]
                }
                // Place the current value in its correct position
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
/// - Returns: A sorted array in ascending order.
func mergeSort(array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }  // Base case: a single-element or empty array is already sorted.

    let mid = array.count / 2  // Find the middle index to split the array.
    let leftArray = Array(array[0..<mid])  // Split into left half.
    let rightArray = Array(array[mid...])  // Split into right half.

    let sortedLeftArray = mergeSort(array: leftArray)  // Recursively sort the left half.
    let sortedRightArray = mergeSort(array: rightArray)  // Recursively sort the right half.
    return mergeArrays(left: sortedLeftArray, right: sortedRightArray)  // Merge the sorted halves.
}

/// Merges two sorted arrays into a single sorted array.
/// - Parameters:
///   - leftArray: The left sorted array.
///   - rightArray: The right sorted array.
/// - Returns: A merged and sorted array.
func mergeArrays(left leftArray: [Int], right rightArray: [Int]) -> [Int] {
    var workingArray: [Int] = []  // Resulting merged array.
    var rightIndex: Int = 0
    var leftIndex: Int = 0

    // Compare elements from both arrays and append the smaller one.
    while rightIndex < rightArray.count, leftIndex < leftArray.count {
        if rightArray[rightIndex] < leftArray[leftIndex] {
            workingArray.append(rightArray[rightIndex])
            rightIndex += 1
        } else {
            workingArray.append(leftArray[leftIndex])
            leftIndex += 1
        }
    }

    // Append any remaining elements from the left array.
    workingArray.append(contentsOf: leftArray[leftIndex...])
    // Append any remaining elements from the right array.
    workingArray.append(contentsOf: rightArray[rightIndex...])
    return workingArray
}

// MARK: Quick Sort
/// Sorts an array using the Quick Sort algorithm.
/// - Parameter array: The array to sort.
/// - Returns: A sorted array in ascending order.
func quickSort(array: [Int]) -> [Int] {
    if array.count <= 1 { return array }  // Base case: a single-element or empty array is already sorted.

    let pivotIndex = Int.random(in: 0..<array.count)  // Choose a random pivot index.
    let pivot: Int = array[pivotIndex]  // The pivot value.
    var leftArray: [Int] = []  // Array for elements less than or equal to the pivot.
    var rightArray: [Int] = []  // Array for elements greater than the pivot.

    // Partition the array into left and right subarrays based on the pivot.
    for index in 0..<array.count {
        if index == pivotIndex { continue }  // Skip the pivot itself.
        if array[index] > pivot {
            rightArray.append(array[index])
        } else {
            leftArray.append(array[index])
        }
    }

    // Recursively sort the left and right subarrays, then concatenate with the pivot.
    let sortedLeftArray = quickSort(array: leftArray)
    let sortedRightArray = quickSort(array: rightArray)

    return sortedLeftArray + [pivot] + sortedRightArray
}

// MARK: Quick Sort by Ref
/// Sorts an array in place using the Quick Sort algorithm.
/// - Parameters:
///   - array: The array to sort (passed by reference and modified in place).
///   - low: The starting index of the portion to sort.
///   - high: The ending index of the portion to sort.
func quickSortByRef(array: inout [Int], low: Int, high: Int) {
    if low < high {
        let pivotIndex = partition(array: &array, low: low, high: high)  // Partition the array and get the pivot index.

        // Recursively sort the left and right partitions.
        quickSortByRef(array: &array, low: low, high: pivotIndex - 1)
        quickSortByRef(array: &array, low: pivotIndex + 1, high: high)
    }
}

/// Partitions an array around a pivot element.
/// - Parameters:
///   - array: The array to partition (modified in place).
///   - low: The starting index of the partition.
///   - high: The ending index of the partition.
/// - Returns: The index of the pivot after partitioning.
func partition(array: inout [Int], low: Int, high: Int) -> Int {
    var pivotIndex: Int = low - 1  // Tracks the position of the pivot.
    let pivot: Int = array[high]  // Use the last element as the pivot.

    // Move all elements smaller than the pivot to the left of the pivot.
    for pass in low..<high {
        if array[pass] < pivot {
            pivotIndex += 1
            array.swapAt(pivotIndex, pass)
        }
    }

    // Place the pivot in its correct position.
    array.swapAt(pivotIndex + 1, high)
    return pivotIndex + 1
}

// MARK: Heap Sort
/// Sorts an array using the Heap Sort algorithm.
/// - Parameter array: The array to sort.
/// - Returns: A sorted array in ascending order.
func heapSort(array: [Int]) -> [Int] {
    var copyArray = array  // Copy of the input array to modify it as a heap.
    var sortedArray: [Int] = []  // Array to store the sorted elements.

    buildHeap(array: &copyArray)  // Build a max heap from the input array.
    while !copyArray.isEmpty {
        let max = extractMax(array: &copyArray)  // Extract the largest element.
        sortedArray.append(max)  // Append the largest element to the sorted array.
    }

    return sortedArray.reversed()  // Reverse the array to get ascending order.
}

// MARK: Counting Sort
/// Sorts an array using the Counting Sort algorithm.
/// - Parameter array: The array to sort (only works for non-negative integers).
/// - Returns: A sorted array in ascending order.
func countingSort(array: [Int]) -> [Int] {
    guard !array.isEmpty else { return array }  // Handle empty array edge case.
    let min = array.min()!  // Find the minimum value in the array.
    let range = array.max()! - min + 1  // Determine the range of values in the array.
    var countArray = Array(repeating: 0, count: range)  // Create a count array.

    // Populate the count array with the frequency of each element.
    for element in array {
        countArray[element - min] += 1
    }

    // Accumulate counts to determine positions in the sorted array.
    for index in 1..<countArray.count {
        countArray[index] = countArray[index - 1] + countArray[index]
    }

    // Create a sorted array using the count array.
    var sortedArray = Array(repeating: 0, count: array.count)
    for pass in stride(from: array.count - 1, through: 0, by: -1) {
        let element = array[pass]
        let position = countArray[element - min] - 1
        sortedArray[position] = element
        countArray[element - min] -= 1
    }

    return sortedArray
}

// MARK: Digit Counting Sort
/// Sorts an array by a specific digit using the Counting Sort algorithm.
/// - Parameters:
///   - array: The array to sort.
///   - place: The digit place to sort by (e.g., 1 for units, 10 for tens).
/// - Returns: A sorted array by the specified digit.
func countingSortByDigit(array: [Int], place: Int) -> [Int] {
    let range = 10  // Base-10 for digits (0-9).
    var countArray = Array(repeating: 0, count: range)  // Count array for digit frequencies.
    var sortedArray = Array(repeating: 0, count: array.count)  // Resulting sorted array.

    // Count the occurrences of each digit at the given place.
    for element in array {
        let digit = (element / place) % 10
        countArray[digit] += 1
    }

    // Accumulate counts to determine positions.
    for index in 1..<countArray.count {
        countArray[index] = countArray[index - 1] + countArray[index]
    }

    // Place elements into the sorted array based on their digit positions.
    for pass in stride(from: array.count - 1, through: 0, by: -1) {
        let element = array[pass]
        let digit = (element / place) % 10
        let position = countArray[digit] - 1
        sortedArray[position] = element
        countArray[digit] -= 1
    }

    return sortedArray
}

// MARK: Radix Sort
/// Sorts an array using the Radix Sort algorithm.
/// - Parameter array: The array to sort (only works for non-negative integers).
/// - Returns: A sorted array in ascending order.
func radixSort(array: [Int]) -> [Int] {
    guard let max = array.max() else { return array }  // Find the maximum value to determine the number of digits.
    var sortedArray: [Int] = array
    var place = 1  // Start with the least significant digit (units place).

    // Iterate through each digit place (units, tens, hundreds, etc.).
    while place <= max {
        sortedArray = countingSortByDigit(array: sortedArray, place: place)  // Sort by the current digit place.
        place *= 10  // Move to the next significant digit.
    }
    return sortedArray
}
