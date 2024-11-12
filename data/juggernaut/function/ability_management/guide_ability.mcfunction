# TOTAL = ( 3000 * (PLAYERS + 1) ) / JUGGERNAUTS
# ONE PERCENT = TOTAL / 100
# X PERCENT = ONE PERCENT * X
scoreboard players set #added_amount var 0
scoreboard players set #guide_ability_percentage var 3
scoreboard players operation #added_amount var = #beginning_time var
scoreboard players operation #added_amount var *= #playercount var
scoreboard players operation #added_amount var += #beginning_time var
scoreboard players operation #added_amount var /= #juggernaut_multiplier var
scoreboard players operation #added_amount var /= #100 var
scoreboard players operation #added_amount var *= #guide_ability_percentage var

execute at @n[type=armor_stand,tag=replenishment.station,distance=..3] as @a[tag=runner,distance=..3] run scoreboard players operation @n[type=armor_stand,tag=juggernaut_manager] replenish_progress += #added_amount var
execute unless entity @n[type=armor_stand,tag=replenishment.station,distance=..3] run particle angry_villager ~ ~0.5 ~ 1 1 1 0 80 force
execute unless entity @n[type=armor_stand,tag=replenishment.station,distance=..3] run scoreboard players set @s jug_kit_cooldown 4
execute at @n[type=armor_stand,tag=replenishment.station,distance=..3] unless entity @a[tag=runner,distance=..3] run particle angry_villager ~ ~0.5 ~ 1 1 1 0 80 force
execute at @n[type=armor_stand,tag=replenishment.station,distance=..3] unless entity @a[tag=runner,distance=..3] run scoreboard players set @s jug_kit_cooldown 4
execute at @n[type=armor_stand,tag=replenishment.station,distance=..3] if entity @a[tag=juggernaut,distance=..12] run particle angry_villager ~ ~0.5 ~ 1 1 1 0 80 force
execute at @n[type=armor_stand,tag=replenishment.station,distance=..3] if entity @a[tag=juggernaut,distance=..12] run scoreboard players set @s jug_kit_cooldown 4