scoreboard players operation @s replenish_amount = @s replenishment_modifier
scoreboard players operation @s replenish_amount *= #40 var
scoreboard players operation @s replenish_amount *= #10 var
execute as @p[tag=guide] at @s at @n[type=armor_stand,tag=replenishment.station,distance=..3] as @a[tag=runner,distance=..3] if score #juggernaut_customisation completable_stations matches 1 run scoreboard players operation @n[type=armor_stand,tag=replenishment.station,distance=..3] replenish_amount += @s replenish_amount
execute as @p[tag=guide] at @s at @n[type=armor_stand,tag=replenishment.station,distance=..3] as @a[tag=runner,distance=..3] run scoreboard players operation #juggernaut_manager replenish_progress += @s replenish_amount
execute unless entity @n[type=armor_stand,tag=replenishment.station,distance=..3] run particle angry_villager ~ ~0.5 ~ 1 1 1 0 80 force
execute unless entity @n[type=armor_stand,tag=replenishment.station,distance=..3] run scoreboard players set @s ability_cooldown0 8000
