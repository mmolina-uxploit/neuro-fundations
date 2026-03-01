//: [Previous](@previous)

import Foundation

// MARK: -  Async/Await básico
func fecthData() async -> String {
    try? await Task.sleep(nanoseconds: 1_000_000_000) // 1 segundo
    return "Uploaded data"
}

Task {
    let result = await fecthData()
    print(result)
}

// MARK: -  Cancelación de tareas
let task = Task {
    try? await Task.sleep(nanoseconds: 2_000_000_000)
    print("Task completed")
}


task.cancel() // Cancela la tarea antes de completarse.

// MARK: - Actor para proteger estado compartido
actor Counter {
    private var value = 0
    
    func increment() {
        value += 1
    }
    
    func get() -> Int {
        value
    }
}

let counter = Counter()

Task {
    await counter.increment()
    print(await counter.get()) // Acceso seguro desde múltiples tareas
}

// Observación
// - async/await permite secuenciar tareas sin bloquear.
// - Cancelación evita operaciones innecesarias para UX.
// - Actors protegen el estado crítico de race conditions-

//: [Next](@next)
