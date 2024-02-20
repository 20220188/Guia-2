/*Trigger, funcion y procedimiento almacenado*/

DELIMITER //
CREATE TRIGGER activar_cliente_despues_de_primer_pedido
AFTER INSERT ON pedido
FOR EACH ROW
BEGIN
  UPDATE cliente
  SET estado_cliente = 1
  WHERE id_cliente = NEW.id_cliente;
END; //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE InsertarProducto(
    IN _nombre_producto VARCHAR(50),
    IN _descripcion_producto VARCHAR(250),
    IN _precio_producto DECIMAL(5,2),
    IN _existencias_producto INT,
    IN _imagen_producto VARCHAR(25),
    IN _id_categoria INT,
    IN _estado_producto TINYINT(1),
    IN _id_administrador INT
)
BEGIN
    INSERT INTO producto(nombre_producto, descripcion_producto, precio_producto, existencias_producto, imagen_producto, id_categoria, estado_producto, id_administrador, fecha_registro)
    VALUES (_nombre_producto, _descripcion_producto, _precio_producto, _existencias_producto, _imagen_producto, _id_categoria, _estado_producto, _id_administrador, CURRENT_DATE());
END; //
DELIMITER ;


DELIMITER //
CREATE FUNCTION CalcularTotalPedido(_id_pedido INT) RETURNS DECIMAL(10,2)
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(precio_producto * cantidad_producto) INTO total
    FROM detalle_pedido
    WHERE id_pedido = _id_pedido;
    RETURN total;
END; 
DELIMITER //