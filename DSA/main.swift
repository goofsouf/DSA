import Foundation

let graphMatrix = [
    [0, 1, 0, 0, 0, 0, 0, 2],
    [0, 0, 4, 1, 0, 3, 0, 0],
    [0, 0, 0, 3, 0, 0, 0, 0],
    [0, 0, 0, 0, 1, 6, 0, 0],
    [0, 0, 0, 0, 0, 2, 0, 0],
    [0, 0, 2, 0, 0, 0, 3, 5],
    [0, 0, 0, 0, 0, 0, 0, 2],
    [0, 0, 0, 0, 9, 0, 0, 0],

]


let graph2 = try AdjacencyMatrix(matrix: graphMatrix)
let neighbors = graph2.findNeighbors(of: 0)

print(graph2.dijkstra(source: 0))
