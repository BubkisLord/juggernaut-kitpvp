scoreboard players set @s replenishment_base 1
scoreboard players set @s replenishment_modifier 100

# Puppetteer passive: replenishes at only 60% efficiency (perks still stack on top of this).
execute if entity @s[tag=puppetteer] run scoreboard players remove @s replenishment_modifier 40

execute if entity @a[tag=using_overwhelming_presence,distance=..20] run scoreboard players remove @s replenishment_modifier 15
execute if entity @s[tag=using_no_caution] run scoreboard players add @s replenishment_modifier 15
execute if entity @s[tag=using_unwavering_strength] if entity @e[type=armor_stand,tag=replenishment.station,distance=..3] if entity @a[tag=juggernaut,distance=..18] run scoreboard players add @s replenishment_modifier 100
execute if entity @s[tag=using_unwavering_strength] unless entity @e[type=armor_stand,tag=replenishment.station,distance=..3] if entity @e[type=armor_stand,tag=replenishment_tower,distance=..3] if entity @a[tag=juggernaut,distance=..18] run scoreboard players add @s replenishment_modifier 100
execute if entity @s[tag=using_any_means] run scoreboard players add @s replenishment_modifier 20

execute if entity @s[tag=using_tailgater,tag=in_chase] as @a[tag=runner,tag=in_chase,distance=0.1..120] at @s run tag @p[tag=juggernaut,tag=in_chase] add closest_chaser
execute if entity @s[tag=using_tailgater,tag=in_chase] run tag @s add tailgate_target
execute if entity @s[tag=using_tailgater,tag=in_chase] as @p[tag=juggernaut,tag=in_chase] if entity @s[tag=closest_chaser] as @p[tag=using_tailgater,tag=in_chase,tag=tailgate_target] run scoreboard players add @s replenishment_modifier 50
tag @a remove tailgate_target
tag @a remove closest_chaser

execute if entity @s[tag=jester,tag=jesting] run scoreboard players add @s replenishment_modifier 50

# execute if entity @s[tag=windrunner,tag=in_chase,tag=risky_business] unless entity @e[type=armor_stand,tag=replenishment.station,distance=..3] run scoreboard players add @s replenishment_modifier 100

execute if entity @a[tag=using_bane_of_solitude] unless entity @a[tag=runner,distance=0.1..6] run scoreboard players remove @s replenishment_modifier 15

execute if entity @n[type=armor_stand,tag=replenishment.station,distance=..3] at @n[type=armor_stand,tag=replenishment.station,distance=..3] if entity @e[type=armor_stand,tag=banishment_glyph,distance=..24] run scoreboard players set @s replenishment_modifier 0
execute if entity @s[tag=in_chase] at @n[type=armor_stand,tag=replenishment.station,tag=highest_station] if entity @e[type=armor_stand,tag=banishment_glyph,distance=..24] run scoreboard players set @s replenishment_modifier 0