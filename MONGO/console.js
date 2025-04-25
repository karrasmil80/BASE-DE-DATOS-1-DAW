use PRUEBA
// 1. Mostrar todos los datos de la colección ciclos.
db.ciclos.find();
// 2. Contar todos los datos
db.ciclos.countDocuments();
// 3. Mostrar solo los ciclos de 2º.
db.ciclos.find(
    { Grupo: 2 }
);

// 4. Mostrar solo los ciclos de 1º pero solo el nombre y el grupo
db.ciclos.find(
    { Grupo: 1 }, //Filtral el grupo
    { Nivel: 0, NumAlumnos: 0, Alumnos: 0, _id: 0 } //Inicializar a 0 los datos que no queramos mostrar
);
// 5. Mostrar de los ciclos de 1º los que sean de Nivel Medio
db.ciclos.find(
    { Grupo: 1, Nivel: 'Medio' },
    { Alumnos: 0, _id: 0, Grupo: 0, NumAlumnos: 0 }
);

// 6. Ordenar descendentemente por nombre
db.ciclos.find().sort(
    { Nombre: -1 }
);

// 7. Ordenar ascendentemente por nombre
db.ciclos.find().sort(
    { Nombre: 1 }
);

// 8. Mostrar solo el primer registro de la colección ciclos.
db.ciclos.findOne();

// 9. Mostrar solo el ultimo registro de la colección ciclos.
db.ciclos.find().sort(
    { _id: -1}
).limit(1);
/*
AGREGACIONES (SIMILAR GROUP BY Y HAVING EN SQL)
-----------------------------------------------
Se usa para realizar operaciones avanzadas y permite realizar cálculos, filtrados y agrupaciones.
• $match: Filtra los documentos según ciertos criterios, similar a una cláusula WHERE en SQL.
• $group: Agrupa los documentos por un campo específico y permite realizar operaciones de agregación, como contar, sumar o calcular promedios.
• $sort: Ordena los documentos según uno o más campos.
• $project: Modifica la forma de los documentos, permitiendo incluir o excluir campos específicos y crear nuevos campos.
• $limit: Limita el número de documentos devueltos.
• $skip: Omite un número específico de documentos en la salida.
Ejemplo: Sacar los documentos de ciclos (ordenado por el total de alumnos en orden descendente) incluyendo solo aquellos del grupo 1, agrupando los resultados por el nombre del ciclo y sumando el número de alumnos, y finalmente
*/
db.ciclos.aggregate([
  { $match: { Grupo: 1 } }, // Filtra solo los grupos 1
  { $group: { _id: "$Nombre", totalAlumnos: { $sum: "$NumAlumnos" } } }, // Agrupa por Nombre y suma NumAlumnos
  { $sort: { totalAlumnos: -1 } } // Ordena por totalAlumnos de forma descendente
]);

// 10. Contar cuántos alumnos hay en cada ciclo usando agregación:
db.ciclos.aggregate([
    { $group: {_id: '$Nombre', totalAlumnos: { $sum: "$NumAlumnos"}}}
])
// 11. Mostrar el número de ciclos por nivel:

db.ciclos.aggregate([
    { $group: { _id: '$Nivel', num_ciclos: { $sum: 1}}}
])

// 12.Mostrar el promedio de edad de los alumnos por ciclo:

db.ciclos.aggregate([
    { $unwind: "$Alumnos"},
    { $group: { _id: '$Nombre', avg_edad: { $avg: '$Alumnos.Edad'}}}
]);

// 13. Mostrar solo los ciclos de nivel "Alto"

db.ciclos.aggregate([
    { $unwind: "$Alumnos"},
    { $match: { Nivel: 'Alto'}},
    { $group: { _id: '$Nombre', avg_edad: { $avg: '$Alumnos.Edad'}}}
]);

// 14. Mostrar solo el nombre de los ciclos de nivel "Medio" y el número de alumnos

db.ciclos.aggregate([
    { $match: { Nivel: 'Medio'}},
    { $group: { _id: '$Nombre', num_alumnos: { $sum: '$NumAlumnos'}}}
]);

// 15. Mostrar solo los ciclos de nivel "Bajo", excluyendo el campo `_id`

db.ciclos.find(
    { Nivel : 'Bajo'},
    { _id: 0}
);

// 16. Agrupar por ciclo y contar cuántos alumnos de cada ciclo tienen más de 23 años:

db.ciclos.aggregate([
    { $unwind: "$Alumnos"},
    { $match: { "Alumnos.Edad": { $gt:23}}},
    { $group: {_id: '$Nombre', alumnos_23: { $sum: 1}}}
]);


// 17. Mostrar los ciclos con el número total de alumnos por grupo:

// 18. Agrupar los ciclos por nombre y calcular la edad máxima de los alumnos en cada ciclo:

db.ciclos.aggregate([
    { $unwind: "$Alumnos"},
    { $group: {_id: '$Nombre', max_edad: { $max: "$Alumnos.Edad"}}}
]);

// 19. Mostrar los ciclos que tienen al menos un alumno de edad superior a 24 años:

db.ciclos.find(
    { "Alumnos.Edad": {$gt: 24}}
);

// 20. Contar cuántos ciclos existen por cada grupo:

db.ciclos.aggregate([
    { $group: {_id: '$Grupo', num_ciclos: { $sum: 1}}}
]);

// 21. Mostrar el promedio de edad de los alumnos para cada nivel de ciclo:

db.ciclos.aggregate([
    { $unwind: "$Alumnos"},
    { $group: {_id: '$Nivel', avg_edad: { $avg: "$Alumnos.Edad"}}}
]);