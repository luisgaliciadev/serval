USE SERVAL_CYBER2

DELETE FROM [dbo].[BITACORA]
DBCC CHECKIDENT (BITACORA, RESEED,0)
------------------------------------------
DELETE FROM [dbo].[PAGOS_FACT_COMPRA]
DBCC CHECKIDENT (PAGOS_FACT_COMPRA,0)
----------------------------------------------------
DELETE FROM [dbo].[PAGOS_FACT_VENTA]
DBCC CHECKIDENT (PAGOS_FACT_VENTA,0)
----------------------------------------------------
DELETE FROM [dbo].[DETA_FACT_VENTA]
DBCC CHECKIDENT (DETA_FACT_VENTA, RESEED,0)
--------------------------------------------------
DELETE FROM [dbo].[FACT_VENTA]
DBCC CHECKIDENT (FACT_VENTA, RESEED,0)
---------------------------------------------------
DELETE FROM [dbo].[DETA_FACT_COMPRA]
DBCC CHECKIDENT (DETA_FACT_COMPRA, RESEED,0)
-----------------------------------------------------
DELETE FROM [dbo].[FACT_COMPRA]
DBCC CHECKIDENT (FACT_COMPRA, RESEED,0)
---------------------------------------------------
DELETE FROM [dbo].[DETA_PRESUPUESTO]
DBCC CHECKIDENT (DETA_PRESUPUESTO, RESEED,0)
------------------------------------------------------
DELETE FROM [dbo].[PRESUPUESTO]
DBCC CHECKIDENT (PRESUPUESTO, RESEED,0)
-----------------------------------------
DELETE FROM [dbo].[MOVIMIENTO_INTERNO]
DBCC CHECKIDENT (MOVIMIENTO_INTERNO, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[MOVIMIENTO_PRODUCTO]
DBCC CHECKIDENT (MOVIMIENTO_PRODUCTO, RESEED,0)
DELETE FROM [dbo].[INVENTARIO]
-----------------------------------------
DELETE FROM [dbo].[CLASIFICACION_PRODUCTO]
DBCC CHECKIDENT (CLASIFICACION_PRODUCTO, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[PRODUCTO]
DBCC CHECKIDENT (PRODUCTO, RESEED,0)
-----------------------------------------
DELETE FROM [dbo].[CAJA_ADMIN]
DBCC CHECKIDENT (CAJA_ADMIN, RESEED,0)
-----------------------------------------
DELETE FROM [dbo].[CAMBIO_MONEDA]
DBCC CHECKIDENT (CAMBIO_MONEDA, RESEED,0)
-----------------------------------------
DELETE FROM [dbo].[CAMBIO_MONEDA]
DBCC CHECKIDENT (CAMBIO_MONEDA, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[COMUNICACION_BAJA_SUNAT]
DBCC CHECKIDENT (COMUNICACION_BAJA_SUNAT, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[RESUMEN_DIARIO]
DBCC CHECKIDENT (RESUMEN_DIARIO, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[TALONARIOS_ADMIN_VENTA]
DBCC CHECKIDENT (TALONARIOS_ADMIN_VENTA, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[TALONARIOS_ADMIN_VENTA]
DBCC CHECKIDENT (TALONARIOS_ADMIN_VENTA, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[NUMEROS_CONTROL_ADMIN_VENTA]
DBCC CHECKIDENT (NUMEROS_CONTROL_ADMIN_VENTA, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[DETA_PEDIDO]
DBCC CHECKIDENT (DETA_PEDIDO, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[PEDIDOS]
DBCC CHECKIDENT (PEDIDOS, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[DETA_ORDEN_PAGO]
DBCC CHECKIDENT (DETA_PEDIDO, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[ORDEN_PAGO]
DBCC CHECKIDENT (DETA_PEDIDO, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[DETA_PLANIFICACION_PAGOS]
DBCC CHECKIDENT (DETA_PLANIFICACION_PAGOS, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[MODELO_VEHICULO]
DBCC CHECKIDENT (MODELO_VEHICULO, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[MARCA_VEHICULO]
DBCC CHECKIDENT (MARCA_VEHICULO, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[OP_GUIA_DESPACHO]
DBCC CHECKIDENT (OP_GUIA_DESPACHO, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[OP_ORDEN_SERVICIO]
DBCC CHECKIDENT (OP_ORDEN_SERVICIO, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[OP_PRODUCTO]
DBCC CHECKIDENT (OP_PRODUCTO, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[OP_TB_CURSOS]
DBCC CHECKIDENT (OP_TB_CURSOS, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[OP_TB_NAVE]
DBCC CHECKIDENT (OP_TB_NAVE, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[OP_TB_ORIGEN_DESTINO]
DBCC CHECKIDENT (OP_TB_ORIGEN_DESTINO, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[OP_TB_PERMISOS]
DBCC CHECKIDENT (OP_TB_PERMISOS, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[OP_TB_RUTA]
DBCC CHECKIDENT (OP_TB_RUTA, RESEED,0)
----------------------------------------------------
DELETE FROM [dbo].[OP_TB_TIPO_ACOPLE]
DBCC CHECKIDENT (OP_TB_TIPO_ACOPLE,0)
----------------------------------------------------
DELETE FROM [dbo].[OP_TB_TIPO_ACOPLE]
DBCC CHECKIDENT (OP_TB_TIPO_ACOPLE,0)
----------------------------------------------------
DELETE FROM [dbo].[OP_TB_TIPO_ALQUILER]
DBCC CHECKIDENT (OP_TB_TIPO_ALQUILER,0)
----------------------------------------------------
DELETE FROM [dbo].[OP_TB_TIPO_CARGA]
DBCC CHECKIDENT (OP_TB_TIPO_CARGA,0)
----------------------------------------------------
DELETE FROM [dbo].[OP_TB_TIPO_CARROCERIA]
DBCC CHECKIDENT (OP_TB_TIPO_CARROCERIA,0)
----------------------------------------------------
DELETE FROM [dbo].[OP_TB_TIPO_VEHICULO]
DBCC CHECKIDENT (OP_TB_TIPO_VEHICULO,0)
----------------------------------------------------
DELETE FROM [dbo].[OP_VEHICULO]
DBCC CHECKIDENT (OP_VEHICULO,0)
----------------------------------------------------
DELETE FROM [dbo].[OP_CONDUCTOR]
DBCC CHECKIDENT (OP_CONDUCTOR,0)
----------------------------------------------------
DELETE FROM [dbo].[PROCESOS_CAJA]
DBCC CHECKIDENT (PROCESOS_CAJA,0)
----------------------------------------------------
DELETE FROM [dbo].[PROCESOS_MARCAJE]
DBCC CHECKIDENT (PROCESOS_MARCAJE,0)
----------------------------------------------------
DELETE FROM [dbo].[SOLICITUD_PRODUCTO]
DBCC CHECKIDENT (SOLICITUD_PRODUCTO,0)
----------------------------------------------------
DELETE FROM [dbo].[SUB_CENTRO_COSTOS]
DBCC CHECKIDENT (SUB_CENTRO_COSTOS,0)
----------------------------------------------------
DELETE FROM [dbo].[VEHICULOS]
DBCC CHECKIDENT (VEHICULOS,0)
----------------------------------------------------
DELETE FROM [dbo].[CONDUCTORES]
DBCC CHECKIDENT (CONDUCTORES,0)
----------------------------------------------------
DELETE FROM [dbo].[CUENTAS]
DBCC CHECKIDENT (CUENTAS,0)
----------------------------------------------------
DELETE FROM [dbo].[CUENTAS_PROVEEDOR]
DBCC CHECKIDENT (CUENTAS_PROVEEDOR,0)





























