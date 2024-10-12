use repuestomotos;

-- Usuarios --
create table Usuarios
(id_usuario int not null auto_increment primary key,
nombre_usuario varchar(100) not null,
email varchar(100) unique not null,
contraseña varchar(255) not null,
rol enum('admin') default('vendedor'),
fecha_registro date default(current_date)
);

-- Motos --
create table Motos
(id_moto int not null auto_increment primary key,
marca varchar(100) not null,
modelo varchar(100) not null,
año int not null
);

-- Categorias --
create table Categoria
(id_categoria int not null auto_increment primary key,
nombre_categoria varchar(100)
);

-- Repuestos --
create table Repuestos
(id_repuesto int not null auto_increment primary key,
nombre_repuesto varchar(150) not null,
descripcion text,
precio decimal(10, 2) not null,
stock_inicial int default(0) not null,
stock_actual int default(0) not null,
foto varchar(450) null, -- Ruta de la imagen --
id_usuario int not null,
id_moto int not null,
id_categoria int not null,
foreign key(id_usuario) references Usuarios(id_usuario),
foreign key(id_moto) references Motos(id_moto),
foreign key(id_categoria) references Categoria(id_categoria)
);

-- Ventas --
create table Ventas
(id_venta int not null auto_increment primary key,
fecha_venta datetime default(current_timestamp()),
total decimal(10, 2) not null,
id_usuario int not null,
foreign key(id_usuario) references Usuarios(id_usuario)
);

-- Detalles Ventas --
create table DetallesVentas
(id_detalle_venta int not null auto_increment primary key,
id_venta int not null,
id_repuesto int not null,
foreign key(id_venta) references Ventas(id_venta),
foreign key(id_repuesto) references Repuestos(id_repuesto),
cantidad int not null,
precio_unitario decimal(10, 2) not null,
subtotal decimal(10, 2) not null
);

-- Compras --
create table Compras
(id_compra int not null auto_increment primary key,
id_usuario int not null,
foreign key(id_usuario) references Usuarios(id_usuario),
fecha_compra datetime default(current_timestamp()),
total decimal(10, 2) not null
);

-- Detalles Compras --
create table DetalleCompras
(id_detalle_compra int not null auto_increment primary key,
id_compra int not null,
id_repuesto int not null,
foreign key(id_compra) references Compras(id_compra),
foreign key(id_repuesto) references Repuestos(id_repuesto),
cantidad int not null,
precio_unitario decimal(10, 2) not null,
subtotal decimal(10, 2) not null
);

