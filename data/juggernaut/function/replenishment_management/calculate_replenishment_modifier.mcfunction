scoreboard players set @s replenish_buff 0
scoreboard players set @s replenish_debuff 0

execute if entity @a[tag=using_overwhelming_presence,distance=..20] run scoreboard players add @s replenish_debuff 15
execute if entity @s[tag=using_no_caution] run scoreboard players add @s replenish_buff 15
execute if entity @s[tag=using_unwavering_strength] if entity @a[tag=juggernaut,distance=..12] run scoreboard players add @s replenish_buff 100

execute if entity @a[tag=using_bane_of_solitude] unless entity @a[tag=runner,distance=0.1..6] run scoreboard players add @s replenish_debuff 5