# ⚽ Análisis SQL de Jugadores Profesionales de Fútbol (2009–2024)  
**Exploración de datos de mercado y rendimiento con PostgreSQL**

---

## 📌 Introducción  
Este proyecto analiza información de más de **20.000 jugadores profesionales** de fútbol, abarcando el periodo **2009–2024**.  
El objetivo es aplicar **consultas SQL intermedio–avanzadas** para identificar patrones en valorizaciones de mercado, rendimiento y perfiles de jugadores, integrando datos de transferencias, estadísticas y nacionalidades.  

El análisis se desarrolló completamente en **PostgreSQL**, empleando **CTEs**, **funciones de ventana**, **subconsultas**, **agregaciones condicionales** y **JOINs múltiples** para obtener resultados precisos y estructurados.

---

## 🎯 Objetivos del análisis  
1. **[Top 100 jugadores más valiosos por año](sql_queries/01_top_100_valiosos.sql)** según valorización de mercado.  
2. **[Evolución del valor de mercado](sql_queries/02_evolucion_valor.sql)** segmentada por nacionalidad, edad y posición.  
3. **[Detección de jugadores revelación](sql_queries/03_jugadores_revelacion.sql)** con incrementos extraordinarios en su valor.  
4. **[Comparación entre ligas](sql_queries/04_comparacion_ligas.sql)** considerando valor promedio y proporción de jugadores jóvenes (≤ 23 años).  
5. **[Identificación de transferencias rentables](sql_queries/05_transferencias_rentables.sql)** evaluando el costo de traspaso frente al rendimiento en cancha.

---

## 📂 Dataset  
Datos provenientes de **Kaggle – Football Data (2005–2024)**, organizados en 10 tablas principales:  

- `players` – Información personal y trayectoria.  
- `player_valuations` – Histórico de valorizaciones de mercado.  
- `appearances` – Estadísticas de partidos por jugador.  
- `transfers` – Detalles de traspasos y montos pagados.  
- `clubs` – Clubes y ligas asociadas.  
- `competitions` – Ligas y competiciones.  
- `game_events`, `games`, `game_lineups`, `club_games` – Datos complementarios de partidos y alineaciones.

> 💡 **Nota:** El dataset original está disponible en Kaggle.  
> Este repositorio incluye únicamente versiones filtradas para el análisis.

---

## 🔄 Metodología  

### **1. Preparación de datos**  
- Filtrado por periodo de análisis (2009–2024).  
- Limpieza de valores nulos y duplicados.  
- Creación de campos calculados: edad, año, minutos acumulados, variación porcentual de valor, etc.  

### **2. Consultas SQL**  
- **CTEs** para estructurar pasos intermedios.  
- **Funciones de ventana**: `RANK()`, `LAG()`, `LEAD()`.  
- **JOINs múltiples** para cruzar tablas de mercado, rendimiento y competiciones.  
- **Agregaciones condicionales** con `CASE WHEN` para métricas específicas.

### **3. Presentación de resultados**  
- Capturas de tablas y rankings desde **DBeaver**.  
- Resumen de hallazgos clave y patrones identificados.

---

## 🧰 Tecnologías utilizadas  
- **PostgreSQL** – Ejecución de consultas y análisis de datos.  
- **DBeaver** – Conexión a la base y visualización de resultados.  
- **GitHub** – Documentación del proyecto y control de versiones.

---

## 📸 Resultados (Ejemplos)  
![Top 100 Valiosos](images/top_100_valiosos.png)  
![Evolución Valor](images/evolucion_valor.png)  

---

## 📄 Licencia  
Este proyecto se distribuye bajo licencia MIT.  
Eres libre de usar, modificar y compartir el contenido, citando la fuente.

---
