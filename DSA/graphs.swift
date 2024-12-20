//
//  graphs.swift
//  DSA
//
//  Created by Soufiane on 20/12/2024.
//

class AdjacencyMatrix {
    private let size: Int
    private var matrix: [[Int]]
    
    init(size: Int) {
        self.size = size
        self.matrix = Array(
            repeating: Array(repeating: 0, count: size), count: size)
    }
    
    func addEdge(from: Int, to: Int) {
        guard from < size, to < size else { return }
        self.matrix[from][to] = 1
    }
    
    func removeEdge(from: Int, to: Int) {
        guard from < size, to < size else { return }
        self.matrix[from][to] = 0
    }
    
    func hasEdge(from: Int, to: Int) -> Bool {
        guard from < size, to < size else { return false }
        return self.matrix[from][to] == 1
    }
    
    func display() {
        guard self.size > 0 else { return }
        for row in self.matrix {
            print(row)
        }
    }
    
//    func addUndirectedEdge(from: Int, to: Int) {
//        guard from < size, to < size else { return }
//        self.matrix[from][to] = 1
//        self.matrix[to][from] = 1
//    }
    
    func addEdge(from: Int, to: Int, weight: Int) {
        guard from < size, to < size else { return }
        self.matrix[from][to] = weight
    }
}
