# Guía del Entorno de Prácticas - OnesaitPlatform

Este proyecto proporciona un entorno local empaquetado para realizar prácticas con **OnesaitPlatform** utilizando contenedores Docker.

Puedes trabajar desde **WSL2** (`./deploy.sh`) o desde **Windows** (`deploy.ps1`), con o sin WSL instalado. Ver la sección de arranque más abajo.

---

## 🛠️ Prerrequisitos de Software

Antes de iniciar, asegúrate de tener instalado en tu máquina:
1.  **Docker Desktop** (recomendado en Windows; en WSL puede usarse Docker Engine directamente).
2.  **Docker Compose** (versión v2 o superior).
3.  **Git**.
4.  **Windows sin WSL:** además necesitas **Git for Windows** (para certificados SSL en el modo nativo).

> [!IMPORTANT]
> **Asignación de Memoria RAM:**
> OnesaitPlatform es un sistema robusto basado en microservicios Java/Spring Boot.
> - Si levantas el perfil **Completo**, necesitarás al menos **12 GB de RAM** libres para Docker/WSL.
> - Si usas los perfiles de **Grupo (Integración, Reportes o Analítica)**, el consumo se reduce drásticamente, permitiendo trabajar en ordenadores con **8 GB de RAM** en total.

---

## 🚀 Cómo Iniciar el Entorno (Estudiantes)

### Opción A — WSL / Linux / macOS

1.  Abre tu consola y navega a la carpeta del proyecto:
    ```bash
    cd ~/personal-projects/onesait-platform-deploy
    ```
2.  Ejecuta el script de despliegue:
    ```bash
    ./deploy.sh
    ```

### Opción B — Windows (PowerShell)

1.  Abre PowerShell en la carpeta del proyecto.
2.  Ejecuta:
    ```powershell
    .\deploy.ps1
    ```
3.  Si tienes WSL y Docker Desktop, el instalador te preguntará el modo (**nativo** o **WSL**). Sin WSL, usará el modo nativo con `localhost`.

En ambos casos el script te pedirá:
*   **SERVER_NAME:** En WSL suele ser la IP que muestra el script; en Windows nativo usa `localhost`.
*   **Perfil de Trabajo:** Selecciona el número de tu grupo (ver tabla más abajo).

Para reiniciar tras un paro o un reboot: `./start.sh` o `.\start.ps1`.  
Para detener: `./stop.sh` o `.\stop.ps1`.

El script se encargará automáticamente de generar los certificados SSL locales, configurar la persistencia, inicializar las bases de datos si es la primera vez y levantar los contenedores.

### 🛑 Cómo Detener el Entorno

```bash
./stop.sh          # WSL / Linux
```
```powershell
.\stop.ps1         # Windows
```

---

## 🏗️ Qué vais a hacer: tres grupos, una plataforma

Onesait no es solo “varias bases de datos sueltas”. Tiene una **capa semántica basada en ontologías**: defines *qué es* un sensor, una medida o un activo, y todos los módulos hablan ese mismo idioma.

### Dónde se guarda todo

| Qué | Dónde | Para qué sirve |
| :--- | :--- | :--- |
| Definición de ontologías, dashboards, pipelines, usuarios | **MariaDB** (`configdb`) | Metadatos y configuración |
| Datos de las ontologías (instancias, series temporales) | **MongoDB** (`realtimedb`) | El “contenido” que consumen KPIs y notebooks |
| Notebooks y experimentos MLflow | MariaDB + volumen local | Analítica y modelos |

Los datos persisten en `op_data/data/` entre reinicios. **No hace falta S3 ni PostgreSQL** para la práctica: el “dato limpio” vive en la **ontología** dentro de MongoDB.

### Flujo entre grupos (medallion conceptual)

No hay carpetas bronze/silver/gold en la nube. En la práctica el medallion se simula así:

```
Integración (bronze → silver → gold)
    Ingesta cruda (API, IoT, JDBC…)
    → Limpieza y transformación en Dataflow
    → Escritura en una ontología (datos listos = “gold”)
              ↓
    MongoDB (misma plataforma)
              ↓
    ┌─────────┴─────────┐
    ↓                   ↓
Reporting            Analítica
KPIs / Dashboards    Notebooks / MLflow
(lee ontología)        (lee ontología y entrena modelos)
```

| Grupo | Perfil en `deploy` | Produce | Consume |
| :--- | :---: | :--- | :--- |
| **Integración** (Anyi, Fernando) | `2` | Ontologías, pipelines Dataflow, APIs, flujos | Fuentes externas |
| **Reporting** (Wesfalia, Kevin, Pamela) | `3` | Dashboards y KPIs | Ontologías con datos (gold) |
| **Analítica** (Isaías) | `4` | Modelos, notebooks, experimentos MLflow | Ontologías con datos (gold) |
| **Profesor** | `1` Completo | Diseño inicial, `db_seed/` | Todo |

**Importante:** Reporting y Analítica **no necesitan** levantar Dataflow. Solo necesitan que la ontología **ya tenga datos**. Eso lo hace Integración (o el profesor vía `db_seed/`).

### ¿Habrá problemas al consumir los datos?

No, si se cumple esto:

1.  Los datos están en **la misma plataforma** (mismo MongoDB).
2.  La ontología existe y tiene **instancias cargadas**.
3.  Cada alumno desplegó con el **`db_seed/`** que compartió el profesor (si trabajáis en portátiles distintos).

