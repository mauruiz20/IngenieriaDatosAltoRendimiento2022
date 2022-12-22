-- JSON
SELECT CAST('[	{"IdPersona": 11, "Nombre": "Estela"},
			{"IdPersona": 54, "Nombre": "Pedro"},
			{"IdPersona": 23, "Nombre": "Mónica"},
			{"IdPersona": 39, "Nombre": "Ana"}]' AS JSON) AS JsonDoc;
            
SET group_concat_max_len = 100000000;
use blog2019;
SELECT JSON_ARRAYAGG(JSON_OBJECT('IdCategoria', IdCategoria, 'Categoria', Categoria)) AS JsonCat
FROM Categorias;

SET @j = CAST('[	{"IdPersona": 11, "Nombre": "Estela"},
			{"IdPersona": 54, "Nombre": "Pedro"},
			{"IdPersona": 23, "Nombre": "Mónica"},
			{"IdPersona": 39, "Nombre": "Ana"}]' AS JSON);

SELECT JSON_EXTRACT(@j, '$[1].Nombre') AS Nombre;

SELECT JSON_UNQUOTE(JSON_EXTRACT(@j, '$[1].Nombre')) AS Nombre;

SELECT * FROM
JSON_TABLE (@j, '$[*]' COLUMNS(	IdPersona int PATH '$.IdPersona',
								Nombre varchar(50) PATH '$.IdPersona',
                                Orden FOR ORDINALITY)) AS j;