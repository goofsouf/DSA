//
//  sorting.swift
//  DSA
//
//  Created by Soufiane on 29/11/2024.
//

// MARK: Bubble Sort
func bubbleSort<T: Comparable>(array: [T]) -> [T] {
    var sortedArray = array
    // Iterate through passes
    for pass in 0...sortedArray.count {
        // Reset swap tracker
        // Variable to keep track if there were any swaps
        var swapped: Bool = false
        // Main swapping loop, comparison happens here
        // After each pass, the end of the array already has the largest numbers. Ignore those numbers by substracting the number of passes already happened
        for index in 0..<sortedArray.endIndex - 1 - pass {
            // Swap values if they're not in correct order
            if sortedArray[index] > sortedArray[index + 1] {
                (sortedArray[index], sortedArray[index + 1]) = (
                    sortedArray[index + 1], sortedArray[index]
                )
                // Update the tracker to indicate that a swap happened
                swapped = true
            }
        }
        // No swaps happened means that the array already sorted, exit early
        if !swapped {
            break
        }
    }

    return sortedArray
}

// MARK: Selection Sort
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
        ) = (
            sortedArray[sortedArray.endIndex - 1 - pass],
            sortedArray[tempMaxIndex]
        )
    }
    return sortedArray
}

// MARK: Insertion Sort
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
func mergeSort(array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }

    let mid = array.count / 2
    let leftArray = Array(array[0..<mid])
    let rightArray = Array(array[mid...])

    let sortedLeftArray = mergeSort(array: leftArray)
    let sortedRightArray = mergeSort(array: rightArray)
    return mergeArrays(left: sortedLeftArray, right: sortedRightArray)
}
func mergeArrays(left leftArray: [Int], right rightArray: [Int]) -> [Int] {
    var workingArray: [Int] = []
    var rightIndex: Int = 0
    var leftIndex: Int = 0

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
func quickSort(array: [Int]) -> [Int] {
    if array.count <= 1 {
        return array
    }

    let pivotIndex = Int.random(in: 0..<array.count)
    let pivot: Int = array[pivotIndex]
    var leftArray: [Int] = []
    var rightArray: [Int] = []

    for index in 0..<array.count {
        if index == pivotIndex {
            continue
        }
        if array[index] > pivot {
            rightArray.append(array[index])
        } else {
            leftArray.append(array[index])
        }
    }

    let sortedLeftArray = quickSort(array: leftArray)
    let sortedRightArray = quickSort(array: rightArray)

    return sortedLeftArray + [pivot] + sortedRightArray
}

// MARK: Quick Sort by Ref
func quickSortByRef(array: inout [Int], low: Int, high: Int) {
    if low < high {
        let pivotIndex = partition(array: &array, low: low, high: high)

        quickSortByRef(array: &array, low: low, high: pivotIndex - 1)
        quickSortByRef(array: &array, low: pivotIndex + 1, high: high)
    }
}

func partition(array: inout [Int], low: Int, high: Int) -> Int {
    var pivotIndex: Int = low - 1
    let pivot: Int = array[high]

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
func countingSort(array: [Int]) -> [Int] {
    guard !array.isEmpty else { return array }
    let min = array.min()!
    let range = array.max()! - min + 1
    var countArray = Array(repeating: 0, count: range)
    
    for element in array {
        countArray[element - min] += 1
    }
    for index in 1..<countArray.count{
        countArray[index] = countArray[index-1] + countArray[index]
    }
    var sortedArray = Array(repeating: 0, count: array.count)
    for pass in stride(from: array.count-1, through: 0, by: -1){
        let element = array[pass]
        let position = countArray[element-min] - 1
        sortedArray[position] = element
        countArray[array[pass]-min] -= 1
    }
    
    return sortedArray
}
// MARK: Digit Counting Sort
func countingSortByDigit(array: [Int], place: Int) -> [Int] {
    let range = 10
    var countArray = Array(repeating: 0, count: range)
    var sortedArray = Array(repeating: 0, count: array.count)
    
    for element in array {
        let digit = (element / place) % 10
        countArray[digit] += 1
    }
    for index in 1..<countArray.count{
        countArray[index] = countArray[index-1] + countArray[index]
    }
    for pass in stride(from: array.count-1, through: 0, by: -1){
        let element = array[pass]
        let digit = (element / place) % 10
        let position = countArray[digit] - 1
        sortedArray[position] = element
        countArray[digit] -= 1
    }
    
    return sortedArray
}

// Mark Radix Sort
func radixSort(array: [Int]) -> [Int] {
    guard let max = array.max() else { return array}
    var sortedArray: [Int] = array
    var place = 1
    while place <= max {
        sortedArray = countingSortByDigit(array: sortedArray , place: place)
        place *= 10
    }
    return sortedArray
}
