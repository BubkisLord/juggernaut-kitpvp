scoreboard players set @s cooldown_modifier 100

execute if entity @s[tag=using_overclock] run scoreboard players add @s cooldown_modifier 60
execute if entity @s[tag=using_optimised] run scoreboard players add @s cooldown_modifier 20
execute if entity @s[tag=using_any_means] at @s if entity @e[type=armor_stand,tag=replenishment.station,distance=..3] run scoreboard players remove @s cooldown_modifier 20
execute if entity @s[tag=runner] if entity @a[tag=using_swift_destruction] run scoreboard players remove @s cooldown_modifier 40

execute if entity @s[tag=using_swift_destruction] run scoreboard players add @s cooldown_modifier 40
execute if entity @s[tag=using_insidious,predicate=is_still] run scoreboard players add @s cooldown_modifier 100

# Cannot go negative, otherwise will build up more and more cooldown on abilities
execute if entity @s[scores={cooldown_modifier=..0}] run scoreboard players set @s cooldown_modifier 0

execute if score #juggernaut_customisation debug_mode matches 1 run scoreboard players set @s cooldown_modifier 9999