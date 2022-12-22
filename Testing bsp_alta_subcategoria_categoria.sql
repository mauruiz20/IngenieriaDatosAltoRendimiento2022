-- Testing bsp_alta_subcategoria_categoria
select * from Subcategorias;

call bsp_alta_subcategoria_categoria(6,'');
call bsp_alta_subcategoria_categoria(6,NULL);
call bsp_alta_subcategoria_categoria(6,'Álgebra');
call bsp_alta_subcategoria_categoria(6,'Geometría Descriptiva');
UPDATE Categorias SET EstadoCat = 'B' WHERE IdCategoria = 6;
call bsp_alta_subcategoria_categoria(6,'Geometría Descriptiva');
UPDATE Categorias SET EstadoCat = 'A' WHERE IdCategoria = 6;
call bsp_alta_subcategoria_categoria(16,'Geometría Descriptiva');

call bsp_alta_subcategoria_categoria(6,'Geometría Descriptiva');