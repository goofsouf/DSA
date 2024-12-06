//
//  heap.swift
//  DSA
//
//  Created by Soufiane on 07/12/2024.
//

import Testing

@testable import DSA

struct HeapTesting {
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
}

