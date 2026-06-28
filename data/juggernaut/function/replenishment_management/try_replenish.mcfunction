execute unless score #game_state var matches 11 run return fail
execute if entity @e[type=armor_stand,tag=banishment_glyph,distance=..24] run particle flame ~ ~2.5 ~ 0.3 1 0.3 0 30 force
execute if entity @e[type=armor_stand,tag=banishment_glyph,distance=..24] run return fail
execute if entity @s[tag=rogue] if entity @a[tag=juggernaut,distance=12..24,tag=!is_undetectable] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @s
execute if entity @a[tag=juggernaut,distance=..12,tag=!is_undetectable] run particle minecraft:witch ~ ~2.5 ~ 0.2 60 0.2 0 120 force @s
execute if entity @a[tag=juggernaut,distance=..12] if entity @s[tag=!using_unwavering_strength] if entity @s[tag=!in_chase] run return fail
execute if entity @s[tag=spectral_cloak_active] run return fail

scoreboard players add #juggernaut_manager replenish_progress 1
scoreboard players add @n[type=armor_stand,tag=replenishment.station] replenish_amount 1
scoreboard players set @n[type=armor_stand,tag=replenishment.station] replenish_timeout 6

execute if entity @s[tag=has_respawn_time,tag=!in_chase] run function juggernaut:clear_respawn_period
execute if entity @s[tag=using_sentinel] run scoreboard players add @n[type=armor_stand,tag=replenishment.station] sentinel_progress 1
execute if entity @s[tag=using_sentinel] as @n[type=armor_stand,tag=replenishment.station] if score @s sentinel_progress matches 160.. run tag @s add sentinel_tower

execute if entity @s[tag=!in_chase] at @s run particle end_rod ~ ~ ~ 0.5 1 0.5 0.00001 1 force

scoreboard players add @s ticks_spent_replenishing 1

scoreboard players operation @s ticks_spent_buffing = @s ticks_spent_replenishing
scoreboard players operation @s ticks_till_increment = #300 var
scoreboard players operation @s ticks_till_increment /= @s replenish_buff
scoreboard players operation @s ticks_spent_buffing %= @s ticks_till_increment
execute if entity @s[scores={replenish_buff=1..,ticks_spent_buffing=0}] run scoreboard players add @n[type=armor_stand,tag=replenishment.station] replenish_amount 1
execute if entity @s[scores={replenish_buff=1..,ticks_spent_buffing=0}] run scoreboard players add #juggernaut_manager replenish_progress 1

scoreboard players operation @s ticks_spent_debuffing = @s ticks_spent_replenishing
scoreboard players operation @s ticks_till_decrement = #300 var
scoreboard players operation @s ticks_till_decrement /= @s replenish_debuff
scoreboard players operation @s ticks_spent_debuffing %= @s ticks_till_decrement
execute if entity @s[scores={replenish_debuff=1..,ticks_spent_debuffing=0}] run scoreboard players remove @n[type=armor_stand,tag=replenishment.station] replenish_amount 1
execute if entity @s[scores={replenish_debuff=1..,ticks_spent_debuffing=0}] run scoreboard players remove #juggernaut_manager replenish_progress 1