# 🛍️ Análisis del Comportamiento de Compra del Cliente

> Proyecto de analítica de datos de punta a punta: desde un dataset crudo hasta un dashboard interactivo, un reporte y una presentación ejecutiva.

![Python](https://img.shields.io/badge/Python-pandas-3776AB?logo=python&logoColor=white)
![SQL Server](https://img.shields.io/badge/SQL-SQL%20Server-CC2927?logo=microsoftsqlserver&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?logo=powerbi&logoColor=black)
![Gamma](https://img.shields.io/badge/Gamma-Presentaci%C3%B3n-7C3AED)

---

## 📌 Descripción General (Overview)

Este proyecto analiza **3,900 transacciones** de clientes de un negocio minorista (ropa, accesorios, calzado y ropa de abrigo) para entender patrones de gasto, segmentos de clientes, preferencias de productos y comportamiento de suscripción, y así apoyar decisiones estratégicas de negocio.

**Flujo de trabajo:** carga y limpieza (Python) → EDA → consultas SQL → dashboard en Power BI → reporte → presentación en Gamma.

---

## 📂 Conjunto de Datos (Dataset)

- **Filas:** 3,900
- **Columnas:** 18
- **Valores faltantes:** 37 en `Review Rating`

| Grupo | Variables |
|---|---|
| Demografía del cliente | Edad, Género, Ubicación, Estado de suscripción |
| Detalles de la compra | Artículo, Categoría, Monto de compra (USD), Temporada, Talla, Color |
| Comportamiento | Descuento aplicado, Código promocional, Compras anteriores, Frecuencia de compras, Calificación de reseñas, Tipo de envío |

---

## 🧰 Herramientas (Tools)

| Etapa | Herramienta |
|---|---|
| Carga, limpieza y EDA | **Python** (pandas, SQLAlchemy, pyodbc) en Jupyter Notebook |
| Consultas y análisis | **SQL Server** (T-SQL) |
| Visualización | **Power BI** |
| Reporte | **Microsoft Word** |
| Presentación | **Gamma** |

---

## 🔄 Pasos (Steps)

1. **Carga de datos:** importación del CSV con pandas y revisión con `df.info()` y `df.describe()`.
2. **Limpieza de datos:**
   - Imputación de los 37 valores faltantes de `Review Rating` con la **mediana por categoría de producto**.
   - Estandarización de columnas a `snake_case`.
   - Eliminación de `promo_code_used` por ser idéntica a `discount_applied`.
3. **Feature engineering:**
   - `age_group`: 4 grupos de igual tamaño (Young Adult, Adult, Middle-aged, Senior).
   - `purchase_frecuency_days`: frecuencia de compra convertida a días.
4. **Carga a base de datos:** el DataFrame limpio se exporta a la tabla `customer` con SQLAlchemy.
5. **Consultas SQL:** 10 preguntas de negocio (ver Resultados).
6. **Dashboard en Power BI** con KPIs, gráficos y filtros interactivos.
7. **Reporte** con hallazgos y recomendaciones.
8. **Presentación ejecutiva** creada en Gamma.

---

## 📊 Panel (Dashboard)

**KPIs:** 3.9K clientes · $59.76 de compra promedio · 3.75 de calificación promedio

**Visuales:**
- % de clientes por suscripción: **73% No / 27% Sí**
- Ingresos y ventas por categoría: Clothing lidera, seguido de Accessories, Footwear y Outerwear
- Ingresos y ventas por grupo de edad

**Filtros:** suscripción, género, categoría y tipo de envío.

<p align="center">
  <img width="975" height="537" alt="Dashboard de Power BI" src="https://github.com/user-attachments/assets/3c2eba1a-6bbc-454c-97d6-7ace0f98a702" />
</p>

---

## 📈 Resultados (Results)

| Pregunta de negocio | Hallazgo |
|---|---|
| **Ingresos por género** | Hombres: **$157,890** vs. Mujeres: **$75,191** (≈68% de los ingresos) |
| **Descuento + alto gasto** | **839** clientes usaron descuento y aun así gastaron por encima del promedio |
| **Mejor calificados** | Gloves (3.86), Sandals (3.84), Boots (3.82), Hat (3.80), Skirt (3.78) |
| **Tipo de envío** | Exprés **$60.48** vs. Estándar **$58.46** de compra promedio |
| **Suscriptores** | 1,053 suscriptores ($59.49 promedio) vs. 2,847 no suscriptores ($59.87) |
| **Mayor tasa de descuento** | Hat (50.00%), Sneakers (49.66%), Coat (49.07%), Sweater (48.17%), Pants (47.37%) |
| **Segmentos de clientes** | Leales: **3,116** · Recurrentes: **701** · Nuevos: **83** |
| **Top por categoría** | Jewelry (Accessories), Blouse (Clothing), Sandals (Footwear), Jacket (Outerwear) |
| **Compradores frecuentes (+5 compras)** | 2,518 no suscritos vs. 958 suscritos |
| **Ingresos por edad** | Young Adult $62,143 · Middle-aged $59,197 · Adult $55,978 · Senior $55,763 |

### 💡 Recomendaciones de negocio

- **Impulsar suscripciones:** ofrecer beneficios exclusivos, ya que solo el 27% de los clientes está suscrito.
- **Programas de fidelización:** llevar a los clientes recurrentes al segmento Leal.
- **Revisar la política de descuentos:** equilibrar el impulso en ventas con el control de márgenes.
- **Posicionamiento de productos:** destacar los mejor calificados y más vendidos en las campañas.
- **Marketing dirigido:** enfocarse en Adultos Jóvenes y usuarios de envío exprés.

---

## ▶️ Cómo Ejecutarlo (How to Run)

1. **Clona el repositorio**
   ```bash
   git clone https://github.com/tu-usuario/Analisis_comportamiento_cliente.git
   cd Analisis_comportamiento_cliente
   ```

2. **Instala las dependencias**
   ```bash
   pip install pandas sqlalchemy pyodbc jupyter
   ```

3. **Ejecuta el notebook:** coloca `customer_shopping_behavior.csv` en la raíz del proyecto y abre
   ```bash
   jupyter notebook customer_shopping_Behavior_Analysis.ipynb
   ```
   Ajusta `server` y `database` en la última celda con tu conexión a SQL Server.

4. **Ejecuta las consultas SQL:** abre `customer_behavior_sql_queries.sql` en SQL Server Management Studio y córrelas sobre la tabla `customer`.

5. **Abre el dashboard:** abre `customer_behavior_dashboard.pbix` con **Power BI Desktop**.

---

## 🗂️ Estructura del Proyecto

```
├── customer_shopping_Behavior_Analysis.ipynb   # Carga, limpieza y EDA
├── customer_behavior_sql_queries.sql           # 10 consultas de negocio
├── customer_behavior_dashboard.pbix            # Dashboard en Power BI
├── Analisis_Comportamiento_Compra_Cliente.docx # Reporte final
└── README.md
```

---

## 👤 Autor

**Fredy Jahir Ponce Llactahuaman**
Estudiante de Economía | Data & Analytics
🔗 [LinkedIn](https://www.linkedin.com/in/fredy-jahir-ponce-llactahuaman-34733b274/) · 💻 [GitHub](https://github.com/FePonce10)
