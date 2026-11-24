USE tienda;

-- =====================================================
-- CONSULTA 1: Productos más vendidos
-- (JOIN + SUM + GROUP BY + ORDER BY)
-- =====================================================
SELECT p.nombre AS producto,
       SUM(d.cantidad) AS unidades_vendidas
FROM detalle_pedido d
JOIN productos p ON p.id_producto = d.id_producto
GROUP BY p.id_producto, p.nombre
ORDER BY unidades_vendidas DESC;

-- =====================================================
-- CONSULTA 2: Ventas totales por mes (en pesos)
-- =====================================================
SELECT DATE_FORMAT(pe.fecha, '%Y-%m') AS mes,
       SUM(d.cantidad * p.precio) AS total_ventas
FROM pedidos pe
JOIN detalle_pedido d ON d.id_pedido = pe.id_pedido
JOIN productos p ON p.id_producto = d.id_producto
GROUP BY mes
ORDER BY mes;

-- =====================================================
-- CONSULTA 3: Clientes que más gastan
-- =====================================================
SELECT c.nombre AS cliente,
       COUNT(DISTINCT pe.id_pedido) AS num_pedidos,
       SUM(d.cantidad * p.precio) AS total_gastado
FROM clientes c
JOIN pedidos pe ON pe.id_cliente = c.id_cliente
JOIN detalle_pedido d ON d.id_pedido = pe.id_pedido
JOIN productos p ON p.id_producto = d.id_producto
GROUP BY c.id_cliente, c.nombre
ORDER BY total_gastado DESC;

-- =====================================================
-- CONSULTA 4: Ventas por categoría de producto
-- =====================================================
SELECT p.categoria,
       SUM(d.cantidad) AS unidades,
       SUM(d.cantidad * p.precio) AS total_ventas
FROM detalle_pedido d
JOIN productos p ON p.id_producto = d.id_producto
GROUP BY p.categoria
ORDER BY total_ventas DESC;

-- =====================================================
-- STORED PROCEDURE: ventas por mes de un año dado
-- Uso: CALL sp_ventas_por_mes(2026);
-- =====================================================
DROP PROCEDURE IF EXISTS sp_ventas_por_mes;

DELIMITER //
CREATE PROCEDURE sp_ventas_por_mes(IN p_anio INT)
BEGIN
    SELECT DATE_FORMAT(pe.fecha, '%Y-%m') AS mes,
           SUM(d.cantidad * p.precio) AS total_ventas
    FROM pedidos pe
    JOIN detalle_pedido d ON d.id_pedido = pe.id_pedido
    JOIN productos p ON p.id_producto = d.id_producto
    WHERE YEAR(pe.fecha) = p_anio
    GROUP BY mes
    ORDER BY mes;
END //
DELIMITER ;

-- Probar el procedure:
CALL sp_ventas_por_mes(2026);
