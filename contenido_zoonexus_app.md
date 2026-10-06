# Contenido textual — App demo "Zoonexus"

Este documento complementa la especificación técnica (`spec_zoonexus_app.md`). Aquí va el **texto exacto** que debe aparecer en cada pantalla, para que el agente que desarrolla la app no invente contenido.

Cada bloque indica su origen:
- **[DOCUMENTO]** = texto tomado literal o casi literal del proyecto de grado entregado por el cliente.
- **[PLACEHOLDER]** = dato que el documento NO especifica con un valor concreto (ej. cifras exactas de temperatura, nombres de animales de ejemplo, horas de alertas). Se sugiere un valor de ejemplo razonable, pero debe tratarse como contenido de relleno editable, no como un dato real del proyecto.

---

## Nota importante sobre el nombre del producto

El documento usa dos nombres para el mismo proyecto: el título oficial es **"Zoonexus: Conectando Animales, Protegiendo Vidas"**, pero en la sección de antecedentes se refiere al dispositivo como **"VetiMed-Link"**. Usar **"Zoonexus"** como nombre principal en toda la app (es el que aparece en la portada del documento), y evitar mezclar ambos nombres para no confundir al profesor evaluador.

---

## 1. Splash

- **[DOCUMENTO]** Nombre del proyecto: **"Zoonexus"**
- **[DOCUMENTO]** Lema: **"Conectando Animales, Protegiendo Vidas"**

## 2. Dashboard (panel principal)

- **[DOCUMENTO]** Descripción funcional de lo que hace la app (úsala como subtítulo o tooltip): *"Aplicación móvil interactiva: envía alertas preventivas al celular del ganadero cuando la temperatura o movimiento del animal cambia."*
- **[PLACEHOLDER]** El documento no da una cifra exacta de temperatura normal/fiebre para el ganado — solo dice que el veterinario del equipo "establecerá los rangos fisiológicos normales y patológicos del animal". Para la demo visual, usar un valor de ejemplo con una nota discreta de que es ilustrativo:
  - Temperatura mostrada: **38.5 °C** (etiqueta: "Valor de ejemplo")
  - Estado: **"Normal"** (chip en verde)
- **[PLACEHOLDER]** Identificador del animal/collar de ejemplo: **"Collar ZX-01 — Hato El Alto"**
- **[PLACEHOLDER]** Batería del collar: **"84%"**

## 3. Historial de alertas

- **[DOCUMENTO]** Encabezado de sección, basado en el servicio descrito: *"Alertas preventivas"* (el documento dice que la app "envía alertas preventivas al celular del ganadero cuando la temperatura o movimiento del animal cambia").
- **[PLACEHOLDER]** Las alertas concretas (texto, hora, animal) no están en el documento — son ejemplos de uso, redactados en el mismo tono del proyecto:
  1. "Posible aumento de temperatura detectado — revisar al animal"
  2. "Cambio de actividad/movimiento registrado"
  3. "Lectura dentro de rango normal — sin acción requerida"

  Mantener el lenguaje simple y directo, igual que exige el documento para la interfaz real: *"las alertas utilicen un lenguaje iconográfico accesible para los agricultores"*.

## 4. Guía de bioseguridad

- **[DOCUMENTO — cita literal]** El documento especifica textualmente las tres instrucciones que debe mostrar la app al productor, acompañando a las alertas:
  > "Aísle al animal", "Lave sus manos", "Use mascarilla"

  Mostrar estas tres tal cual, una por tarjeta/ícono, como el contenido principal de esta pantalla.

- **[DOCUMENTO]** Texto de apoyo/contexto para encabezar la sección (parafraseado del documento, que describe este módulo como): *"Soporte y Orientación Básica: módulo con recomendaciones inmediatas de aislamiento antes de que llegue el veterinario."*

- **[PLACEHOLDER opcional]** Si se quiere una 4ta recomendación para equilibrar visualmente la pantalla, el documento menciona bioseguridad en granja en términos generales (desinfección, control de plagas, equipo de protección) — se puede añadir: *"Desinfecte el área de contacto con el animal"*, dejando claro que es una extensión razonable del mismo principio, no una cita textual.

## 5. Ficha del animal

- **[DOCUMENTO]** Especie: el documento habla de **ganado bovino** como foco principal (aunque también menciona ovino, caprino y camélidos en el marco teórico general). Usar **"Bovino"** para la demo.
- **[PLACEHOLDER]** El documento no da edad, fecha de revisión ni rango numérico exacto de temperatura — son datos de ejemplo:
  - Edad: "3 años"
  - Última revisión: fecha de ejemplo reciente
  - Rango normal de referencia: mostrar como "pendiente de validación veterinaria" o un rango ilustrativo con una nota "(valor de ejemplo)", en vez de presentarlo como dato clínico real.
- **[DOCUMENTO]** Si se agrega un texto de contexto en esta pantalla, puede usarse la definición de zoonosis de la OMS citada en el documento (acortada): *"Una zoonosis es una enfermedad infecciosa que ha pasado de un animal a un humano."* — útil como mensaje educativo breve.

## 6. Acerca del proyecto

- **[DOCUMENTO]** Objetivo general (cita literal, acortable si no entra en una sola pantalla):
  > "Diseñar un sistema biomecatrónico de monitoreo y alerta temprana para la prevención de enfermedades zoonóticas en el ganado periurbano del departamento de La Paz."

- **[DOCUMENTO]** Integrantes del equipo (orden tal como aparece en el documento):
  - Ishai Suan Hepril Alvarez Ticona
  - Erick Rodrigo Fernandez Cruz
  - Jhanet Vargas Mitma

- **[DOCUMENTO]** Tutora: Lic. Beatriz Hosy Ajahuanca Pacari
- **[DOCUMENTO]** Director: Lic. Cruz Alberto Alberto
- **[DOCUMENTO]** Institución: Unidad Educativa Adventista Franz Tamayo — El Alto, noviembre de 2026

- **[DOCUMENTO]** Línea de tiempo — las 4 fases tal como las nombra el documento:
  1. **Fase 1:** Definición de Variables y Co-Diseño Clínico-Técnico
  2. **Fase 2:** Prototipado e Integración Mecatrónica
  3. **Fase 3:** Pruebas de Campo e Implementación del Protocolo Médico
  4. **Fase 4:** Evaluación de Impacto y Modelo de Negocio

- **[DOCUMENTO — opcional si hay espacio]** Roles del equipo técnico (organigrama del documento), por si se quiere una sub-sección:
  - Líder / Dirección General
  - Responsable de Mecatrónica (Hardware y Software)
  - Responsable de Bioseguridad y Salud
  - Responsable Comercial y de Operaciones

---

## Resumen de placeholders que el cliente debería confirmar antes de compilar el .apk final

- [ ] Nombres reales del equipo (ya están en el documento, solo verificar ortografía con ellos).
- [ ] Si quieren mostrar un valor numérico de temperatura "de ejemplo" o prefieren dejarlo genérico (ej. solo el estado "Normal" sin número), ya que el documento no define esa cifra.
- [ ] Confirmar si usar "Zoonexus" o "VetiMed-Link" como único nombre (el documento mezcla ambos).
