# Especificación técnica — App demo "Zoonexus"

## 1. Qué se va a construir

Una app móvil **Flutter**, sin funcionalidad real (solo navegación entre pantallas con datos de ejemplo hardcodeados), que simula el sistema de monitoreo ganadero "Zoonexus: Conectando Animales, Protegiendo Vidas". El entregable final es un **.apk instalable** para que un profesor la revise navegando entre secciones.

**No construir:** backend, base de datos, conexión a sensores reales, lógica de alertas, autenticación, ni persistencia de datos. Todo el contenido es estático/mock, embebido en el código.

## 2. Stack técnico

- **Framework:** Flutter (última versión estable), target Android (.apk release).
- **Librería UI:** Syncfusion Flutter Widgets (`syncfusion_flutter_gauges`, `syncfusion_flutter_charts`) — plan gratuito, licencia Community para uso estudiantil. Úsala para:
  - El gauge circular de temperatura en el Dashboard.
  - El mini-gráfico de línea (histórico simulado) en la Ficha del animal, si aporta valor visual sin complicar el tiempo.
- **Íconos:** `Icons` de Material / Material Symbols — mantener un único set en toda la app, no mezclar con otros paquetes de íconos.
- **Navegación:** `BottomNavigationBar` o `NavigationRail` con 5 destinos principales (Dashboard, Alertas, Bioseguridad, Ficha del animal, Acerca de) + Splash inicial que redirige automáticamente al Dashboard tras ~2s.
- **Estado:** no se requiere gestión de estado compleja (no hay backend). `StatefulWidget` simple o `Provider` solo si simplifica el código, no es obligatorio.
- **Datos:** un archivo `mock_data.dart` con listas/objetos Dart hardcodeados (ver sección 4) — nada de JSON remoto ni `http`.

## 3. Tema / Sistema de diseño

Definir un `ThemeData` (Material 3) único y reutilizarlo en todas las pantallas:

| Token | Valor sugerido | Uso |
|---|---|---|
| Color primario | Verde `#2E7D5B` | Acentos, botones, estado "normal" |
| Color secundario | Azul petróleo `#1F3A5F` | Headers, navegación |
| Alerta / atención | Ámbar `#C98A1F` | Estado "atención" |
| Alerta / crítico | Rojo `#A33B3B` | Estado "alerta" |
| Fondo | Gris muy claro `#F5F7F6` | Fondo general |
| Tipografía | `Inter` o la fuente por defecto de Material (Roboto) si no hay tiempo de empaquetar fuentes | Todo el texto |

Usar siempre el mismo componente de "card" (bordes redondeados ~12px, sombra suave) para las tarjetas de datos en todas las pantallas, así se percibe como un solo sistema coherente y no 6 pantallas sueltas.

## 4. Pantallas (6) y contenido mock

### 4.1 Splash
- Logo/texto "Zoonexus" centrado, lema "Conectando Animales, Protegiendo Vidas".
- Fondo con el color secundario, redirección automática al Dashboard.

### 4.2 Dashboard (pantalla principal — la más importante visualmente)
- Card superior: nombre del collar/animal activo (ej. "Vaca #04 — Collar ZX-104").
- Gauge circular de temperatura: valor mock **38.5 °C**, rango normal 37.5–39.5, con zonas de color (verde/ámbar/rojo) en el propio gauge.
- Indicador de movimiento: texto simple, ej. "Actividad normal" con ícono.
- Indicador de batería del collar: ej. "82%" con ícono de batería.
- Chip de estado general tipo semáforo: Normal / Atención / Alerta (usar "Normal" por defecto, en verde).

### 4.3 Historial de alertas
- Lista (`ListView`) de 4 alertas mock, cada una como card con: ícono según tipo (termómetro / movimiento), texto corto (ej. "Posible fiebre detectada — Vaca #04"), timestamp relativo (ej. "hace 2 h") y color de borde/ícono según severidad.
- Datos sugeridos:
  1. "Temperatura elevada — Vaca #04 — hace 2 h" (ámbar)
  2. "Actividad inusual — Vaca #11 — hace 5 h" (ámbar)
  3. "Fiebre confirmada — Vaca #02 — ayer" (rojo)
  4. "Monitoreo normal restablecido — Vaca #02 — ayer" (verde)

### 4.4 Guía de bioseguridad
- Lista de 4–5 recomendaciones con ícono grande + texto corto, estilo tarjeta o lista con íconos a la izquierda:
  - "Aísle al animal sospechoso del resto del hato"
  - "Lávese las manos antes y después de manipular al animal"
  - "Use mascarilla y guantes si hay signos de enfermedad"
  - "Notifique al veterinario responsable"
  - "Desinfecte el área de contacto"

### 4.5 Ficha del animal
- Datos mock: especie (Bovino), edad (3 años), última revisión veterinaria (fecha), rango de temperatura normal (37.5–39.5 °C), temperatura actual (38.5 °C).
- Opcional: mini gráfico de línea (Syncfusion) con 5–7 puntos simulando el histórico de temperatura de la última semana.

### 4.6 Acerca del proyecto
- Objetivo general del proyecto (1 párrafo corto).
- Integrantes del equipo + tutor/director (nombres como placeholders a rellenar por el cliente — dejar claramente marcado `// TODO: nombres reales` en el código para que se puedan completar antes de compilar el .apk final).
- Línea de tiempo simple (4 fases) como lista numerada o `Stepper` horizontal/vertical.

## 5. Estructura de carpetas sugerida

```
lib/
  main.dart
  theme/
    app_theme.dart
  data/
    mock_data.dart
  screens/
    splash_screen.dart
    dashboard_screen.dart
    alerts_screen.dart
    biosecurity_screen.dart
    animal_profile_screen.dart
    about_screen.dart
  widgets/
    status_chip.dart
    alert_card.dart
    app_card.dart
  navigation/
    root_nav.dart
```

## 6. Criterios de aceptación / entregable

- Las 6 pantallas navegan entre sí sin errores ni pantallas en blanco.
- Compila a `.apk` en modo release (`flutter build apk --release`) sin warnings bloqueantes.
- Ningún texto de contenido queda en inglés ni con `lorem ipsum` — todo el copy debe estar en español y con el contenido mock de la sección 4.
- No hay llamadas de red, permisos de Bluetooth/ubicación ni dependencias de backend en el `AndroidManifest.xml`.
- El tema (colores/tipografía) es consistente en las 6 pantallas.

## 7. Fuera de alcance (no hacer, aunque parezca fácil)

- Cualquier conexión real a hardware, sensores o APIs externas.
- Autenticación de usuario o roles.
- Persistencia de datos (SharedPreferences, SQLite, etc.) — no es necesaria, todo es estático.
- Pantallas adicionales a las 6 listadas, salvo que el alcance se reconfirme por separado.
