# Tienda en línea (MySQL)

Proyecto de base de datos de una tienda en línea, desarrollado como parte de la carrera de Computación en el Centro Universitario de Tonalá (CUTonalá).

**Autora:** Vania Alexa Chávez Gutiérrez
**Rol profesional elegido:** Data Science & Analytics (con tareas de DevOps: repositorio en GitHub)

## Descripción

Base de datos en MySQL que simula una tienda en línea. Incluye datos de prueba y consultas para generar métricas del negocio.

## Estructura de la base de datos

| Tabla | Descripción |
|---|---|
| `clientes` | Datos de los clientes (nombre, correo, ciudad) |
| `productos` | Catálogo de productos (categoría, precio, stock) |
| `pedidos` | Pedidos realizados por cada cliente, con su fecha |
| `detalle_pedido` | Productos y cantidades de cada pedido |

Las tablas se relacionan mediante llaves foráneas (`id_cliente`, `id_pedido`, `id_producto`).

## Archivos

- `tienda.sql`: crea la base de datos, las tablas y los datos de prueba.
- `consultas.sql`: consultas de métricas y un stored procedure.

## Métricas generadas

1. Productos más vendidos
2. Ventas totales por mes
3. Clientes que más gastan
4. Ventas por categoría
5. Stored procedure `sp_ventas_por_mes(año)` para reportes rápidos por año

## Cómo ejecutarlo

1. Abrir MySQL Workbench y conectarse al servidor local.
2. Ejecutar `tienda.sql` completo para crear la base de datos `tienda`.
3. Abrir `consultas.sql` y ejecutar las consultas una por una.
4. Probar el procedimiento con: `CALL sp_ventas_por_mes(2026);`

## Tecnologías

- MySQL 8
- MySQL Workbench
- Git y GitHub
