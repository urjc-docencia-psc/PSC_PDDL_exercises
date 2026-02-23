## Enunciado examen

En un centro de paquetería robotizado se desea integrar un sistema de planificación para mejorar el proceso logístico.
En el centro hay varias zonas de almacenaje donde se guardan cajas, y estaciones de empaquetado donde se empaquetan las cajas en contenedores más grandes.
Cada contenedor se debe llenar con 4 cajas antes de poder enviarlo. Una vez el contenedor está listo, es transportado a una de los muelles de carga del centro.

En el centro hay robots capaces de mover tanto las cajas como los contenedores. Un robot sólo puede llevar un objeto a la vez (una caja o un contenedor).

Hay tres tipos de ubicaciones:
* `storage`: Representa una zona de almacenaje del centro de paquetería. Un almacén puede tener un número definido de cajas.
* `packing_station`: Representa una estación de empaquetado. En estas zonas hay una máquina que llena contenedores con las cajas que haya en la estación.
* `loading_dock`: Representa un muelle de carga donde los contenedores cargados abandonan el centro de paquetería.


En el sistema propuesto, se plantean las siguientes acciones:

* `move`: Un robot se mueve de un punto a otro dentro del centro. La duración del movimiento depende de la distancia entre las dos ubicaciones.
* `pick_box`: Un robot carga una caja de un almacén. Se debe actualizar el número de cajas que hay en el almacén.
* `place_box`: Un robot suelta una caja en la estación de empaquetado. Se debe actualizar el número de cajas que hay en la estación.
* `fill_container`: La estación de empaquetado carga cuatro cajas en un contenedor. Para ello, debe haber un contenedor y al menos cuatro cajas en la estación.
* `transport_container`: Un robot transporta un contenedor de una estación de empaquetado a un muelle de carga. El contenedor debe estar listo para el envío (cargado con cuatro cajas).


En el proceso, los robots mueven las cajas de una en una de los almacenes a las estaciones de empaquetado, donde se cargan los contenedores.
Depsués, los robots transportan los contenedores llenos a los muelles de carga.


Se dispone de un problema PDDL de referencia en el archivo adjunto [warehouse_problem.pddl](warehouse_problem.pddl) y del plan generado para este problema por el planificador POPF (con las opciones por defecto) en [popf_output.txt](popf_output.txt).

Implementa el dominio PDDL para el sistema de planificación propuesto, de tal forma que al ejecutar POPF con el dominio implementado y el problema de referencia se genere la siguiente salida:

```
0.000: (pick_box r2 storage_2)  [2.000]
0.000: (move r1 packing_station_1 storage_1)  [3.000]
2.000: (move r2 storage_2 packing_station_1)  [5.000]
3.001: (pick_box r1 storage_1)  [2.000]
5.001: (move r1 storage_1 packing_station_1)  [3.000]
7.000: (place_box r2 packing_station_1)  [1.000]
8.000: (move r2 packing_station_1 storage_1)  [3.000]
8.001: (place_box r1 packing_station_1)  [1.000]
9.001: (move r1 packing_station_1 storage_1)  [3.000]
11.000: (pick_box r2 storage_1)  [2.000]
12.001: (pick_box r1 storage_1)  [2.000]
13.000: (move r2 storage_1 packing_station_1)  [3.000]
14.001: (move r1 storage_1 packing_station_1)  [3.000]
16.000: (place_box r2 packing_station_1)  [1.000]
17.000: (move r2 packing_station_1 storage_1)  [3.000]
17.001: (place_box r1 packing_station_1)  [1.000]
18.001: (move r1 packing_station_1 storage_1)  [3.000]
18.002: (fill_container packing_station_1 c1)  [10.000]
20.000: (pick_box r2 storage_1)  [2.000]
21.001: (pick_box r1 storage_1)  [2.000]
22.000: (move r2 storage_1 packing_station_1)  [3.000]
23.001: (move r1 storage_1 packing_station_1)  [3.000]
26.001: (place_box r1 packing_station_1)  [1.000]
26.002: (place_box r2 packing_station_1)  [1.000]
27.001: (move r1 packing_station_1 storage_1)  [3.000]
27.002: (move r2 packing_station_1 storage_1)  [3.000]
30.001: (pick_box r1 storage_1)  [2.000]
30.002: (pick_box r2 storage_1)  [2.000]
32.001: (move r1 storage_1 packing_station_1)  [3.000]
32.002: (move r2 storage_1 packing_station_1)  [3.000]
35.001: (place_box r1 packing_station_1)  [1.000]
35.002: (place_box r2 packing_station_1)  [1.000]
36.001: (transport_container r1 c1 packing_station_1 dock_1)  [4.000]
36.002: (move r2 packing_station_1 storage_2)  [5.000]
36.003: (fill_container packing_station_1 c2)  [10.000]
40.002: (move r1 dock_1 packing_station_1)  [4.000]
41.002: (pick_box r2 storage_2)  [2.000]
43.002: (move r2 storage_2 packing_station_1)  [5.000]
44.003: (move r1 packing_station_1 storage_2)  [5.000]
48.002: (place_box r2 packing_station_1)  [1.000]
49.002: (move r2 packing_station_1 storage_2)  [5.000]
49.003: (pick_box r1 storage_2)  [2.000]
51.003: (move r1 storage_2 packing_station_1)  [5.000]
54.002: (pick_box r2 storage_2)  [2.000]
56.002: (move r2 storage_2 packing_station_1)  [5.000]
56.003: (place_box r1 packing_station_1)  [1.000]
57.003: (move r1 packing_station_1 storage_2)  [5.000]
61.002: (place_box r2 packing_station_1)  [1.000]
62.002: (transport_container r2 c2 packing_station_1 dock_1)  [4.000]
62.003: (pick_box r1 storage_2)  [2.000]
64.003: (move r1 storage_2 packing_station_1)  [5.000]
69.003: (place_box r1 packing_station_1)  [1.000]
70.004: (fill_container packing_station_1 c3)  [10.000]
80.004: (transport_container r1 c3 packing_station_1 dock_2)  [6.000]
```

Nota: Es posible que la salida generada por POPF no sea exactamente igual que la proporcionada, pero las restricciones planteadas y las duraciones de las acciones se deben respetar.

Entrega:
Deberás subir un fichero (domain.pddl) con el dominio pddl para este sistema de planificación.


