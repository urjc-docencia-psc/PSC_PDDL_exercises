(define (problem airport-scenario)
(:domain airport-management-basic)

(:objects
    airplane_1 - airplane
    airplane_2 - airplane
    airplane_3 - airplane
    airplane_4 - airplane
    airplane_5 - airplane
    runway_1 - runway
    gate_1 - gate
    gate_2 - gate
    gate_3 - gate
)

(:init
    (airplane_at airplane_1 runway_1)
    (airplane_at airplane_2 gate_2)
    (airplane_flying airplane_3)
    (airplane_flying airplane_4)
    (airplane_at airplane_5 gate_1)

    (location_free gate_3)

    (= (distance gate_1 gate_2) 10)
    (= (distance gate_2 gate_1) 10)
    (= (distance gate_1 gate_3) 15)
    (= (distance gate_3 gate_1) 15)
    (= (distance gate_2 gate_3) 5)
    (= (distance gate_3 gate_2) 5)

    (= (distance gate_1 runway_1) 30)
    (= (distance runway_1 gate_1) 30)
    (= (distance gate_2 runway_1) 30)
    (= (distance runway_1 gate_2) 30)
    (= (distance gate_3 runway_1) 30)
    (= (distance runway_1 gate_3) 30)
)

(:goal
    (and
        (airplane_at airplane_1 gate_2)
        (airplane_flying airplane_2)
        (airplane_at airplane_3 gate_1)
        (airplane_at airplane_4 gate_3)
        (airplane_flying airplane_5)
    )
)

)
