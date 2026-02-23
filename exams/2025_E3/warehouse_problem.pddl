(define (problem warehouse_problem)
(:domain warehouse_domain)

(:objects
    r1 r2 - robot
    storage_1 storage_2 - storage
    packing_station_1 - packing_station
    dock_1 dock_2 - loading_dock
    c1 c2 c3 - container
)

(:init
    (robot_at r1 packing_station_1)
    (robot_at r2 storage_2)

    ; Grippers are initially free
    (gripper_available r1)
    (gripper_available r2)

    (container_at c1 packing_station_1)
    (container_at c2 packing_station_1)
    (container_at c3 packing_station_1)

    (= (distance storage_1 storage_2) 2)
    (= (distance storage_2 storage_1) 2)
    (= (distance storage_1 packing_station_1) 3)
    (= (distance packing_station_1 storage_1) 3)
    (= (distance storage_2 packing_station_1) 5)
    (= (distance packing_station_1 storage_2) 5)
    (= (distance packing_station_1 dock_1) 4)
    (= (distance dock_1 packing_station_1) 4)
    (= (distance packing_station_1 dock_2) 6)
    (= (distance dock_2 packing_station_1) 6)

    (= (boxes_in_storage storage_1) 7)
    (= (boxes_in_storage storage_2) 5)
    (= (boxes_in_packing_station packing_station_1) 0)
)

(:goal
    (and
        ; All containers must be loaded with 4 boxes
        (container_loaded c1)
        (container_loaded c2)
        (container_loaded c3)

        ; Each container must be in its corresponding loading dock
        (container_at c1 dock_1)
        (container_at c2 dock_1)
        (container_at c3 dock_2)
    )
)

)
