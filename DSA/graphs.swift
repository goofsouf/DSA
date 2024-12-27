//
//  graphs.swift
//  DSA
//
//  Created by Soufiane on 20/12/2024.
//
enum MatrixInitializationError: Error {
    case emptyMatrix
    case nonSquareMatrix
}

#if DEBUG
    extension AdjacencyMatrix {
        var debugMatrix: [[Int]] { matrix }
        var debugSize: Int { size }
    }
#endif

/// A class representing a directed graph using an adjacency matrix.
class AdjacencyMatrix {
    /// The number of nodes in the graph.
    private let size: Int
    /// The adjacency matrix representing the graph.
    private var matrix: [[Int]]

    /// Initializes a new adjacency matrix with a given size.
    /// - Parameter size: The number of nodes in the graph.
    init(size: Int) {
        self.size = size
        self.matrix = Array(
            repeating: Array(repeating: 0, count: size), count: size)
    }

    /// Initializes an adjacency matrix.
    /// - Parameter matrix: A 2D array representing the adjacency matrix.
    /// - Throws: `MatrixInitializationError.emptyMatrix` if the matrix is empty,
    ///           `MatrixInitializationError.nonSquareMatrix` if the matrix is not square.
    init(matrix: [[Int]]) throws {
        guard !matrix.isEmpty else {
            throw MatrixInitializationError.emptyMatrix
        }  // Check for empty matrix.
        self.size = matrix.count
        for row in matrix {
            if row.count != self.size {
                throw MatrixInitializationError.nonSquareMatrix  // Ensure all rows are of equal length.
            }
        }
        self.matrix = matrix
    }

    /// Adds a directed edge from one node to another.
    /// - Parameters:
    ///   - from: The source node index.
    ///   - to: The destination node index.
    func addEdge(from: Int, to: Int) {
        guard from < size, to < size else { return }
        self.matrix[from][to] = 1
    }

    /// Removes a directed edge from one node to another.
    /// - Parameters:
    ///   - from: The source node index.
    ///   - to: The destination node index.
    func removeEdge(from: Int, to: Int) {
        guard from < size, to < size else { return }
        self.matrix[from][to] = 0
    }

    /// Checks if a directed edge exists between two nodes.
    /// - Parameters:
    ///   - from: The source node index.
    ///   - to: The destination node index.
    /// - Returns: `true` if an edge exists, otherwise `false`.
    func hasEdge(from: Int, to: Int) -> Bool {
        guard from < size, to < size else { return false }
        return self.matrix[from][to] == 1
    }

    /// Displays the adjacency matrix in the console.
    func display() {
        guard self.size > 0 else { return }
        for row in self.matrix {
            print(row)
        }
    }

    /// Adds a weighted directed edge from one node to another.
    /// - Parameters:
    ///   - from: The source node index.
    ///   - to: The destination node index.
    ///   - weight: The weight of the edge.
    func addEdge(from: Int, to: Int, weight: Int) {
        guard from < size, to < size else { return }
        self.matrix[from][to] = weight
    }

    /// Finds the neighbors of a given node.
    /// - Parameter node: The node index.
    /// - Returns: A list of neighboring nodes that the given node points to.
    func findNeighbors(of node: Int) -> [Int] {
        guard node < self.size else { return [] }
        return (0..<size).filter { self.matrix[node][$0] != 0 }
    }

    /// Calculates the outdegree of a given node.
    /// - Parameter node: The node index.
    /// - Returns: The number of edges going out from the node.
    func outDegree(of node: Int) -> Int {
        guard node < self.size else { return 0 }
        return findNeighbors(of: node).count
    }

    /// Calculates the indegree of a given node.
    /// - Parameter node: The node index.
    /// - Returns: The number of edges coming into the node.
    func inDegree(of node: Int) -> Int {
        guard node < self.size else { return 0 }
        return (0..<size).count { self.matrix[$0][node] != 0 }
    }

    /// Performs Breadth-First Search (BFS) traversal starting from a given node.
    /// - Parameters:
    ///   - startNode: The node index to start the traversal.
    ///   - visit: A closure to process each visited node (default is to print the node).
    func BFS(startNode: Int, visit: (Int) -> Void = { print($0) }) {
        var queue: [Int] = [startNode]  // Queue for nodes to visit.
        var visited: Set<Int> = [startNode]  // Set to track visited nodes.

        while !queue.isEmpty {
            let current = queue.removeFirst()  // Dequeue the first node.
            visit(current)  // Process the current node.

            // Add unvisited neighbors to the queue and mark them as visited.
            let neighbors = self.findNeighbors(of: current)
            queue.append(
                contentsOf: neighbors.filter { visited.insert($0).inserted })
        }
    }

    /// Performs a Depth-First Search (DFS) traversal starting from a given node.
    /// - Parameters:
    ///   - startNode: The node index to start the traversal from.
    ///   - visit: A closure to execute on each visited node (default is to print the node).
    /// - Discussion:
    ///   This function traverses the graph in a depth-first manner, visiting all reachable nodes from the `startNode`.
    ///   The traversal uses recursion to explore neighbors and avoids revisiting nodes using a `Set`.
    /// - Example:
    ///   ```swift
    ///   let matrix = [
    ///       [0, 1, 0, 0],
    ///       [0, 0, 1, 0],
    ///       [0, 0, 0, 1],
    ///       [0, 0, 0, 0]
    ///   ]
    ///   let graph = AdjacencyMatrix(matrix: matrix)
    ///   graph.DFS(startNode: 0) // Output: 0, 1, 2, 3
    ///   ```
    func DFS(startNode: Int, visit: (Int) -> Void = { print($0) }) {
        guard startNode < self.size else {
            print("Invalid start node")
            return
        }
        var visited: Set<Int> = []

        func walkGraph(startNode: Int) {
            visited.insert(startNode)
            visit(startNode)
            let neighbors = self.findNeighbors(of: startNode)
            let toVisit = neighbors.filter { !visited.contains($0) }

            for i in toVisit {
                walkGraph(startNode: i)
            }
        }

        walkGraph(startNode: startNode)
    }
}
