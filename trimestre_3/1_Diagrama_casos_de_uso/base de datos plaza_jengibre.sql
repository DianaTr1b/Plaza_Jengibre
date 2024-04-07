use plaza_jengibre;
CREATE TABLE `administrador` (
  `idAdministrador` int(11) NOT NULL,
  `nombreAdministrador` varchar(45) NOT NULL,
  `apellidoAdministrador` varchar(45) NOT NULL,
  `emailAdministrador` varchar(45) NOT NULL,
  `telefonoAdministrador` varchar(45) NOT NULL,
  `fechaRegistroAdministrador` datetime NOT NULL
);
CREATE TABLE `categoria` (
  `idTipoCategoria` int(11) NOT NULL,
  `nombreCategoria` varchar(45) NOT NULL
); 
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombreCliente` varchar(45) NOT NULL,
  `apellidoCliente` varchar(45) NOT NULL,
  `direccionCliente` varchar(45) NOT NULL,
  `telefonoCliente` varchar(45) NOT NULL,
  `emailCliente` varchar(45) NOT NULL,
  `fechaNacimientoCliente` date NOT NULL,
  `fechaRegistroCliente` date NOT NULL,
  `contraseñaCliente` varchar(45) DEFAULT NULL
);
CREATE TABLE `compra` (
  `producto_codigoProducto` int(15) NOT NULL,
  `proveedor_idProveedor` int(11) NOT NULL,
  `CantidadCompra` int(15) NOT NULL,
  `numeroFacturaCompra` int(15) NOT NULL
) ;

CREATE TABLE `estados` (
  `idEstado` int(15) NOT NULL,
  `nombreEstado` varchar(45) NOT NULL
);

CREATE TABLE `pedidocliente` (
  `idPedidoCliente` int(15) NOT NULL,
  `fechaPedidoCliente` date NOT NULL,
  `horaPedidoCliente` time NOT NULL,
  `cliente_idCliente` int(11) NOT NULL,
  `estados_idEstado` int(15) NOT NULL
) ;

CREATE TABLE `pedidoprodcuto` (
  `pedidoCliente_idPedidoCliente` int(15) NOT NULL,
  `producto_codigoProducto` int(15) NOT NULL,
  `valorUnitarioProducto` float NOT NULL,
  `cantidadPedidoCliente` int(15) NOT NULL,
  `ivaPedidoProducto` float NOT NULL,
  `totalPagarPedidoCliente` float DEFAULT NULL
);


CREATE TABLE `producto` (
  `codigoProducto` int(15) NOT NULL,
  `nombreProducto` varchar(45) NOT NULL,
  `stockProducto` int(15) NOT NULL,
  `entradasProducto` int(15) NOT NULL,
  `salidasProducto` int(15) NOT NULL,
  `tipoProducto_idTipoProducto` int(11) NOT NULL,
  `categoria_idTipoCategoria` int(11) NOT NULL,
  `administrador_idAdministrador` int(11) NOT NULL
);

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL,
  `nombreProveedor` varchar(45) NOT NULL,
  `direccionProveedor` varchar(45) NOT NULL,
  `telefonoProveedor` varchar(20) NOT NULL,
  `emailProveedor` varchar(45) NOT NULL
) ;

CREATE TABLE `tipoproducto` (
  `idTipoProducto` int(11) NOT NULL,
  `nombreTipoProducto` varchar(45) NOT NULL
);

CREATE TABLE `ventas` (
  `numeroVenta` int(15) NOT NULL,
  `fechaVenta` date NOT NULL,
  `horaVenta time` time NOT NULL,
  `valorVenta` float NOT NULL,
  `pedidoCliente_idPedidoCliente` int(15) NOT NULL,
  `administrador_idAdministrador` int(11) NOT NULL
);

ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idAdministrador`);

ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idTipoCategoria`);
  
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);
  
  ALTER TABLE `compra`
  ADD KEY `fk_compra_producto1_idx` (`producto_codigoProducto`),
  ADD KEY `fk_compra_proveedor1_idx` (`proveedor_idProveedor`);
  
  ALTER TABLE `estados`
  ADD PRIMARY KEY (`idEstado`);
  
  ALTER TABLE `pedidocliente`
  ADD PRIMARY KEY (`idPedidoCliente`),
  ADD KEY `fk_pedidoCliente_cliente1_idx` (`cliente_idCliente`),
  ADD KEY `fk_pedidoCliente_estados1_idx` (`estados_idEstado`);
  
  ALTER TABLE `pedidoprodcuto`
  ADD KEY `fk_pedidoProdcuto_pedidoCliente1_idx` (`pedidoCliente_idPedidoCliente`),
  ADD KEY `fk_pedidoProdcuto_producto1_idx` (`producto_codigoProducto`);
  
  ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigoProducto`),
  ADD KEY `fk_producto_tipoProducto1_idx` (`tipoProducto_idTipoProducto`),
  ADD KEY `fk_producto_categoria1_idx` (`categoria_idTipoCategoria`),
  ADD KEY `fk_producto_administrador1_idx` (`administrador_idAdministrador`);
  
  ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`);
  
  ALTER TABLE `tipoproducto`
  ADD PRIMARY KEY (`idTipoProducto`);
  
  ALTER TABLE `ventas`
  ADD PRIMARY KEY (`numeroVenta`),
  ADD KEY `fk_ventas_pedidoCliente1_idx` (`pedidoCliente_idPedidoCliente`),
  ADD KEY `fk_ventas_administrador1_idx` (`administrador_idAdministrador`);
  
 

ALTER TABLE `pedidoprodcuto`
  ADD CONSTRAINT `fk_pedidoProdcuto_pedidoCliente1` FOREIGN KEY (`pedidoCliente_idPedidoCliente`) REFERENCES `pedidocliente` (`idPedidoCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidoProdcuto_producto1` FOREIGN KEY (`producto_codigoProducto`) REFERENCES `producto` (`codigoProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_administrador1` FOREIGN KEY (`administrador_idAdministrador`) REFERENCES `administrador` (`idAdministrador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_categoria1` FOREIGN KEY (`categoria_idTipoCategoria`) REFERENCES `categoria` (`idTipoCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_tipoProducto1` FOREIGN KEY (`tipoProducto_idTipoProducto`) REFERENCES `tipoproducto` (`idTipoProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_ventas_administrador1` FOREIGN KEY (`administrador_idAdministrador`) REFERENCES `administrador` (`idAdministrador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ventas_pedidoCliente1` FOREIGN KEY (`pedidoCliente_idPedidoCliente`) REFERENCES `pedidocliente` (`idPedidoCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;
  
  show table nombreCliente;