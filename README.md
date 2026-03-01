# neuro-foundations

## Project Overview

**neuro-foundations** es el núcleo neural de decisiones técnicas y seguridad de tipos para sistemas iOS. Este documento consolida contratos de diseño y fundaciones del lenguaje que transforman reglas de negocio en invariantes garantizadas por el compilador de Swift, eliminando estados inválidos antes de la ejecución.
---

## Engineering Goals
* **Reducción de Estados Imposibles:** Desplazar la detección de errores del Runtime al Compile-time.
* **Aislamiento de Estado:** Garantizar la integridad de los datos mediante semántica de valor estricta.
* **Memoria Organizacional:** Centralizar decisiones técnicas para evitar arquitecturas frágiles.
* **Eficiencia de Recursos:** Optimizar el uso de Stack vs. Heap según la naturaleza del dato.


## Architecture
El sistema se basa en la **Arquitectura de Contratos**. El boundary principal separa los tipos primitivos de los tipos de dominio, asegurando que ningún dato inválido sea representable.

### Core Logic: Value vs Reference Semantics
| Atributo | Struct (Valor) | Class (Referencia) |
| :--- | :--- | :--- |
| **Copia** | Copia profunda (dato completo) | Copia superficial (puntero) |
| **Memoria** | Stack (Eficiencia de acceso) | Heap (Gestión vía ARC) |
| **Identidad** | Basada en contenido | Basada en instancia única |
| **Mutabilidad** | Definida por el contenedor | Independiente del contenedor |



## Architectural Decisions (ADR-lite)


* **Decision: Structs por defecto para modelos y estados.**
    * **Context:** Modelado de dominio y DTOs.
    * **Why:** Previene efectos secundarios (side-effects) y garantiza thread-safety nativo.
    * **Tradeoffs:** Requiere inmutabilidad explícita y flujos unidireccionales.


* **Decision: Enums (Sum Types) sobre Optionals para flujos.**
    * **Context:** Estados de UI (Loading/Error/Success).
    * **Why:** Hace que los estados imposibles (ej. datos y error simultáneos) sean irrepresentables.
    * **Tradeoffs:** Obliga a un manejo exhaustivo mediante `switch` en la capa de presentación.


* **Decision: Actors para protección de estado compartido.**
    * **Context:** Gestores de sesión y sincronización.
    * **Why:** El compilador garantiza aislamiento de datos y previene race conditions.
    * **Tradeoffs:** Introduce puntos de suspensión obligatorios (`await`).


## Technology Stack
* **Swift 6:** Modelo de concurrencia estricta y seguridad de tipos.
* **Structured Concurrency:** `async/await` para gestión de flujos asíncronos.


## Testing Strategy
* **Qué se protege:** Invariantes de inicialización y contratos de dominio.
* **Qué NO se testea:** Frameworks de Apple o lógica de UI.
* **Rol de los tests:** El diseño "Correcto por Construcción" convierte al compilador en el primer nivel de test unitario.


## Project Structure (Logic breakdown)
* **Domain Contracts:** Implementación de tipos específicos (Email, ID, Currency) que validan su estado en el `init`.
* **Decision Logs:** Registro integrado de justificaciones técnicas sobre semántica y concurrencia.
* **Impossible State Patterns:** Ejemplos de refactorización de estados booleanos/opcionales a tipos sumatorios.


## Execution
Para evaluar los contratos de diseño:
1. Clonar: `git clone https://github.com/mmolina-uxploit/neuro-fundations.git`
2. El contenido técnico y las validaciones de tipos están documentados exhaustivamente en este README y en el código fuente adjunto.


## Engineering Tradeoffs & Limitations
* **Inversión Inicial:** Requiere un modelado de tipos exhaustivo previo a la implementación.
* **Carga Cognitiva:** El enfoque en "arquitectura invisible" requiere desarrolladores familiarizados con teoría de tipos.
* **Agnosticismo:** El sistema se enfoca en la integridad del modelo en memoria, delegando la persistencia a capas externas.

