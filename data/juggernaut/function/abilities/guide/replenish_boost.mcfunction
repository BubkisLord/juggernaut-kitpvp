execute at @n[type=armor_stand,tag=replenishment.station,distance=..3] as @a[tag=runner,distance=..3] run function juggernaut:replenishment_management/add_replenishment_percent {percentage:3}

execute unless entity @n[type=armor_stand,tag=replenishment.station,distance=..3] run particle angry_villager ~ ~0.5 ~ 1 1 1 0 80 force
execute unless entity @n[type=armor_stand,tag=replenishment.station,distance=..3] run scoreboard players set @s jug_kit_cooldown 4
execute at @n[type=armor_stand,tag=replenishment.station,distance=..3] if entity @a[tag=juggernaut,distance=..12] run particle angry_villager ~ ~0.5 ~ 1 1 1 0 80 force
execute at @n[type=armor_stand,tag=replenishment.station,distance=..3] if entity @a[tag=juggernaut,distance=..12] run scoreboard players set @s jug_kit_cooldown 4