-- Testing Stored Procedures Gestion Pagos 2022
SELECT * FROM Comercios;

CALL gestion_pagos2022.psp_buscar_comercios('', 'S', 0, 100);
CALL gestion_pagos2022.psp_crear_comercio('Computación', '3814567168', 'San Martin 130', 'San Miguel de Tucumán', 1, '55.12.145.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', 'Mozilla');
CALL gestion_pagos2022.psp_modificar_comercio(105, 'Electronica y Electrica', '3811234567', 'San Juan 530', 'San Miguel de Tucumán', 1, '55.12.145.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', 'Mozilla');
CALL gestion_pagos2022.psp_borrar_comercio(104, 1, '55.12.145.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', 'Mozilla');
CALL gestion_pagos2022.psp_dame_comercio(10);
CALL gestion_pagos2022.psp_daralta_comercio(10, 1, '55.12.145.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', 'Mozilla');
CALL gestion_pagos2022.psp_darbaja_comercio(10, 1, '55.12.145.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', 'Mozilla');

SELECT * FROM aud_Comercios;

SELECT * FROM Comercios c JOIN Usuarios u USING(IdComercio);

CALL gestion_pagos2022.psp_crear_usuario(1, 'Ruiz', 'Mauricio', '3811234567', 'ruizmauricio012@gmail.com', '12345678');
CALL gestion_pagos2022.psp_modificar_usuario(103, 'Ruiz', 'Mauricio', '3811234567', 'ruizmauricio012@gmail.com', '12345678');
CALL gestion_pagos2022.psp_borrar_usuario(104);
CALL gestion_pagos2022.psp_dame_usuario(103);
CALL gestion_pagos2022.psp_daralta_usuario(103);
CALL gestion_pagos2022.psp_darbaja_usuario(103);

SELECT * FROM MediosPago;

CALL gestion_pagos2022.psp_crear_medio_pago('Uala', 'Prepago', null);
CALL gestion_pagos2022.psp_modificar_medio_pago(8, 'Uala', 'Prepago', null);
CALL gestion_pagos2022.psp_borrar_medio_pago(8);
CALL gestion_pagos2022.psp_dame_medio_pago(9);

SELECT * FROM Planes JOIN MediosPago USING(IdMedioPago);

CALL gestion_pagos2022.psp_crear_plan(9, '123456', '5', 50.00);
CALL gestion_pagos2022.psp_modificar_plan(101, '123456', '6', 60.50);
CALL gestion_pagos2022.psp_borrar_plan(101);
CALL gestion_pagos2022.psp_dame_plan(101);