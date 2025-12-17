# Optionals vs Enums para Modelado de Estados

### Análisis de Modelado

| Característica | Optional | Enum (Sum Types) |
| :--- | :--- | :--- |
| **Capacidad** | Binaria (Presencia / Ausencia) | Multiestado (N estados definidos) |
| **Semántica** | Dato faltante o nulo | Estado específico del dominio |
| **Seguridad** | Requiere unwrapping | Forza exhaustividad (Compiler-checked) |
| **Metadatos** | Solo el valor envuelto | Valores asociados por cada caso |



### Observaciones de Diseño

* **Estados Imposibles:** El uso de múltiples `Optionals` para modelar un estado (ej: `data`, `error` y `isLoading` como propiedades separadas) permite combinaciones inválidas, como tener datos y error simultáneamente. Los `Enums` garantizan que solo un estado sea posible a la vez.
* **Legibilidad:** Un `Enum` actúa como documentación viva. Reemplaza la ambigüedad del "nil" por nombres explícitos que describen el momento actual del flujo.
* **Escalabilidad:** Al añadir un nuevo caso a un `Enum`, el sistema de tipos identifica automáticamente todos los puntos del código que requieren actualización (exhaustive switching).

### Decisión Arquitectónica

1. **Uso de Enums (Preferencia):**
    * Modelado de estados de UI (Idle, Loading, Success, Failure).
    * Resultados de operaciones complejas con diferentes tipos de salida.
    * Lógica de negocio con transiciones de estado definidas.

2. **Uso de Optionals:**
    * Atributos que pueden no existir legítimamente (ej. segundo apellido).
    * Parámetros de configuración con valores por defecto.
    * Resultados de consultas donde la ausencia de valor es la única respuesta alternativa.

---
