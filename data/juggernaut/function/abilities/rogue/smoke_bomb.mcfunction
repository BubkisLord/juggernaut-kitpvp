effect give @s invisibility 6 0 true
particle campfire_cosy_smoke ~ ~ ~ 4 3 4 0 1200 force @a[tag=juggernaut]
execute if entity @s[scores={jug_kit_cooldown_2=..30}] run scoreboard players set @s jug_kit_cooldown_2 30