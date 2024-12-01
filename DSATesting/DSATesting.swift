//
//  DSATesting.swift
//  DSATesting
//
//  Created by Soufiane on 29/11/2024.
//

import Testing

@testable import DSA

struct DSATesting {
    // MARK: Bubble Sort
    @Test func testBubbleSort() async throws {
        let input = [5, 2, 9, 1, 5, 6]
        let expected = [1, 2, 5, 5, 6, 9]
        #expect(bubbleSort(array: input) == expected, "BubbleSort not working")

        let mediumArray = [
            9, 2, 88, 24, 6, 71, 65, 75, 81, 53, 49, 5, 2, 48, 42, 67, 2, 76,
            94, 59, 26, 88, 44, 80, 16, 90, 56, 78, 82, 35, 42, 99, 46, 11, 36,
            57, 65, 83, 3, 23, 52, 33, 56, 0, 90, 14, 53, 56, 51, 94, 49, 71,
            40, 100, 90, 83, 73, 67, 35, 55, 71, 80, 72, 7, 90, 78, 89, 49, 16,
            24, 52, 91, 19, 9, 37, 74, 79, 78, 62, 65, 86, 95, 0, 49, 61, 90,
            69, 8, 37, 5, 36, 8, 63, 4, 15, 84, 69, 69, 48, 40, 98,
        ]
        let mediumExpected = [
            0, 0, 2, 2, 2, 3, 4, 5, 5, 6, 7, 8, 8, 9, 9, 11, 14, 15, 16, 16, 19,
            23, 24, 24, 26, 33, 35, 35, 36, 36, 37, 37, 40, 40, 42, 42, 44, 46,
            48, 48, 49, 49, 49, 49, 51, 52, 52, 53, 53, 55, 56, 56, 56, 57, 59,
            61, 62, 63, 65, 65, 65, 67, 67, 69, 69, 69, 71, 71, 71, 72, 73, 74,
            75, 76, 78, 78, 78, 79, 80, 80, 81, 82, 83, 83, 84, 86, 88, 88, 89,
            90, 90, 90, 90, 90, 91, 94, 94, 95, 98, 99, 100,
        ]

        #expect(
            bubbleSort(array: mediumArray) == mediumExpected,
            "BubbleSort not working")
    }

    // MARK: Selection Sort
    @Test func TestSelectionSort() async throws {
        let input = [5, 2, 9, 1, 5, 6]
        let expected = [1, 2, 5, 5, 6, 9]
        #expect(
            selectionSort(array: input) == expected, "selectionSort not working"
        )

        let mediumArray = [
            9, 2, 88, 24, 6, 71, 65, 75, 81, 53, 49, 5, 2, 48, 42, 67, 2, 76,
            94, 59, 26, 88, 44, 80, 16, 90, 56, 78, 82, 35, 42, 99, 46, 11, 36,
            57, 65, 83, 3, 23, 52, 33, 56, 0, 90, 14, 53, 56, 51, 94, 49, 71,
            40, 100, 90, 83, 73, 67, 35, 55, 71, 80, 72, 7, 90, 78, 89, 49, 16,
            24, 52, 91, 19, 9, 37, 74, 79, 78, 62, 65, 86, 95, 0, 49, 61, 90,
            69, 8, 37, 5, 36, 8, 63, 4, 15, 84, 69, 69, 48, 40, 98,
        ]
        let mediumExpected = [
            0, 0, 2, 2, 2, 3, 4, 5, 5, 6, 7, 8, 8, 9, 9, 11, 14, 15, 16, 16, 19,
            23, 24, 24, 26, 33, 35, 35, 36, 36, 37, 37, 40, 40, 42, 42, 44, 46,
            48, 48, 49, 49, 49, 49, 51, 52, 52, 53, 53, 55, 56, 56, 56, 57, 59,
            61, 62, 63, 65, 65, 65, 67, 67, 69, 69, 69, 71, 71, 71, 72, 73, 74,
            75, 76, 78, 78, 78, 79, 80, 80, 81, 82, 83, 83, 84, 86, 88, 88, 89,
            90, 90, 90, 90, 90, 91, 94, 94, 95, 98, 99, 100,
        ]

        #expect(
            selectionSort(array: mediumArray) == mediumExpected,
            "selectionSort not working")
    }

    // MARK: Insertion Sort
    @Test func TestInsertionSort() async throws {
        let input = [5, 2, 9, 1, 5, 6]
        let expected = [1, 2, 5, 5, 6, 9]
        #expect(
            insertionSort(array: input) == expected, "insertionSort not working"
        )

        let mediumArray = [
            9, 2, 88, 24, 6, 71, 65, 75, 81, 53, 49, 5, 2, 48, 42, 67, 2, 76,
            94, 59, 26, 88, 44, 80, 16, 90, 56, 78, 82, 35, 42, 99, 46, 11, 36,
            57, 65, 83, 3, 23, 52, 33, 56, 0, 90, 14, 53, 56, 51, 94, 49, 71,
            40, 100, 90, 83, 73, 67, 35, 55, 71, 80, 72, 7, 90, 78, 89, 49, 16,
            24, 52, 91, 19, 9, 37, 74, 79, 78, 62, 65, 86, 95, 0, 49, 61, 90,
            69, 8, 37, 5, 36, 8, 63, 4, 15, 84, 69, 69, 48, 40, 98,
        ]
        let mediumExpected = [
            0, 0, 2, 2, 2, 3, 4, 5, 5, 6, 7, 8, 8, 9, 9, 11, 14, 15, 16, 16, 19,
            23, 24, 24, 26, 33, 35, 35, 36, 36, 37, 37, 40, 40, 42, 42, 44, 46,
            48, 48, 49, 49, 49, 49, 51, 52, 52, 53, 53, 55, 56, 56, 56, 57, 59,
            61, 62, 63, 65, 65, 65, 67, 67, 69, 69, 69, 71, 71, 71, 72, 73, 74,
            75, 76, 78, 78, 78, 79, 80, 80, 81, 82, 83, 83, 84, 86, 88, 88, 89,
            90, 90, 90, 90, 90, 91, 94, 94, 95, 98, 99, 100,
        ]

        #expect(
            insertionSort(array: mediumArray) == mediumExpected,
            "insertionSort not working")
    }

    //MARK: Merge Sort
    @Test func TestMergeSort() async throws {
        let input = [5, 2, 9, 1, 5, 6]
        let expected = [1, 2, 5, 5, 6, 9]
        #expect(mergeSort(array: input) == expected, "mergeSort not working")

        let mediumArray = [
            9, 2, 88, 24, 6, 71, 65, 75, 81, 53, 49, 5, 2, 48, 42, 67, 2, 76,
            94, 59, 26, 88, 44, 80, 16, 90, 56, 78, 82, 35, 42, 99, 46, 11, 36,
            57, 65, 83, 3, 23, 52, 33, 56, 0, 90, 14, 53, 56, 51, 94, 49, 71,
            40, 100, 90, 83, 73, 67, 35, 55, 71, 80, 72, 7, 90, 78, 89, 49, 16,
            24, 52, 91, 19, 9, 37, 74, 79, 78, 62, 65, 86, 95, 0, 49, 61, 90,
            69, 8, 37, 5, 36, 8, 63, 4, 15, 84, 69, 69, 48, 40, 98,
        ]
        let mediumExpected = [
            0, 0, 2, 2, 2, 3, 4, 5, 5, 6, 7, 8, 8, 9, 9, 11, 14, 15, 16, 16, 19,
            23, 24, 24, 26, 33, 35, 35, 36, 36, 37, 37, 40, 40, 42, 42, 44, 46,
            48, 48, 49, 49, 49, 49, 51, 52, 52, 53, 53, 55, 56, 56, 56, 57, 59,
            61, 62, 63, 65, 65, 65, 67, 67, 69, 69, 69, 71, 71, 71, 72, 73, 74,
            75, 76, 78, 78, 78, 79, 80, 80, 81, 82, 83, 83, 84, 86, 88, 88, 89,
            90, 90, 90, 90, 90, 91, 94, 94, 95, 98, 99, 100,
        ]

        #expect(
            mergeSort(array: mediumArray) == mediumExpected,
            "mergeSort not working")
    }

    //MARK: Quick Sort
    @Test func TestQuickSort() async throws {
        let input = [5, 2, 9, 1, 5, 6]
        let expected = [1, 2, 5, 5, 6, 9]
        #expect(quickSort(array: input) == expected, "quickSort not working")

        let mediumArray = [
            9, 2, 88, 24, 6, 71, 65, 75, 81, 53, 49, 5, 2, 48, 42, 67, 2, 76,
            94, 59, 26, 88, 44, 80, 16, 90, 56, 78, 82, 35, 42, 99, 46, 11, 36,
            57, 65, 83, 3, 23, 52, 33, 56, 0, 90, 14, 53, 56, 51, 94, 49, 71,
            40, 100, 90, 83, 73, 67, 35, 55, 71, 80, 72, 7, 90, 78, 89, 49, 16,
            24, 52, 91, 19, 9, 37, 74, 79, 78, 62, 65, 86, 95, 0, 49, 61, 90,
            69, 8, 37, 5, 36, 8, 63, 4, 15, 84, 69, 69, 48, 40, 98,
        ]
        let mediumExpected = [
            0, 0, 2, 2, 2, 3, 4, 5, 5, 6, 7, 8, 8, 9, 9, 11, 14, 15, 16, 16, 19,
            23, 24, 24, 26, 33, 35, 35, 36, 36, 37, 37, 40, 40, 42, 42, 44, 46,
            48, 48, 49, 49, 49, 49, 51, 52, 52, 53, 53, 55, 56, 56, 56, 57, 59,
            61, 62, 63, 65, 65, 65, 67, 67, 69, 69, 69, 71, 71, 71, 72, 73, 74,
            75, 76, 78, 78, 78, 79, 80, 80, 81, 82, 83, 83, 84, 86, 88, 88, 89,
            90, 90, 90, 90, 90, 91, 94, 94, 95, 98, 99, 100,
        ]

        #expect(
            quickSort(array: mediumArray) == mediumExpected,
            "quickSort not working")
    }

    // MARK: QuickSort by Ref
    @Test func TestQuickSortByRef() async throws {
        var input = [5, 2, 9, 1, 5, 6]
        let expected = [1, 2, 5, 5, 6, 9]
        quickSortByRef(array: &input, low: 0, high: input.count - 1)
        #expect(input == expected, "quickSortByRef not working")

        var mediumArray = [
            9, 2, 88, 24, 6, 71, 65, 75, 81, 53, 49, 5, 2, 48, 42, 67, 2, 76,
            94, 59, 26, 88, 44, 80, 16, 90, 56, 78, 82, 35, 42, 99, 46, 11, 36,
            57, 65, 83, 3, 23, 52, 33, 56, 0, 90, 14, 53, 56, 51, 94, 49, 71,
            40, 100, 90, 83, 73, 67, 35, 55, 71, 80, 72, 7, 90, 78, 89, 49, 16,
            24, 52, 91, 19, 9, 37, 74, 79, 78, 62, 65, 86, 95, 0, 49, 61, 90,
            69, 8, 37, 5, 36, 8, 63, 4, 15, 84, 69, 69, 48, 40, 98,
        ]
        let mediumExpected = [
            0, 0, 2, 2, 2, 3, 4, 5, 5, 6, 7, 8, 8, 9, 9, 11, 14, 15, 16, 16, 19,
            23, 24, 24, 26, 33, 35, 35, 36, 36, 37, 37, 40, 40, 42, 42, 44, 46,
            48, 48, 49, 49, 49, 49, 51, 52, 52, 53, 53, 55, 56, 56, 56, 57, 59,
            61, 62, 63, 65, 65, 65, 67, 67, 69, 69, 69, 71, 71, 71, 72, 73, 74,
            75, 76, 78, 78, 78, 79, 80, 80, 81, 82, 83, 83, 84, 86, 88, 88, 89,
            90, 90, 90, 90, 90, 91, 94, 94, 95, 98, 99, 100,
        ]

        quickSortByRef(array: &mediumArray, low: 0, high: mediumArray.count - 1)
        #expect(
            mediumArray == mediumExpected,
            "quickSortByRef not working")
    }

    // MARK: Build Heap
    @Test func TestBuildHeap() async throws {
        var input = [52, 43, 39, 11, 17, 28, 4, 10, 6]
        let expected = [52, 43, 39, 11, 17, 28, 4, 10, 6]
        buildHeap(array: &input)

        #expect(input == expected, "Build heap is not working")
    }

    // MARK: Heap extract max
    @Test func TestHeapExtaxtMax() async throws {
        var input = [15, 10, 12, 8, 4, 5, 9, 3, 1, 7, 6, 2]
        let expectedArray = [12, 10, 9, 8, 7, 5, 2, 3, 1, 4, 6]
        let expectedMax = 15
        buildHeap(array: &input)
        let extracted = extractMax(array: &input)
        #expect(input == expectedArray, "Extract Max returning wrong array")
        #expect(extracted == expectedMax, "Extaxt Max returning wrong Max")
    }

    // MARK: Heap insert value
    @Test func TestInsertValueHeap() async throws {
        var input = [100, 50, 90, 30, 40, 70, 80]
        let expected = [100, 95, 90, 50, 40, 70, 80, 30]
        insert(array: &input, value: 95)
        #expect(input == expected, "Insert value into heap is not working")
    }

    // MARK: Heap Sort
    @Test func testHeapSort() async throws {
        let input = [5, 2, 9, 1, 5, 6]
        let expected = [1, 2, 5, 5, 6, 9]
        #expect(heapSort(array: input) == expected, "heapSort not working")

        let mediumArray = [
            9, 2, 88, 24, 6, 71, 65, 75, 81, 53, 49, 5, 2, 48, 42, 67, 2, 76,
            94, 59, 26, 88, 44, 80, 16, 90, 56, 78, 82, 35, 42, 99, 46, 11, 36,
            57, 65, 83, 3, 23, 52, 33, 56, 0, 90, 14, 53, 56, 51, 94, 49, 71,
            40, 100, 90, 83, 73, 67, 35, 55, 71, 80, 72, 7, 90, 78, 89, 49, 16,
            24, 52, 91, 19, 9, 37, 74, 79, 78, 62, 65, 86, 95, 0, 49, 61, 90,
            69, 8, 37, 5, 36, 8, 63, 4, 15, 84, 69, 69, 48, 40, 98,
        ]
        let mediumExpected = [
            0, 0, 2, 2, 2, 3, 4, 5, 5, 6, 7, 8, 8, 9, 9, 11, 14, 15, 16, 16, 19,
            23, 24, 24, 26, 33, 35, 35, 36, 36, 37, 37, 40, 40, 42, 42, 44, 46,
            48, 48, 49, 49, 49, 49, 51, 52, 52, 53, 53, 55, 56, 56, 56, 57, 59,
            61, 62, 63, 65, 65, 65, 67, 67, 69, 69, 69, 71, 71, 71, 72, 73, 74,
            75, 76, 78, 78, 78, 79, 80, 80, 81, 82, 83, 83, 84, 86, 88, 88, 89,
            90, 90, 90, 90, 90, 91, 94, 94, 95, 98, 99, 100,
        ]

        #expect(
            heapSort(array: mediumArray) == mediumExpected,
            "heapSort not working")
    }

    // MARK: Counting Sort
    @Test func testCountingSort() async throws {
        let input = [5, 2, 9, 1, 5, 6]
        let expected = [1, 2, 5, 5, 6, 9]
        #expect(
            countingSort(array: input) == expected, "countingSort not working")

        let mediumArray = [
            9, 2, 88, 24, 6, 71, 65, 75, 81, 53, 49, 5, 2, 48, 42, 67, 2, 76,
            94, 59, 26, 88, 44, 80, 16, 90, 56, 78, 82, 35, 42, 99, 46, 11, 36,
            57, 65, 83, 3, 23, 52, 33, 56, 0, 90, 14, 53, 56, 51, 94, 49, 71,
            40, 100, 90, 83, 73, 67, 35, 55, 71, 80, 72, 7, 90, 78, 89, 49, 16,
            24, 52, 91, 19, 9, 37, 74, 79, 78, 62, 65, 86, 95, 0, 49, 61, 90,
            69, 8, 37, 5, 36, 8, 63, 4, 15, 84, 69, 69, 48, 40, 98,
        ]
        let mediumExpected = [
            0, 0, 2, 2, 2, 3, 4, 5, 5, 6, 7, 8, 8, 9, 9, 11, 14, 15, 16, 16, 19,
            23, 24, 24, 26, 33, 35, 35, 36, 36, 37, 37, 40, 40, 42, 42, 44, 46,
            48, 48, 49, 49, 49, 49, 51, 52, 52, 53, 53, 55, 56, 56, 56, 57, 59,
            61, 62, 63, 65, 65, 65, 67, 67, 69, 69, 69, 71, 71, 71, 72, 73, 74,
            75, 76, 78, 78, 78, 79, 80, 80, 81, 82, 83, 83, 84, 86, 88, 88, 89,
            90, 90, 90, 90, 90, 91, 94, 94, 95, 98, 99, 100,
        ]

        #expect(
            countingSort(array: mediumArray) == mediumExpected,
            "countingSort not working")
    }

    // MARK: Counting sort by digit
    @Test func testCountingSortByDigit() async throws {
        let input = [33, 45, 40, 25, 17, 24]
        let LSBSorted = [40, 33, 24, 45, 25, 17]
        let expexted10s = [17, 25, 24, 33, 45, 40]
        #expect(
            countingSortByDigit(array: input, place: 1) == LSBSorted,
            "testCountingSortByDigit not working on the Least significant digit"
        )
        #expect(
            countingSortByDigit(array: input, place: 10) == expexted10s,
            "testCountingSortByDigit not working on the 10 digit"
        )
    }

    // MARK: Radix sort
    @Test func testRadix() async throws {
        let input = [5, 2, 9, 1, 5, 6]
        let expected = [1, 2, 5, 5, 6, 9]
        #expect(
            radixSort(array: input) == expected, "radix not working")

        let mediumArray = [
            9, 2, 88, 24, 6, 71, 65, 75, 81, 53, 49, 5, 2, 48, 42, 67, 2, 76,
            94, 59, 26, 88, 44, 80, 16, 90, 56, 78, 82, 35, 42, 99, 46, 11, 36,
            57, 65, 83, 3, 23, 52, 33, 56, 0, 90, 14, 53, 56, 51, 94, 49, 71,
            40, 100, 90, 83, 73, 67, 35, 55, 71, 80, 72, 7, 90, 78, 89, 49, 16,
            24, 52, 91, 19, 9, 37, 74, 79, 78, 62, 65, 86, 95, 0, 49, 61, 90,
            69, 8, 37, 5, 36, 8, 63, 4, 15, 84, 69, 69, 48, 40, 98,
        ]
        let mediumExpected = [
            0, 0, 2, 2, 2, 3, 4, 5, 5, 6, 7, 8, 8, 9, 9, 11, 14, 15, 16, 16, 19,
            23, 24, 24, 26, 33, 35, 35, 36, 36, 37, 37, 40, 40, 42, 42, 44, 46,
            48, 48, 49, 49, 49, 49, 51, 52, 52, 53, 53, 55, 56, 56, 56, 57, 59,
            61, 62, 63, 65, 65, 65, 67, 67, 69, 69, 69, 71, 71, 71, 72, 73, 74,
            75, 76, 78, 78, 78, 79, 80, 80, 81, 82, 83, 83, 84, 86, 88, 88, 89,
            90, 90, 90, 90, 90, 91, 94, 94, 95, 98, 99, 100,
        ]

        #expect(
            radixSort(array: mediumArray) == mediumExpected,
            "radix not working")
    }

}
