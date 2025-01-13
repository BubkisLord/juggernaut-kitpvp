tag @s remove lobby.player
clear @s
tag @s add flame
effect give @s minecraft:fire_resistance 1000000 100 true
give @s golden_sword[item_name='{"text":"Sunblade","color":"dark_aqua","italic":false}',lore=['{"text":"Enemies struck will burn forever.","color":"dark_gray"}'],unbreakable={},enchantments={fire_aspect:255},hide_additional_tooltip={}]
give @s bow[item_name='{"text":"Flaming Bow","color":"dark_aqua","italic":false}',lore=['{"text":"Ready! Aim! FIRE! Badum-tiss.","color":"dark_gray"}'],unbreakable={},enchantments={flame:1},hide_additional_tooltip={}]
give @s cooked_beef[item_name='{"text":"Steak","color":"dark_aqua","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']]
give @s arrow[item_name='{"text":"Feathered Arrow","color":"dark_aqua","italic":false}',lore=['{"text":"Aiming is the key.","color":"dark_gray"}']]
item replace entity @s armor.head with blaze_powder[item_name='{"text":"Eternal Flame","color":"dark_aqua","italic":false}',lore=['{"text":"If it wasn\'t for that Fire Resistance...","color":"dark_gray"}'],dyed_color=15660787,unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Flaming Leggings","color":"dark_aqua","italic":false}',lore=['{"text":"Highly flammable.","color":"dark_gray"}'],dyed_color=16409374,unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.feet with leather_boots[item_name='{"text":"Fiery Boots","color":"dark_aqua","italic":false}',lore=['{"text":"Leaves a trail of sparks.","color":"dark_gray"}'],dyed_color=16409374,unbreakable={},hide_additional_tooltip={}]
tp @s @e[type=armor_stand,tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Flame ","color":"dark_aqua","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}