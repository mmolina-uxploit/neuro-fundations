# Neuro-Foundations
### Case Study: Infrastructure Abstraction & Network Integrity

Este repositorio contiene el núcleo de infraestructura diseñado para ser el cimiento de cualquier sistema iOS modular. Se centra en la creación de una capa de red que protege al dominio de la volatilidad de las APIs externas.

**Engineering Thesis:**
La red es un detalle de implementación. Este módulo demuestra cómo crear contratos de red inmutables donde el transporte (URLSession, etc.) puede ser reemplazado sin alterar los modelos de datos del negocio.

**Core Objectives:**
* **Typed Requests:** Eliminación de errores en tiempo de ejecución mediante contratos de petición fuertemente tipados.
* **Error Modeling:** Transformación de fallos técnicos (HTTP, JSON) en errores de dominio con significado de negocio.
* **Dependency Isolation:** El sistema de red es agnóstico a la plataforma, facilitando su portabilidad y testeo.

**Key Decision (ADR):**
* **Decision:** Protocol-based Request Abstraction.
* **Why:** Evita que el cliente de red conozca los detalles de los endpoints, promoviendo la inversión de dependencias.
* **Trade-off:** Mayor abstracción inicial que requiere un boilerplate mínimo para cada nueva petición.