Si cada alumno trabaja en su máquina **sin** `db_seed/` compartido, Reporting y Analítica **no verán** el trabajo de Integración. La solución es que el profesor consolide el estado (ver sección del profesor) y lo suba a Git.

---

## 👥 Cuentas de Acceso y Perfiles

Al finalizar el arranque, abre el navegador:

*   **WSL:** `https://<IP-WSL>/controlpanel/` (la IP la muestra `start.sh`).
*   **Windows nativo:** `https://localhost/controlpanel/`.

Acepta la advertencia del certificado autofirmado.

### Estudiantes y Grupos de Trabajo

| Usuario | Contraseña | Rol / Grupo | Perfil deploy | Qué harás en la práctica |
| :--- | :--- | :--- | :---: | :--- |
| `anyi` | `onesaitplatform` | Integración | 2 | Ontologías, Dataflow (ETL), Flow Engine |
| `fernando` | `onesaitplatform` | Integración | 2 | Ontologías, Dataflow (ETL), Flow Engine |
| `wesfalia` | `onesaitplatform` | Reporting | 3 | Dashboards y KPIs sobre ontologías |
| `kevin` | `onesaitplatform` | Reporting | 3 | Dashboards y KPIs sobre ontologías |
| `pamela` | `onesaitplatform` | Reporting | 3 | Dashboards y KPIs sobre ontologías |
| `isaias` | `onesaitplatform` | Analítica | 4 | Notebooks (Zeppelin) y MLflow |

### Profesor / Administrador
*   **Usuario:** `administrator` o `developer`
*   **Contraseña:** `onesaitplatform`
*   **Perfil deploy:** `1` (Completo)

---

## 📋 Guía rápida por grupo

### Integración — montar el dato limpio (gold)

1.  Despliega con perfil **2**.
2.  Entra en Control Panel con `anyi` o `fernando`.
3.  Crea o edita una **ontología** (modelo de datos).
4.  Usa **Dataflow** para ingerir, limpiar y escribir instancias en esa ontología.
5.  Opcional: publica **APIs** o flujos en Flow Engine.
6.  Comprueba en Control Panel que la ontología tiene **datos**.

### Reporting — KPIs y dashboards

1.  Despliega con perfil **3** (o usa un entorno con `db_seed/` del profesor).
2.  Entra con `wesfalia`, `kevin` o `pamela`.
3.  Abre **Dashboard Engine** desde Control Panel.
4.  Crea un dashboard y añade widgets/KPIs eligiendo la **ontología** y las propiedades que Integración dejó cargadas.
5.  No necesitas Dataflow: solo **lees** datos ya persistidos en MongoDB.

### Analítica — ML desde notebooks

1.  Despliega con perfil **4** (incluye Notebooks y MLflow).
2.  Entra con `isaias`.
3.  Abre **Notebooks** desde Control Panel (`/controlpanel/notebooks/app/`).
4.  Carga datos de la ontología (mismo gold que usa Reporting).
5.  Entrena tu modelo en el notebook; opcionalmente registra el experimento en **MLflow**.

---

## 💾 Entrega de Prácticas (Estudiantes)

No subas los archivos binarios de la base de datos a Git (están ignorados en `.gitignore`).

**Cómo entregar tu trabajo:**

1.  Inicia sesión en Control Panel con tu usuario.
2.  Ve a **Herramientas de Desarrollo** → **Exportar/Importar Configuración**.
3.  Selecciona lo que desarrollaste (ontologías, dashboards, APIs, flujos, etc.).
4.  Exporta y descarga el `.zip` o `.json`.
5.  Súbelo donde indique el profesor (Moodle, Teams, correo, etc.).

El export es **selectivo y portable**; es la forma correcta de entregar, no un dump de MongoDB.

---

## 🎓 Gestión de la Práctica (Para el Profesor)

### Preparar el punto de partida para todos los grupos

1.  Inicia el entorno con perfil **Completo** (`1`).
2.  Accede como `administrator` y configura ontologías, pipelines de ejemplo, datos iniciales, etc.
3.  Cuando esté listo, **consolida** el estado operativo:
    ```bash
    ./consolidate-stage.sh nombre-del-stage "Descripción breve"
    ```
    ```powershell
    .\consolidate-stage.ps1 -StageName "nombre-del-stage" -Description "Descripción breve"
    ```
    Esto genera `db_seed/` (MariaDB + MongoDB) y un `manifest.json` con metadatos.
4.  Haz commit y push de `db_seed/` al repositorio.
5.  Los alumnos clonan y ejecutan `deploy` / `deploy.ps1`: `restore.sh` importará ese snapshot en el primer despliegue.

Alternativa rápida sin metadatos: `./backup.sh` o `.\backup.ps1` (solo copia de BD, sin manifest).

### Corregir entregas de alumnos

1.  Levanta tu entorno (perfil Completo).
2.  Control Panel → **Exportar/Importar Configuración** → **Importar** el `.zip` del alumno.
3.  Revisa ontologías, dashboards, pipelines o APIs en la plataforma.

### Recomendaciones

*   Usa **`start.sh`** / **`start.ps1`** para reiniciar; evita volver a ejecutar **`deploy`** en máquinas donde los alumnos ya trabajaron (puede reimportar `db_seed/`).
*   Coordinad hitos: primero Integración consolida el gold → profesor actualiza `db_seed/` → Reporting y Analítica despliegan y consumen.

---
