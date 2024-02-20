USE coffeeshop_Jafet;

/*Ejercicios de literal 4.*/

/*Ejercicio 1*/
SELECT nombre_cliente, estado_pedido FROM pedido
INNER JOIN cliente ON cliente.id_cliente = pedido.id_cliente;

/*Ejercicio 2*/
SELECT * FROM pedido
WHERE fecha_registro BETWEEN '2024-02-01' AND '2024-02-29';

/*Ejercicio 3*/
SELECT * FROM cliente
ORDER BY nacimiento_cliente DESC;


/*Ejercicio 4*/
SELECT dp.id_detalle, dp.id_producto, p.nombre_producto, p.descripcion_producto, dp.cantidad_producto, dp.precio_producto
FROM detalle_pedido dp
INNER JOIN producto p ON dp.id_producto = p.id_producto;


/*Ejercicio 5*/
SELECT * FROM producto
WHERE precio_producto = (SELECT MAX(precio_producto) FROM producto);

/*Ejercicio 6*/
SELECT AVG(precio_producto) AS promedio_precios
FROM producto;



