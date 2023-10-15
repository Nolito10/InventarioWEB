
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/15/2023 16:42:11
-- Generated from EDMX file: C:\Users\NOLITO_1O\source\repos\Inventario\Inventario\Models\inventario_model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [InventarioWebBD];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Usuarios'
CREATE TABLE [dbo].[Usuarios] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Correo] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Roles] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Productos'
CREATE TABLE [dbo].[Productos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [Precio] decimal(18,0)  NOT NULL,
    [Stock] nvarchar(max)  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [PedidoId] int  NOT NULL
);
GO

-- Creating table 'Proveedores'
CREATE TABLE [dbo].[Proveedores] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Correo] nvarchar(max)  NOT NULL,
    [Telefono] nvarchar(max)  NOT NULL,
    [Property1] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Pedidos'
CREATE TABLE [dbo].[Pedidos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fecha_Pedido] datetime  NOT NULL,
    [Estado] nvarchar(max)  NOT NULL,
    [Fecha_Entrega] datetime  NOT NULL,
    [UsuarioId] int  NOT NULL,
    [ProveedorId] int  NOT NULL
);
GO

-- Creating table 'PedidoProductos'
CREATE TABLE [dbo].[PedidoProductos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [ProductoId] int  NOT NULL,
    [PedidoId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [PK_Usuarios]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [PK_Productos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Proveedores'
ALTER TABLE [dbo].[Proveedores]
ADD CONSTRAINT [PK_Proveedores]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Pedidos'
ALTER TABLE [dbo].[Pedidos]
ADD CONSTRAINT [PK_Pedidos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PedidoProductos'
ALTER TABLE [dbo].[PedidoProductos]
ADD CONSTRAINT [PK_PedidoProductos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UsuarioId] in table 'Pedidos'
ALTER TABLE [dbo].[Pedidos]
ADD CONSTRAINT [FK_UsuarioPedido]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[Usuarios]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioPedido'
CREATE INDEX [IX_FK_UsuarioPedido]
ON [dbo].[Pedidos]
    ([UsuarioId]);
GO

-- Creating foreign key on [ProveedorId] in table 'Pedidos'
ALTER TABLE [dbo].[Pedidos]
ADD CONSTRAINT [FK_ProveedorPedido]
    FOREIGN KEY ([ProveedorId])
    REFERENCES [dbo].[Proveedores]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProveedorPedido'
CREATE INDEX [IX_FK_ProveedorPedido]
ON [dbo].[Pedidos]
    ([ProveedorId]);
GO

-- Creating foreign key on [PedidoId] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [FK_PedidoProducto1]
    FOREIGN KEY ([PedidoId])
    REFERENCES [dbo].[Pedidos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PedidoProducto1'
CREATE INDEX [IX_FK_PedidoProducto1]
ON [dbo].[Productos]
    ([PedidoId]);
GO

-- Creating foreign key on [ProductoId] in table 'PedidoProductos'
ALTER TABLE [dbo].[PedidoProductos]
ADD CONSTRAINT [FK_ProductoPedidoProducto]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[Productos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoPedidoProducto'
CREATE INDEX [IX_FK_ProductoPedidoProducto]
ON [dbo].[PedidoProductos]
    ([ProductoId]);
GO

-- Creating foreign key on [PedidoId] in table 'PedidoProductos'
ALTER TABLE [dbo].[PedidoProductos]
ADD CONSTRAINT [FK_PedidoPedidoProducto]
    FOREIGN KEY ([PedidoId])
    REFERENCES [dbo].[Pedidos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PedidoPedidoProducto'
CREATE INDEX [IX_FK_PedidoPedidoProducto]
ON [dbo].[PedidoProductos]
    ([PedidoId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------