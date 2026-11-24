-- ============================================
-- Proyecto: Tienda en línea (MySQL)
-- Paso 1 y 2: crear base de datos, tablas y datos de prueba
-- ============================================

DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

-- ---------- TABLAS ----------

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre     VARCHAR(100) NOT NULL,
    correo     VARCHAR(100) NOT NULL UNIQUE,
    ciudad     VARCHAR(50)
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre      VARCHAR(100) NOT NULL,
    categoria   VARCHAR(50),
    precio      DECIMAL(10,2) NOT NULL,
    stock       INT NOT NULL DEFAULT 0
);

CREATE TABLE pedidos (
    id_pedido  INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha      DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE detalle_pedido (
    id_detalle  INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido   INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad    INT NOT NULL,
    FOREIGN KEY (id_pedido)   REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- ---------- DATOS DE PRUEBA ----------

INSERT INTO clientes (nombre, correo, ciudad) VALUES
('Ana López',     'ana@mail.com',    'Guadalajara'),
('Luis Pérez',    'luis@mail.com',   'Tonalá'),
('María Ruiz',    'maria@mail.com',  'Zapopan'),
('Carlos Gómez',  'carlos@mail.com', 'Guadalajara'),
('Sofía Torres',  'sofia@mail.com',  'Tlaquepaque');

INSERT INTO productos (nombre, categoria, precio, stock) VALUES
('Audífonos Bluetooth', 'Electrónica', 450.00, 30),
('Mouse inalámbrico',   'Electrónica', 250.00, 50),
('Mochila escolar',     'Accesorios',  380.00, 20),
('Libreta profesional', 'Papelería',    60.00, 100),
('Memoria USB 64GB',    'Electrónica', 180.00, 40),
('Termo de acero',      'Accesorios',  320.00, 25);

INSERT INTO pedidos (id_cliente, fecha) VALUES
(1, '2026-09-05'),
(2, '2026-09-18'),
(1, '2026-10-02'),
(3, '2026-10-15'),
(4, '2026-10-28'),
(5, '2026-11-03'),
(1, '2026-11-10'),
(3, '2026-11-17');

INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad) VALUES
(1, 1, 1), (1, 4, 3),
(2, 2, 2),
(3, 3, 1), (3, 5, 2),
(4, 1, 1), (4, 6, 1),
(5, 4, 5),
(6, 2, 1), (6, 5, 1),
(7, 6, 2), (7, 4, 2),
(8, 1, 2), (8, 3, 1);

-- ---------- COMPROBAR QUE SE CREÓ BIEN ----------

SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM pedidos;
SELECT * FROM detalle_pedido;
