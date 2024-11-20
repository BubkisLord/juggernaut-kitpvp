scoreboard players set @a replenish_buff 0
scoreboard players set @a replenish_debuff 0

execute if entity @a[tag=using_overwhelming_presence,distance=..15] run scoreboard players add @s replenish_debuff 15

execute if entity @a[tag=using_bane_of_solidarity] unless entity @a[distance=0.5..8] run scoreboard players add @s replenish_debuff 5

execute if entity @s[tag=beacon_of_hope_active] run scoreboard players add @s replenish_buff 10