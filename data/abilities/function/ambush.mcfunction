execute at @s run particle campfire_cosy_smoke ~ ~-0.3 ~ 1 1 1 0.1 200 force
execute at @s run playsound minecraft:block.ender_chest.open master @a ~ ~ ~ 1.2 0
execute at @s run playsound minecraft:entity.minecart.riding master @a ~ ~ ~ 0.3 0
execute at @s as @p[tag=ambusher] run tag @s add ambush_cooldown
execute at @s as @p[tag=ambusher] run scoreboard players set @s ambushDisplay 30
execute at @s as @p[tag=ambusher] run item replace entity @s hotbar.1 with popped_chorus_fruit[item_name={"text":"Drained Star","color":"dark_purple","italic":false},lore=[{"text":"Ambush Enemy is on cooldown.","color":"dark_gray"}]]
execute at @s as @p[tag=ambusher] run function abilities:ambush_spell
kill @s