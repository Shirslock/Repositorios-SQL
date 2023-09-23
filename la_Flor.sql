
CREATE DATABASE la_flor;

-- Estructura de tabla para la tabla `productos`
CREATE TABLE productos (
  id_producto INT PRIMARY KEY IDENTITY(1,1),
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT NULL,
  categoria VARCHAR(50) NULL,
  precio DECIMAL(10,2) NULL,
  stock INT NULL,
  stock_minimo INT NULL,
  fecha_creacion DATETIME NOT NULL DEFAULT GETDATE(),
  fecha_modificacion DATETIME NOT NULL DEFAULT GETDATE()
);

-- Volcado de datos para la tabla `productos`
INSERT INTO productos (nombre, descripcion, categoria, precio, stock, stock_minimo, fecha_creacion, fecha_modificacion)
VALUES
('Rosas en Ramo de 12', 'Ramo con 12 rosas importadas color a elección', 'ramos', 25900.00, 8, 2, '2023-09-19 11:06:40', '2023-09-19 11:06:40'),
('Rosas x unidad', 'Rosas por unidad para arreglos, color a elección', 'rosas', 1800.00, 200, 50, '2023-09-19 11:08:50', '2023-09-19 11:08:50'),
('Arreglo con flores de estación', 'Arreglo con flores de estación, tamaño medio, gama de colores a elección', 'arreglos de estación', 24500.00, 8, 2, '2023-09-19 11:11:00', '2023-09-19 11:11:00'),
('Anthurium', 'Anthurium en plantín', 'plantas de interior', 14000.00, 15, 5, '2023-09-19 11:12:53', '2023-09-19 11:12:53'),
('Chamaedorea en maceta de pvc', 'Chamaedorea en maceta de pvc beige', 'plantas de interior', 20150.00, 5, 3, '2023-09-19 11:15:03', '2023-09-19 11:15:03'),
('Orquidea Phalaenopsis en plantín', 'Orquidea Phalaenopsis clase A en plantín', 'Orquideas', 18800.00, 12, 2, '2023-09-19 11:17:01', '2023-09-19 11:17:01'),
('Combo Plantas x 3 en macetas', 'Combo Plantas x 3 de cactus y suculentas en macetas', 'Cactus y Suculentas', 45000.00, 6, 1, '2023-09-19 11:19:12', '2023-09-19 11:19:12');


-- Estructura de tabla para la tabla `ventas`
CREATE TABLE ventas (
  id_venta INT PRIMARY KEY IDENTITY(1,1),
  fecha_venta DATETIME NOT NULL DEFAULT GETDATE(),
  total_venta DECIMAL(10,2) NULL,
  id_producto INT NULL,
  cantidad INT NULL,
  precio_unitario DECIMAL(10,2) NULL
);

-- Índices para tablas volcadas

-- Indices de la tabla `ventas`
CREATE INDEX idx_id_producto ON ventas (id_producto);

-- Filtros para la tabla `ventas`
ALTER TABLE ventas
ADD CONSTRAINT ventas_fk_id_producto FOREIGN KEY (id_producto) REFERENCES productos(id_producto);


-- Crear una tabla de Usuarios
CREATE TABLE Usuarios (
  id_usuario INT PRIMARY KEY IDENTITY(1,1),
  nombre_usuario VARCHAR(50) NOT NULL,
  contraseña VARCHAR(50) NOT NULL
);

-- Insertar el usuario de administrador
INSERT INTO Usuarios (nombre_usuario, contraseña)
VALUES ('admin', 'admin');