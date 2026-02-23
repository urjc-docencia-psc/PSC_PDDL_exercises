## Enunciado examen

Nos han pedido automatizar el sistema de gestión de tráfico de un pequeño aeropuerto,
y hemos decidido utilizar PDDL para modelar el sistema y poder resolver el problema con un planificador temporal como POPF.

En el aeropuerto tendremos una pista (runway) y varias puertas de embarque. Los pasajeros se modelarán como "grupos de embarque" (`passenger_group`) y se asume que cualquier grupo de embarque cabe dentro de cualquier avión.
Ninguna ubicación puede estar ocupada al mismo tiempo por dos aviones distintos.

En el sistema propuesto, se plantean las siguientes acciones:

* Taxi (`taxi`): Un avión se mueve por tierra entre dos ubicaciones del aeropuerto (pista o puerta de embarque).
Cuando un avión se desplaza entre dos ubicaciones, las dos ubicaciones quedarán bloqueadas (no las podrá ocupar ningún otro avión) hasta que termine la acción.
La duración del movimiento depende de la distancia entre origen y destino.

* Despegue (`takeoff`): Un avión despega desde una pista. El avión deberá llevar un grupo de pasajeros para poder despegar.
Durante la acción de despegue, la pista se considerará bloqueada y no podrá ser ocupada por ningún otro avión.

* Aterrizaje (`land`): Un avión que esté volando aterriza en una pista. Durante la acción de aterrizaje, la pista se considerará bloqueada y no podrá ser ocupada por ningún otro avión.

* Embarque (`board`): Un grupo de pasajeros embarca en un avión en una puerta. Para ello, el avión debe estar libre al inicio (no llevar pasajeros).

* Desembarque (`disembark`): Un grupo de pasajeros desembarca de un avión en una puerta. El avión volverá a estar disponible al terminar el desembarque.


Se dispone de un problema PDDL de referencia en el archivo adjunto [airport_problem.pddl](airport_problem.pddl) y del plan generado para este problema por el planificador POPF (con las opciones por defecto) en [popf_output.txt](popf_output.txt).
Implementa el dominio PDDL para el sistema de planificación propuesto, de tal forma que al ejecutar POPF con el dominio implementado y el problema de referencia se genere la siguiente salida:

```
0.000: (taxi airplane_2 gate_2 gate_3)  [10.000]
0.000: (board airplane_5 gate_1 passengers_5)  [70.000]
10.001: (taxi airplane_1 runway_1 gate_2)  [60.000]
10.001: (board airplane_2 gate_3 passengers_2)  [70.000]
70.002: (disembark airplane_1 gate_2 passengers_1)  [70.000]
70.002: (taxi airplane_5 gate_1 runway_1)  [60.000]
130.003: (takeoff airplane_5 runway_1 passengers_5)  [15.000]
140.003: (board airplane_1 gate_2 passengers_6)  [70.000]
145.004: (taxi airplane_2 gate_3 runway_1)  [60.000]
205.005: (takeoff airplane_2 runway_1 passengers_2)  [15.000]
220.006: (land airplane_3 runway_1)  [20.000]
240.007: (taxi airplane_3 runway_1 gate_1)  [60.000]
300.007: (disembark airplane_3 gate_1 passengers_3)  [70.000]
300.008: (land airplane_4 runway_1)  [20.000]
320.009: (taxi airplane_4 runway_1 gate_3)  [60.000]
380.009: (disembark airplane_4 gate_3 passengers_4)  [70.000]
380.010: (taxi airplane_1 gate_2 runway_1)  [60.000]
440.011: (takeoff airplane_1 runway_1 passengers_6)  [15.000]
```

Nota: Es posible que la salida generada por POPF no sea exactamente igual que la proporcionada, pero las restricciones temporales y las duraciones de las acciones se deben respetar.

Entrega:
Deberás subir un fichero (airport_domain.pddl) con el dominio pddl para este sistema de planificación.
