//
//  TreesTesting 2.swift
//  DSA
//
//  Created by Soufiane on 21/12/2024.
//


//
//  DSATesting.swift
//  DSATesting
//
//  Created by Soufiane on 29/11/2024.
//

import Testing
import Foundation
@testable import DSA

struct GraphTesting
{
    // MARK: Test Matrix init by size
    @Test func testinitbysize() async throws {
        let expected = [[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0]]
        let matrix = AdjacencyMatrix(size: 6)
        #expect(matrix.debugMatrix == expected, "Graph init by size not working")
    }
    
    @Test func testEmptyMatrixThrowsError() async throws {
        // Empty matrix
        let matrix: [[Int]] = []

        do {
            _ = try AdjacencyMatrix(matrix: matrix)
            #expect(Bool(false), "Expected error but got no error")
        } catch {
            #expect(error as? MatrixInitializationError == .emptyMatrix, "Expected emptyMatrix error")
        }
    }
    @Test func testValidMatrixInitialization() async throws {
        // Valid square matrix
        let matrix = [
            [0, 1, 0],
            [1, 0, 1],
            [0, 1, 0]
        ]
        let adjacencyMatrix = try AdjacencyMatrix(matrix: matrix)

        // Check size and matrix properties
        #expect(adjacencyMatrix.debugSize == 3, "Expected size to be 3")
        #expect(adjacencyMatrix.debugMatrix == matrix, "Expected matrix to match input")
    }
    @Test func testNonSquareMatrixThrowsError() async throws {
        // Non-square matrix
        let matrix = [
            [0, 1],
            [1]
        ]

        do {
            _ = try AdjacencyMatrix(matrix: matrix)
            #expect(Bool(false), "Expected error but got no error")
        } catch {
            #expect(error as? MatrixInitializationError == .nonSquareMatrix, "Expected nonSquareMatrix error")
        }
    }
    
    @Test func testSingleElementMatrix() async throws {
        // Valid matrix with a single element
        let matrix = [[1]]
        let adjacencyMatrix = try AdjacencyMatrix(matrix: matrix)

        #expect(adjacencyMatrix.debugSize == 1, "Expected size to be 1")
        #expect(adjacencyMatrix.debugMatrix == matrix, "Expected matrix to match input")
    }
    
    @Test func testAddEdge() async throws {
        // Given
        let matrix = [
            [0, 0, 0],
            [0, 0, 0],
            [0, 0, 0]
        ]
        let adjacencyMatrix = try AdjacencyMatrix(matrix: matrix)

        // When
        adjacencyMatrix.addEdge(from: 0, to: 1)

        // Then
        let expectedMatrix = [
            [0, 1, 0],
            [0, 0, 0],
            [0, 0, 0]
        ]
        #expect(adjacencyMatrix.debugMatrix == expectedMatrix, "Edge not added correctly")
    }

    @Test func testRemoveEdge() async throws {
        // Given
        let matrix = [
            [0, 1, 0],
            [0, 0, 0],
            [0, 0, 0]
        ]
        let adjacencyMatrix = try AdjacencyMatrix(matrix: matrix)

        // When
        adjacencyMatrix.removeEdge(from: 0, to: 1)

        // Then
        let expectedMatrix = [
            [0, 0, 0],
            [0, 0, 0],
            [0, 0, 0]
        ]
        #expect(adjacencyMatrix.debugMatrix == expectedMatrix, "Edge not removed correctly")
    }

    @Test func testHasEdge() async throws {
        // Given
        let matrix = [
            [0, 1, 0],
            [0, 0, 0],
            [0, 0, 0]
        ]
        let adjacencyMatrix = try AdjacencyMatrix(matrix: matrix)

        // When & Then
        #expect(adjacencyMatrix.hasEdge(from: 0, to: 1) == true, "Edge should exist from 0 to 1")
        #expect(adjacencyMatrix.hasEdge(from: 0, to: 2) == false, "Edge should not exist from 0 to 2")
        #expect(adjacencyMatrix.hasEdge(from: 2, to: 0) == false, "Edge should not exist from 2 to 0")
    }

    @Test func testAddWeightedEdge() async throws {
        // Given
        let matrix = [
            [0, 0, 0],
            [0, 0, 0],
            [0, 0, 0]
        ]
        let adjacencyMatrix = try AdjacencyMatrix(matrix: matrix)

        // When
        adjacencyMatrix.addEdge(from: 0, to: 1, weight: 5)

        // Then
        let expectedMatrix = [
            [0, 5, 0],
            [0, 0, 0],
            [0, 0, 0]
        ]
        #expect(adjacencyMatrix.debugMatrix == expectedMatrix, "Weighted edge not added correctly")
    }

    @Test func testFindNeighbors() async throws {
        // Given
        let matrix = [
            [0, 1, 0],
            [0, 0, 1],
            [1, 0, 0]
        ]
        let adjacencyMatrix = try AdjacencyMatrix(matrix: matrix)

        // When
        let neighbors = adjacencyMatrix.findNeighbors(of: 0)

        // Then
        let expectedNeighbors = [1]
        #expect(neighbors == expectedNeighbors, "Neighbors not found correctly")
    }

    @Test func testOutDegree() async throws {
        // Given
        let matrix = [
            [0, 1, 1],
            [0, 0, 1],
            [1, 0, 0]
        ]
        let adjacencyMatrix = try AdjacencyMatrix(matrix: matrix)

        // When
        let outDegree = adjacencyMatrix.outDegree(of: 0)

        // Then
        #expect(outDegree == 2, "Outdegree of node 0 should be 2")
    }

    @Test func testInDegree() async throws {
        // Given
        let matrix = [
            [0, 1, 0],
            [0, 0, 1],
            [1, 0, 0]
        ]
        let adjacencyMatrix = try AdjacencyMatrix(matrix: matrix)

        // When
        let inDegree = adjacencyMatrix.inDegree(of: 2)

        // Then
        #expect(inDegree == 1, "Indegree of node 2 should be 1")
    }
}
