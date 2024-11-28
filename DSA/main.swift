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

quickSortByRef(array: &unsortedArray, low: 0, high: unsortedArray.count-1)
print(unsortedArray)
print(quickSort(array: unsortedArray) == selectionSort(array: unsortedArray))
