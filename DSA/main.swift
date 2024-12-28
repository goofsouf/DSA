import Foundation
let matrix = [
    [0, 1, 0],
    [0, 0, 1],
    [1, 0, 0]
]
let graph = try AdjacencyMatrix(matrix: matrix)

graph.display()
graph.DFSiterative(startNode: 0)
