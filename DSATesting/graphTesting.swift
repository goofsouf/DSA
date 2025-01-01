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

import Foundation
import Testing

@testable import DSA

struct GraphTesting {
    // MARK: Test Matrix init by size
    @Test func testinitbysize() async throws {
        let expected = [
            [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0],
        ]
        let matrix = AdjacencyMatrix(size: 6)
        #expect(
            matrix.debugMatrix == expected, "Graph init by size not working")
    }

    @Test func testEmptyMatrixThrowsError() async throws {
        // Empty matrix
        let matrix: [[Int]] = []

        do {
            _ = try AdjacencyMatrix(matrix: matrix)
            #expect(Bool(false), "Expected error but got no error")
        } catch {
            #expect(
                error as? MatrixInitializationError == .emptyMatrix,
                "Expected emptyMatrix error")
        }
    }
    @Test func testValidMatrixInitialization() async throws {
        // Valid square matrix
        let matrix = [
            [0, 1, 0],
            [1, 0, 1],
            [0, 1, 0],
        ]
        let adjacencyMatrix = try AdjacencyMatrix(matrix: matrix)

        // Check size and matrix properties
        #expect(adjacencyMatrix.debugSize == 3, "Expected size to be 3")
        #expect(
            adjacencyMatrix.debugMatrix == matrix,
            "Expected matrix to match input")
    }
    @Test func testNonSquareMatrixThrowsError() async throws {
        // Non-square matrix
        let matrix = [
            [0, 1],
            [1],
        ]

        do {
            _ = try AdjacencyMatrix(matrix: matrix)
            #expect(Bool(false), "Expected error but got no error")
        } catch {
            #expect(
                error as? MatrixInitializationError == .nonSquareMatrix,
                "Expected nonSquareMatrix error")
        }
    }

    @Test func testSingleElementMatrix() async throws {
        // Valid matrix with a single element
        let matrix = [[1]]
        let adjacencyMatrix = try AdjacencyMatrix(matrix: matrix)

        #expect(adjacencyMatrix.debugSize == 1, "Expected size to be 1")
        #expect(
            adjacencyMatrix.debugMatrix == matrix,
            "Expected matrix to match input")
    }

    @Test func testAddEdge() async throws {
        // Given
        let matrix = [
            [0, 0, 0],
            [0, 0, 0],
            [0, 0, 0],
        ]
        let adjacencyMatrix = try AdjacencyMatrix(matrix: matrix)

        // When
        adjacencyMatrix.addEdge(from: 0, to: 1)

        // Then
        let expectedMatrix = [
            [0, 1, 0],
            [0, 0, 0],
            [0, 0, 0],
        ]
        #expect(
            adjacencyMatrix.debugMatrix == expectedMatrix,
            "Edge not added correctly")
    }

    @Test func testRemoveEdge() async throws {
        // Given
        let matrix = [
            [0, 1, 0],
            [0, 0, 0],
            [0, 0, 0],
        ]
        let adjacencyMatrix = try AdjacencyMatrix(matrix: matrix)

        // When
        adjacencyMatrix.removeEdge(from: 0, to: 1)

        // Then
        let expectedMatrix = [
            [0, 0, 0],
            [0, 0, 0],
            [0, 0, 0],
        ]
        #expect(
            adjacencyMatrix.debugMatrix == expectedMatrix,
            "Edge not removed correctly")
    }

    @Test func testHasEdge() async throws {
        // Given
        let matrix = [
            [0, 1, 0],
            [0, 0, 0],
            [0, 0, 0],
        ]
        let adjacencyMatrix = try AdjacencyMatrix(matrix: matrix)

        // When & Then
        #expect(
            adjacencyMatrix.hasEdge(from: 0, to: 1) == true,
            "Edge should exist from 0 to 1")
        #expect(
            adjacencyMatrix.hasEdge(from: 0, to: 2) == false,
            "Edge should not exist from 0 to 2")
        #expect(
            adjacencyMatrix.hasEdge(from: 2, to: 0) == false,
            "Edge should not exist from 2 to 0")
    }

    @Test func testAddWeightedEdge() async throws {
        // Given
        let matrix = [
            [0, 0, 0],
            [0, 0, 0],
            [0, 0, 0],
        ]
        let adjacencyMatrix = try AdjacencyMatrix(matrix: matrix)

        // When
        adjacencyMatrix.addEdge(from: 0, to: 1, weight: 5)

        // Then
        let expectedMatrix = [
            [0, 5, 0],
            [0, 0, 0],
            [0, 0, 0],
        ]
        #expect(
            adjacencyMatrix.debugMatrix == expectedMatrix,
            "Weighted edge not added correctly")
    }

    @Test func testFindNeighbors() async throws {
        // Given
        let matrix = [
            [0, 1, 0],
            [0, 0, 1],
            [1, 0, 0],
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
            [1, 0, 0],
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
            [1, 0, 0],
        ]
        let adjacencyMatrix = try AdjacencyMatrix(matrix: matrix)

        // When
        let inDegree = adjacencyMatrix.inDegree(of: 2)

        // Then
        #expect(inDegree == 1, "Indegree of node 2 should be 1")
    }

    @Test
    func testBFSConnectedGraph() async throws {
        let matrix = [
            [0, 1, 0, 0],
            [0, 0, 1, 0],
            [0, 0, 0, 1],
            [0, 0, 0, 0],
        ]
        let graph = try AdjacencyMatrix(matrix: matrix)

        var result: [Int] = []
        graph.BFS(startNode: 0) { node in
            result.append(node)
        }

        let expected = [0, 1, 2, 3]
        #expect(
            result == expected,
            "BFS failed on connected graph. Got \(result), expected \(expected)."
        )
    }

    @Test
    func testBFSDisconnectedGraph() async throws {
        let matrix = [
            [0, 1, 0, 0],
            [0, 0, 0, 0],
            [0, 0, 0, 1],
            [0, 0, 0, 0],
        ]
        let graph = try AdjacencyMatrix(matrix: matrix)

        var result: [Int] = []
        graph.BFS(startNode: 0) { node in
            result.append(node)
        }

        let expected = [0, 1]
        #expect(
            result == expected,
            "BFS failed on disconnected graph. Got \(result), expected \(expected)."
        )
    }

    @Test
    func testBFSWithCycle() async throws {
        let matrix = [
            [0, 1, 0, 0],
            [0, 0, 1, 0],
            [0, 0, 0, 1],
            [1, 0, 0, 0],
        ]
        let graph = try AdjacencyMatrix(matrix: matrix)

        var result: [Int] = []
        graph.BFS(startNode: 0) { node in
            result.append(node)
        }

        let expected = [0, 1, 2, 3]
        #expect(
            result == expected,
            "BFS failed on graph with a cycle. Got \(result), expected \(expected)."
        )
    }

    @Test
    func testBFSFromIsolatedNode() async throws {
        let matrix = [
            [0, 0, 0, 0],
            [0, 0, 0, 0],
            [0, 0, 0, 0],
            [0, 0, 0, 0],
        ]
        let graph = try AdjacencyMatrix(matrix: matrix)

        var result: [Int] = []
        graph.BFS(startNode: 0) { node in
            result.append(node)
        }

        let expected = [0]
        #expect(
            result == expected,
            "BFS failed on isolated node. Got \(result), expected \(expected).")
    }

    @Test
    func testBFSWithSingleNode() async throws {
        let matrix = [[0]]
        let graph = try AdjacencyMatrix(matrix: matrix)

        var result: [Int] = []
        graph.BFS(startNode: 0) { node in
            result.append(node)
        }

        let expected = [0]
        #expect(
            result == expected,
            "BFS failed on single-node graph. Got \(result), expected \(expected)."
        )
    }

    @Test func testDFSOnConnectedGraph() async throws {
        // Arrange: Create a fully connected directed graph
        let matrix = [
            [0, 1, 0, 0],
            [0, 0, 1, 0],
            [0, 0, 0, 1],
            [0, 0, 0, 0],
        ]
        let graph = try AdjacencyMatrix(matrix: matrix)

        var visitedNodes: [Int] = []
        let expectedOrder = [0, 1, 2, 3]  // Expected DFS traversal order

        // Act: Perform DFS traversal
        graph.DFS(startNode: 0) { visitedNodes.append($0) }

        // Assert
        #expect(
            visitedNodes == expectedOrder,
            "DFS order does not match the expected order")
    }

    @Test func testDFSOnDisconnectedGraph() async throws {
        // Arrange: Create a disconnected directed graph
        let matrix = [
            [0, 1, 0, 0],
            [0, 0, 0, 0],
            [0, 0, 0, 1],
            [0, 0, 0, 0],
        ]
        let graph = try AdjacencyMatrix(matrix: matrix)

        var visitedFromZero: [Int] = []
        var visitedFromTwo: [Int] = []

        let expectedFromZero = [0, 1]  // Expected DFS traversal from node 0
        let expectedFromTwo = [2, 3]  // Expected DFS traversal from node 2

        // Act: Perform DFS traversal from different start nodes
        graph.DFS(startNode: 0) { visitedFromZero.append($0) }
        graph.DFS(startNode: 2) { visitedFromTwo.append($0) }

        // Assert
        #expect(
            visitedFromZero == expectedFromZero,
            "DFS from node 0 does not match the expected order")
        #expect(
            visitedFromTwo == expectedFromTwo,
            "DFS from node 2 does not match the expected order")
    }

    @Test func testDFSOnSingleNodeGraph() async throws {
        // Arrange: Create a graph with a single node
        let matrix = [[0]]
        let graph = try AdjacencyMatrix(matrix: matrix)

        var visitedNodes: [Int] = []
        let expectedOrder = [0]  // Expected DFS traversal order

        // Act: Perform DFS traversal
        graph.DFS(startNode: 0) { visitedNodes.append($0) }

        // Assert
        #expect(
            visitedNodes == expectedOrder,
            "DFS on single node graph does not match the expected order")
    }

    @Test func testDFSOnInvalidStartNode() async throws {
        // Arrange: Create a graph
        let matrix = [
            [0, 1, 0, 0],
            [0, 0, 1, 0],
            [0, 0, 0, 1],
            [0, 0, 0, 0],
        ]
        let graph = try AdjacencyMatrix(matrix: matrix)

        var visitedNodes: [Int] = []

        // Act: Perform DFS traversal from an invalid start node
        graph.DFS(startNode: 10) { visitedNodes.append($0) }

        // Assert
        #expect(
            visitedNodes.isEmpty,
            "DFS should not visit any nodes when starting from an invalid node")
    }

    @Test func testDFSiterativeOnConnectedGraph() async throws {
        // Arrange: Create a fully connected directed graph
        let matrix = [
            [0, 1, 0, 0],
            [0, 0, 1, 0],
            [0, 0, 0, 1],
            [0, 0, 0, 0],
        ]
        let graph = try AdjacencyMatrix(matrix: matrix)

        var visitedNodes: [Int] = []
        let expectedOrder = [0, 1, 2, 3]  // Expected DFSiterative traversal order

        // Act: Perform DFSiterative traversal
        graph.DFSiterative(startNode: 0) { visitedNodes.append($0) }

        // Assert
        #expect(
            visitedNodes == expectedOrder,
            "DFSiterative order does not match the expected order")
    }

    @Test func testDFSiterativeOnDisconnectedGraph() async throws {
        // Arrange: Create a disconnected directed graph
        let matrix = [
            [0, 1, 0, 0],
            [0, 0, 0, 0],
            [0, 0, 0, 1],
            [0, 0, 0, 0],
        ]
        let graph = try AdjacencyMatrix(matrix: matrix)

        var visitedFromZero: [Int] = []
        var visitedFromTwo: [Int] = []

        let expectedFromZero = [0, 1]  // Expected DFSiterative traversal from node 0
        let expectedFromTwo = [2, 3]  // Expected DFSiterative traversal from node 2

        // Act: Perform DFSiterative traversal from different start nodes
        graph.DFSiterative(startNode: 0) { visitedFromZero.append($0) }
        graph.DFSiterative(startNode: 2) { visitedFromTwo.append($0) }

        // Assert
        #expect(
            visitedFromZero == expectedFromZero,
            "DFSiterative from node 0 does not match the expected order")
        #expect(
            visitedFromTwo == expectedFromTwo,
            "DFSiterative from node 2 does not match the expected order")
    }

    @Test func testDFSiterativeOnSingleNodeGraph() async throws {
        // Arrange: Create a graph with a single node
        let matrix = [[0]]
        let graph = try AdjacencyMatrix(matrix: matrix)

        var visitedNodes: [Int] = []
        let expectedOrder = [0]  // Expected DFSiterative traversal order

        // Act: Perform DFSiterative traversal
        graph.DFSiterative(startNode: 0) { visitedNodes.append($0) }

        // Assert
        #expect(
            visitedNodes == expectedOrder,
            "DFSiterative on single node graph does not match the expected order"
        )
    }

    @Test func testDFSiterativeOnInvalidStartNode() async throws {
        // Arrange: Create a graph
        let matrix = [
            [0, 1, 0, 0],
            [0, 0, 1, 0],
            [0, 0, 0, 1],
            [0, 0, 0, 0],
        ]
        let graph = try AdjacencyMatrix(matrix: matrix)

        var visitedNodes: [Int] = []

        // Act: Perform DFSiterative traversal from an invalid start node
        graph.DFSiterative(startNode: 10) { visitedNodes.append($0) }

        // Assert
        #expect(
            visitedNodes.isEmpty,
            "DFSiterative should not visit any nodes when starting from an invalid node"
        )
    }
    @Test func testGetWeightsValidNodes() async throws {
        let adjacencyMatrix = [
            [0, 4, 1, 0],
            [0, 0, 0, 1],
            [0, 2, 0, 5],
            [0, 0, 0, 0]
        ]
        let graph = try AdjacencyMatrix(matrix: adjacencyMatrix)
        
        let sourceNode = 0
        let destinationNodes = [1, 2, 3]
        let expectedWeights = [4, 1, 0]
        
        let weights = graph.getWeights(from: sourceNode, to: destinationNodes)
        
        #expect(weights == expectedWeights, "Weights for valid nodes are incorrect")
    }

    @Test func testGetWeightsWithInvalidDestination() async throws {
        let adjacencyMatrix = [
            [0, 4, 1, 0],
            [0, 0, 0, 1],
            [0, 2, 0, 5],
            [0, 0, 0, 0]
        ]
        let graph = try AdjacencyMatrix(matrix: adjacencyMatrix)
        
        let sourceNode = 0
        let destinationNodes = [1, 2, 4] // Node 4 is invalid
        let expectedWeights = [4, 1, 0] // Weight for invalid node should be 0
        
        let weights = graph.getWeights(from: sourceNode, to: destinationNodes)
        
        #expect(weights == expectedWeights, "Weights for nodes including invalid destinations are incorrect")
    }

    @Test func testGetWeightsInvalidSource() async throws {
        let adjacencyMatrix = [
            [0, 4, 1, 0],
            [0, 0, 0, 1],
            [0, 2, 0, 5],
            [0, 0, 0, 0]
        ]
        let graph = try AdjacencyMatrix(matrix: adjacencyMatrix)
        
        let sourceNode = 5 // Invalid source node
        let destinationNodes = [1, 2, 3]
        let expectedWeights: [Int] = [] // No weights should be returned
        
        let weights = graph.getWeights(from: sourceNode, to: destinationNodes)
        
        #expect(weights == expectedWeights, "Weights for an invalid source node should be empty")
    }

    @Test func testGetWeightsEmptyDestinationList() async throws {
        let adjacencyMatrix = [
            [0, 4, 1, 0],
            [0, 0, 0, 1],
            [0, 2, 0, 5],
            [0, 0, 0, 0]
        ]
        let graph = try AdjacencyMatrix(matrix: adjacencyMatrix)
        
        let sourceNode = 0
        let destinationNodes: [Int] = [] // Empty destination list
        let expectedWeights: [Int] = [] // No weights should be returned
        
        let weights = graph.getWeights(from: sourceNode, to: destinationNodes)
        
        #expect(weights == expectedWeights, "Weights for an empty destination list should be empty")
    }
    
    @Test func testSingleNodeGraph() async throws {
        let matrix = [
            [0]
        ]
        let graph = try AdjacencyMatrix(matrix: matrix)

        let distances = graph.dijkstra(source: 0)

        #expect(distances == [0], "Expected distances to be [0] for a single-node graph")
    }

    @Test func testSmallGraph() async throws {
        let matrix = [
            [0, 1, 4],
            [0, 0, 2],
            [0, 0, 0]
        ]
        let graph = try AdjacencyMatrix(matrix: matrix)

        let distances = graph.dijkstra(source: 0)

        #expect(distances == [0, 1, 3], "Expected distances to be [0, 1, 3] for small graph")
    }

    @Test func testDisconnectedGraph() async throws {
        let matrix = [
            [0, 3, 0],
            [0, 0, 0],
            [0, 0, 0]
        ]
        let graph = try AdjacencyMatrix(matrix: matrix)

        let distances = graph.dijkstra(source: 0)

        #expect(distances == [0, 3, Int.max], "Expected distances to be [0, 3, Int.max] for disconnected graph")
    }

    @Test func testLargerGraph() async throws {
        let matrix = [
            [0, 4, 0, 0, 0, 0],
            [0, 0, 3, 2, 0, 0],
            [0, 0, 0, 0, 7, 0],
            [0, 0, 1, 0, 0, 1],
            [0, 0, 0, 0, 0, 5],
            [0, 0, 0, 0, 0, 0]
        ]
        let graph = try AdjacencyMatrix(matrix: matrix)

        let distances = graph.dijkstra(source: 0)

        #expect(
            distances == [0, 4, 7, 6, 14, 7],
            "Expected distances to be [0, 4, 7, 6, 14, 7] for larger graph"
        )
    }

    @Test func testAllNodesDisconnected() async throws {
        let matrix = [
            [0, 0, 0],
            [0, 0, 0],
            [0, 0, 0]
        ]
        let graph = try AdjacencyMatrix(matrix: matrix)

        let distances = graph.dijkstra(source: 0)

        #expect(distances == [0, Int.max, Int.max], "Expected distances to be [0, Int.max, Int.max] for disconnected nodes")
    }

    @Test func testCompleteGraph() async throws {
        let matrix = [
            [0, 1, 1],
            [1, 0, 1],
            [1, 1, 0]
        ]
        let graph = try AdjacencyMatrix(matrix: matrix)

        let distances = graph.dijkstra(source: 0)

        #expect(distances == [0, 1, 1], "Expected distances to be [0, 1, 1] for a complete graph")
    }

    @Test func testSinglePathGraph() async throws {
        let matrix = [
            [0, 2, 0, 0],
            [0, 0, 3, 0],
            [0, 0, 0, 1],
            [0, 0, 0, 0]
        ]
        let graph = try AdjacencyMatrix(matrix: matrix)

        let distances = graph.dijkstra(source: 0)

        #expect(distances == [0, 2, 5, 6], "Expected distances to be [0, 2, 5, 6] for single path graph")
    }

    @Test func testCycleGraph() async throws {
        let matrix = [
            [0, 1, 0],
            [0, 0, 1],
            [1, 0, 0]
        ]
        let graph = try AdjacencyMatrix(matrix: matrix)

        let distances = graph.dijkstra(source: 0)

        #expect(distances == [0, 1, 2], "Expected distances to be [0, 1, 2] for cycle graph")
    }
}
