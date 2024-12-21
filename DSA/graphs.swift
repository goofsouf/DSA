//
//  graphs.swift
//  DSA
//
//  Created by Soufiane on 20/12/2024.
//

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
}
