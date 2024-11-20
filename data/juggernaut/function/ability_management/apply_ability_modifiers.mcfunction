scoreboard players add @s ticks_spent_on_ability 1
scoreboard players operation @s ticks_spent_on_ability_buff = @s ticks_spent_on_ability
scoreboard players operation @s ticks_till_increment_ability = #100 var
execute as @s[scores={ability_buff=1..}] run scoreboard players operation @s ticks_till_increment_ability /= @s ability_buff
execute as @s[scores={ability_buff=1..}] run scoreboard players operation @s ticks_spent_on_ability_buff %= @s ticks_till_increment_ability
execute as @s[scores={ability_buff=1..,ticks_spent_on_ability_buff=0}] run scoreboard players remove @s jug_kit_cooldown 1

scoreboard players operation @s ticks_spent_on_ability_debuff = @s ticks_spent_on_ability
scoreboard players operation @s ticks_till_decrement_ability = #100 var
execute as @s[scores={ability_debuff=1..}] run scoreboard players operation @s ticks_till_decrement_ability /= @s ability_debuff
execute as @s[scores={ability_debuff=1..}] run scoreboard players operation @s ticks_spent_on_ability_debuff %= @s ticks_till_decrement_ability
execute as @s[scores={ability_debuff=1..,ticks_spent_on_ability_debuff=0}] run scoreboard players add @s jug_kit_cooldown 1