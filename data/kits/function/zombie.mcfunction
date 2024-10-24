tag @s remove lobby.player
clear @s
tag @s add zombie
effect give @s absorption 1000000 4 true
give @s wooden_sword[item_name='{"text":"Improvised Weapon","color":"dark_green","italic":false}',lore=['{"text":"It deals a surprising amount of damage.","color":"dark_gray"}'],unbreakable={},enchantments={sharpness:2},hide_additional_tooltip={}]
give @s cooked_beef[item_name='{"text":"Steak","color":"dark_green","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']] 16
item replace entity @s armor.head with zombie_head[item_name='{"text":"Zombie Head","color":"dark_green","italic":false}',lore=['{"text":"Take it off if you don\'t like it...","color":"dark_gray"}'],unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.chest with leather_chestplate[item_name='{"text":"Old Shirt","color":"dark_green","italic":false}',lore=['{"text":"Yields a little protection.","color":"dark_gray"}'],dyed_color=2553845,unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Classic Jeans","color":"dark_green","italic":false}',lore=['{"text":"The one and only pair.","color":"dark_gray"}'],dyed_color=3954156,unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.feet with leather_boots[item_name='{"text":"Zombie\'s Boots","color":"dark_green","italic":false}',lore=['{"text":"In a classy, grey colour.","color":"dark_gray"}'],dyed_color=4671303,unbreakable={},hide_additional_tooltip={}]
tp @s @e[tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Zombie ","color":"dark_green","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}