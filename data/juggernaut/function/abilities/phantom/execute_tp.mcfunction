tp @p[tag=phantom,tag=haunting_station] @n[type=armor_stand,tag=replenishment.station,tag=haunted_station]
execute at @p[tag=phantom,tag=haunting_station] run playsound block.end_portal_frame.fill master @a ~ ~ ~ 2 1 0
tag @e[type=armor_stand,tag=replenishment.station,tag=haunted_station] remove haunted_station
tag @a remove haunting_station