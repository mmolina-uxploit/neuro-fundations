import Foundation

// MARK: - Value Type Example (Struct)

struct Point {
    var x: Int
    var y: Int
}

var point_1 = Point(x: 0, y: 0)
var point_2 = point_1 // Copia independiente
point_2.x = 10 // No afecta a point_one

print("point_1: \(point_1)") // (0,0)
print("point_2: \(point_2)") // (10,0)

// Observación
// - Struct crea copias independientes -> seguridad de estado y facilidad de testing.

 // MARK: - Reference Type Example (Class)
class Node {
    var value: Int
    init(value: Int) {
        self.value = value
    }
}

let node_1 = Node(value: 5)
let node_2 = node_1 // Referencia compartida
node_2.value = 20 // Afecta a node_1 también

print("node_1.value: \(node_1.value)") // 20
print("node_2.value: \(node_2.value)") // 20

// Observación
// - Class comparte referencia -> cuidado con side-effects y mutablidad inesperada.

//: [Next](@next)
