# execute as @p[tag=guide] at @s at @n[type=armor_stand,tag=replenishment.station,distance=..3] as @a[tag=runner,distance=..3] run function juggernaut:replenishment_management/add_replenishment_percent {percentage:10}
execute as @p[tag=guide] at @s at @n[type=armor_stand,tag=replenishment.station,distance=..3] as @a[tag=runner,distance=..3] if score #juggernaut_customisation completable_stations matches 1 run scoreboard players add @n[type=armor_stand,tag=replenishment.station,distance=..3] replenish_amount 400
execute as @p[tag=guide] at @s at @n[type=armor_stand,tag=replenishment.station,distance=..3] as @a[tag=runner,distance=..3] run scoreboard players add #juggernaut_manager replenish_progress 400

execute unless entity @n[type=armor_stand,tag=replenishment.station,distance=..3] run particle angry_villager ~ ~0.5 ~ 1 1 1 0 80 force
execute unless entity @n[type=armor_stand,tag=replenishment.station,distance=..3] run scoreboard players set @s jug_kit_cooldown 4
