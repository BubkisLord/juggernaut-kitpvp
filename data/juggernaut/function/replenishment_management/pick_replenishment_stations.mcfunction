$execute as @e[type=armor_stand,tag=replenishment.station,limit=$(total_stations),sort=random] run tag @s add replenishment.station_active
execute as @e[type=armor_stand,tag=replenishment.station,tag=!replenishment.station_active] run tag @s add replenishment.station_deactivated
execute as @e[type=armor_stand,tag=replenishment.station_deactivated] run tag @s remove replenishment.station
execute as @e[type=armor_stand,tag=replenishment.station_active] run tag @s remove replenishment.station_active