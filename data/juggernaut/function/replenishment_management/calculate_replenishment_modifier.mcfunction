scoreboard players set @s replenish_buff 0
scoreboard players set @s replenish_debuff 0

execute as @a[tag=using_overwhelming_presence] at @s as @a[tag=runner,distance=..15] run scoreboard players add @s replenish_debuff 15

execute as @a[tag=using_bane_of_solidarity] run scoreboard players add @p[tag=runner] replenish_debuff 5

execute as @a[tag=beacon_of_hope_active] run scoreboard players add @p[tag=runner] replenish_buff 100