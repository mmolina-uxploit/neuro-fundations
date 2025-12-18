# Concurrencia como Experiencia Percibida

**Concepto:** La concurrencia no es solo rendimiento; es una herramienta para mejorar la UX y proteger el estado compartido.

**Observaciones:**
- async/await permite secuenciar tareas de forma clara y predecible.
- Task y cancelación permiten abortar operaciones que ya no aportan valor al usuario.
- Actors garantizan aislamiento de estado y evitan race conditions.
- Flujos con resultados parciales mejoran percepción de velocidad.

**Decisión tomada:**  
- Usar async/await como patrón principal para operaciones de red y computación en background.
- Aplicar actors para proteger estado crítico.
- Cancelar tareas que no aportan valor a la experiencia del usuario.

