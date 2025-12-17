//: [Previous](@previous)

import Foundation

// MARK: - Optional como estado
var username: String? = nil

if let name = username {
    print("User: \(name)")
}
else {
    print("No users found")
}

// Observación
// - Optional indica ausencia de valor, pero no modela otros estados como "loading" o "error".

// MARK: - Enum
enum LoadState {
    case idle
    case loading
    case loaded(String)
    case error(String)
}

var state: LoadState = .idle

switch state {
case .idle:
    print("Waiting for action")
case .loading:
    print("Loading")
case .loaded(let data):
    print("Data loaded: \(data)")
case .error(let message):
    print("Error: \(message)")
}

// Observación
// - Enum obliga a manejar todos los casos -> previene estados inválidos.
// - Permite renderizar UI consistentemente según el estado.





//: [Next](@next)
