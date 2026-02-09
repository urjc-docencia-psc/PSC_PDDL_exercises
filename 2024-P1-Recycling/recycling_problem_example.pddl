(define (problem recycling_example)
(:domain recycling_example)
; We define 3 different items, 2 types of trash bins, one table and a robot
(:objects
  table floor - location
  organic_trashbin - location
  paper_trashbin - location
  bottle newspaper rotten_apple - item
  walle - robot
)

; Initially everything is on the floor and robot is by the table
(:init
  (robot_at walle table)
  (gripper_free walle)
  (item_at bottle floor)
  (item_at newspaper floor)
  (item_at rotten_apple floor)
)

; The goal is to clean the floor!
(:goal (and
    (item_at bottle table)
    (item_at rotten_apple organic_trashbin)
    (item_at newspaper paper_trashbin)
  )
)

)
