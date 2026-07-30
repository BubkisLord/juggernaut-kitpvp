scoreboard players set @s self_healing_base 2
scoreboard players set @s self_healing_modifier 100

# If being healed by another player
execute as @a[tag=runner,predicate=!is_sneaking,distance=..1.75] at @s run function juggernaut:healing/check_heal_player
execute if entity @a[tag=runner,predicate=!is_sneaking,scores={healing_modifier=1..},distance=..1.75] run scoreboard players add @s self_healing_base 3

execute if entity @a[tag=using_overwhelming_presence,distance=..20] run scoreboard players remove @s self_healing_modifier 15
execute if entity @a[tag=using_oppression] run scoreboard players remove @s self_healing_modifier 70
execute if entity @a[tag=using_deep_cuts] unless entity @a[tag=runner,predicate=!is_sneaking,scores={healing_modifier=1..},distance=..1.75] run scoreboard players remove @s self_healing_modifier 90

execute if entity @s[tag=using_healer] run scoreboard players add @s self_healing_modifier 250
execute if entity @s[tag=using_no_caution] run scoreboard players set @s self_healing_modifier 0

# Apply other player's healing to yourself.
scoreboard players operation @s self_healing_modifier += @a[tag=runner,predicate=!is_sneaking,distance=..1.75] healing_modifier

scoreboard players operation @s self_healing_per_tick = @s self_healing_base
scoreboard players operation @s self_healing_per_tick *= @s self_healing_modifier

scoreboard players operation @s self_healing_display_speed = @s self_healing_modifier
scoreboard players operation @s self_healing_display_speed -= #100 var

# Run healing function
function juggernaut:healing/try_self_heal

tag @s remove is_healing
tag @a[tag=runner,predicate=!is_sneaking,distance=..1.75] remove is_healer