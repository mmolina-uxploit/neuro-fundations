//: [Previous](@previous)

import Foundation


// MARK: - Tipo de seguro para usuario
struct User {
    let id: UUID
    let name: String
}

// No se puede crear un User sin id o name -> estado inválido imposible
let validUser = User(id: UUID(), name: "Matías")
// let invalidUser = User() // Error de compilación

// MARK: - Enum seguro para estados combinados
enum DownloadStatus {
    case notStarted
    case inProgress(progress: Double)
    case completed(file: String)
    case failed(error: String)
}

var status: DownloadStatus = .notStarted

switch status {
    case .notStarted:
        print("Not started")
    case .inProgress(progress: let progress):
        print("Progress: \(progress)")
    case .completed(file: let file):
        print("Download completed: \(file)")
    case .failed(error: let error):
        print("Error: \(error)")
    
}



// Observación
// - El compilador previene cualquier estado no declarado.
// - Cada combinación inválida queda eliminada en tiempo de compilación.















//: [Next](@next)
