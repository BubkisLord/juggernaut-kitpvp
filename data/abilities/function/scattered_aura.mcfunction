scoreboard players remove @s scattered_steps_duration 1
effect give @s invisibility 1 0 true
particle cherry_leaves ~ ~0.5 ~ 6 1.5 6 0.05 30 force
particle campfire_cosy_smoke ~ ~0.5 ~ 1 1.5 1 0 1 force
item replace entity @s armor.chest with air
item replace entity @s armor.legs with air
item replace entity @s armor.feet with air
execute as @s[scores={scattered_steps_duration=0}] run item replace entity @s armor.chest with chainmail_chestplate
execute as @s[scores={scattered_steps_duration=0}] run item replace entity @s armor.legs with iron_leggings
execute as @s[scores={scattered_steps_duration=0}] run item replace entity @s armor.feet with iron_boots
execute as @s[scores={scattered_steps_duration=0}] run playsound minecraft:entity.wither.shoot master @s ~ ~ ~ 0.25 0.1